import 'dart:typed_data';

import 'package:firebase_news_full_app/product/models/category.dart';
import 'package:firebase_news_full_app/product/utility/firebase/firebase_collection.dart';
import 'package:firebase_news_full_app/product/utility/firebase/firebase_utility.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddNewLogic with FirebaseUtilty {
  final TextEditingController titleController = TextEditingController();
  Category? _category;
  List<Category> _categories = [];
  List<Category> get categories => _categories;

  Uint8List? _selectedFileBytes;
  Uint8List? get selectedFileBytes => _selectedFileBytes;

  void updateCategory(Category category) {
    _category = category;
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    // Pick an image.
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) return;
    _selectedFileBytes = await image.readAsBytes();
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
