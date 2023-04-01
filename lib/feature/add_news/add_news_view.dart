import 'package:firebase_news_full_app/feature/add_news/add_news_logic.dart';
import 'package:firebase_news_full_app/product/constants/color_constants.dart';
import 'package:firebase_news_full_app/product/constants/string_constants.dart';
import 'package:firebase_news_full_app/product/models/category.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class AddNewsView extends StatefulWidget {
  const AddNewsView({super.key});

  @override
  State<AddNewsView> createState() => _AddNewsViewState();
}

class _AddNewsViewState extends State<AddNewsView> {
  late final AddNewLogic _addNewLogic;
  @override
  void initState() {
    super.initState();
    _addNewLogic = AddNewLogic();
    _fetchInitialCategory();
  }

  @override
  void dispose() {
    _addNewLogic.dispose();
    super.dispose();
  }

  Future<void> _fetchInitialCategory() async {
    await _addNewLogic.fetchCategory();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConstants.addNewsAppbar),
      ),
      body: Form(
        key: _addNewLogic.formKey,
        onChanged: () {
          _addNewLogic.chechkValidate((value) {
            setState(() {});
          });
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: context.paddingNormal,
          child: ListView(
            children: [
              _CategoryDropDown(_addNewLogic.categories, (value) {
                setState(() {
                  _addNewLogic.updateCategory(value);
                });
              }),
              const EmptySizedBoxLow(),
              TextFormField(
                controller: _addNewLogic.authorController,
                validator: (value) {
                  if (value.isNullOrEmpty) {
                    return StringConstants.validateTitle;
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person_outline),
                  hintText: 'Author',
                ),
              ),
              const EmptySizedBoxLow(),
              TextFormField(
                controller: _addNewLogic.titleController,
                validator: (value) {
                  if (value.isNullOrEmpty) {
                    return StringConstants.validateTitle;
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.title_outlined),
                  hintText: StringConstants.addNewsEnterTitle,
                ),
              ),
              const EmptySizedBoxLow(),
              InkWell(
                onTap: () async {
                  await _addNewLogic.pickImageAndValidate(
                    (value) {
                      setState(() {});
                    },
                  );
                  setState(() {});
                },
                child: SizedBox(
                  height: context.dynamicHeight(0.2),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(color: ColorConst.grayScale),
                      borderRadius: context.lowBorderRadius,
                    ),
                    child: _addNewLogic.selectedFileBytes != null
                        ? Image.memory(
                            _addNewLogic.selectedFileBytes!,
                            fit: BoxFit.cover,
                          )
                        : const Icon(Icons.photo_camera_outlined),
                  ),
                ),
              ),
              const EmptySizedBoxLow(),
              ElevatedButton.icon(
                onPressed: !_addNewLogic.isValidateForm
                    ? null
                    : () async {
                        final response =
                            await _addNewLogic.addNewsToFirebaseCollection();
                        if (!mounted) {
                          return;
                        }
                        await context.pop<bool>(response);
                      },
                label: const Text(StringConstants.addNewsPublish),
                icon: const Icon(Icons.send_outlined),
                style: ElevatedButton.styleFrom(
                  elevation: 20,
                ),
              )
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

class _CategoryDropDown extends StatelessWidget {
  const _CategoryDropDown(this.categories, this.onselected);
  final List<Category> categories;
  final ValueSetter<Category> onselected;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: ColorConst.white,
        border: Border.all(color: ColorConst.grayScale),
        borderRadius: context.lowBorderRadius,
      ),
      child: DropdownButtonFormField<Category>(
        validator: (value) {
          if (value == null) {
            return StringConstants.validateCategory;
          }
          return null;
        },
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.category_outlined),
        ),
        style: context.textTheme.bodyLarge,
        items: categories.map((items) {
          return DropdownMenuItem<Category>(
            value: items,
            child: Text(items.name.toCapitalized()),
          );
        }).toList(),
        hint: const Text(StringConstants.addNewsSelectCategory),
        onChanged: (value) {
          if (value == null) return;
          onselected.call(value);
        },
      ),
    );
  }
}
