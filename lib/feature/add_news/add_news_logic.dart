import 'dart:typed_data';

import 'package:firebase_news_full_app/product/models/category.dart';
import 'package:firebase_news_full_app/product/utility/Image/pick_image.dart';
import 'package:firebase_news_full_app/product/utility/firebase/firebase_collection.dart';
import 'package:firebase_news_full_app/product/utility/firebase/firebase_utility.dart';
import 'package:flutter/material.dart';

class AddNewLogic with FirebaseUtilty {
  final TextEditingController titleController = TextEditingController();
  Category? _category;
  List<Category> _categories = [];
  List<Category> get categories => _categories;
  bool isValidateForm = false;
  GlobalKey<FormState> formKey = GlobalKey();

  Uint8List? _selectedFileBytes;
  Uint8List? get selectedFileBytes => _selectedFileBytes;

  void updateCategory(Category category) {
    _category = category;
  }

  void chechkValidate(ValueSetter<bool> onUpdate) {
    final value = formKey.currentState?.validate() ?? false;

    if (value != isValidateForm && selectedFileBytes != null) {
      isValidateForm = value;
      onUpdate.call(value);
    }
  }

  Future<void> pickImageAndValidate(ValueSetter<bool> onUpdate) async {
    _selectedFileBytes = await PickImage().pickImageFromGallery();
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
    _category = null;
  }
}
