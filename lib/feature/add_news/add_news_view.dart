import 'package:firebase_news_full_app/product/constants/color_constants.dart';
import 'package:firebase_news_full_app/product/constants/string_constants.dart';
import 'package:firebase_news_full_app/product/models/category.dart';
import 'package:firebase_news_full_app/product/utility/firebase/firebase_collection.dart';
import 'package:firebase_news_full_app/product/utility/firebase/firebase_utility.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class AddNewsView extends StatefulWidget {
  const AddNewsView({super.key});

  @override
  State<AddNewsView> createState() => _AddNewsViewState();
}

class _AddNewsViewState extends State<AddNewsView> with FirebaseUtilty {
  List<Category> _category = [];
  late final Category? _selectedCategory;

  @override
  void initState() {
    super.initState();
    fetchCategory();
  }

  Future<void> fetchCategory() async {
    final response = await fetchList<Category, Category>(
      Category(),
      FirebaseCollection.category,
    );
    setState(() {
      _category = response ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConstants.addNewsAppbar),
      ),
      body: Form(
        child: Padding(
          padding: context.paddingNormal,
          child: ListView(
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  color: ColorConst.white,
                  border: Border.all(color: ColorConst.grayScale),
                  borderRadius: context.lowBorderRadius,
                ),
                child: DropdownButtonFormField<Category>(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.category_outlined),
                  ),
                  style: context.textTheme.bodyLarge,
                  items: _category.map((items) {
                    return DropdownMenuItem<Category>(
                      value: items,
                      child: Text(items.name ?? ''),
                    );
                  }).toList(),
                  hint: const Text(StringConstants.addNewsSelectCategory),
                  onChanged: (value) {
                    _selectedCategory = value;
                  },
                ),
              ),
              const EmptySizedBoxLow(),
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.title_outlined),
                  hintText: StringConstants.addNewsEnterTitle,
                ),
              ),
              const EmptySizedBoxLow(),
              InkWell(
                onTap: () {},
                child: SizedBox(
                  height: context.dynamicHeight(0.2),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(color: ColorConst.grayScale),
                      borderRadius: context.lowBorderRadius,
                    ),
                    child: const Icon(Icons.photo_camera_outlined),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EmptySizedBoxLow extends StatelessWidget {
  const EmptySizedBoxLow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(child: context.emptySizedHeightBoxLow3x);
  }
}
