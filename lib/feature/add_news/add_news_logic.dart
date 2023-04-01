import 'dart:typed_data';

import 'package:firebase_news_full_app/product/models/category.dart';
import 'package:firebase_news_full_app/product/models/news.dart';
import 'package:firebase_news_full_app/product/utility/Image/pick_image.dart';
import 'package:firebase_news_full_app/product/utility/firebase/firebase_collection.dart';
import 'package:firebase_news_full_app/product/utility/firebase/firebase_utility.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddNewLogic with FirebaseUtilty {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController authorController = TextEditingController();
  Category? _category;
  List<Category> _categories = [];
  List<Category> get categories => _categories;
  bool isValidateForm = false;
  GlobalKey<FormState> formKey = GlobalKey();

  XFile? _selectedImage;
  Uint8List? _selectedFileBytes;
  Uint8List? get selectedFileBytes => _selectedFileBytes;

  void updateCategory(Category category) {
    _category = category;
  }

  bool chechkValidate(ValueSetter<bool>? onUpdate) {
    final value = formKey.currentState?.validate() ?? false;

    if (value != isValidateForm && selectedFileBytes != null) {
      isValidateForm = value;
      onUpdate?.call(value);
    }
    return isValidateForm;
  }

  Future<void> pickImageAndValidate(ValueSetter<bool> onUpdate) async {
    _selectedImage = await PickImage().pickImageFromGallery();
    _selectedFileBytes = await _selectedImage?.readAsBytes();
    chechkValidate((value) {});
    onUpdate.call(true);
  }

  Future<void> fetchCategory() async {
    final response = await fetchList<Category, Category>(
      Category(),
      FirebaseCollection.category,
    );
    _categories = response ?? [];
  }

  void dispose() {
    titleController.dispose();
    authorController.dispose();
    _category = null;
  }

  Future<bool> addNewsToFirebaseCollection() async {
    if (!chechkValidate(null)) return false;
    final imageReference = createImageReference();
    if (imageReference == null) throw Exception('Image reference is empty');
    if (_selectedFileBytes == null) return false;
    await imageReference.putData(_selectedFileBytes!);
    final imageUrlPath = await imageReference.getDownloadURL();

    final response = await FirebaseCollection.news.reference.add(
      News(
        backgroundImage: imageUrlPath,
        author: authorController.text,
        category: _category?.name,
        categoryId: _category?.id,
        title: titleController.text,
      ).toJson(),
    );

    if (response.id.isEmpty) return false;
    return true;
  }

  Reference? createImageReference() {
    if (_selectedImage == null || (_selectedImage?.name.isEmpty ?? true)) {
      return null;
    }
    final storageRef = FirebaseStorage.instance.ref();

    // Create a reference to "selected image"
    final imageRef = storageRef.child(_selectedImage!.name);
    return imageRef;
  }
}
