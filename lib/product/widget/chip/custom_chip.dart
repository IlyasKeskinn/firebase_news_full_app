import 'package:firebase_news_full_app/product/constants/color_constants.dart';
import 'package:firebase_news_full_app/product/models/category.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class CustomChip extends StatelessWidget {
  const CustomChip({super.key, this.categoryItems});
  final Category? categoryItems;

  @override
  Widget build(BuildContext context) {
    var active = false;

    if (categoryItems!.active ?? false) {
      active = true;
    }

    return Chip(
      backgroundColor: active ? ColorConst.lightPrimary : Colors.transparent,
      label: Text(
        //fix
        categoryItems!.name.toCapitalized(),
        style: active
            ? context.textTheme.bodyMedium?.copyWith(color: ColorConst.white)
            : context.textTheme.bodyMedium?.copyWith(color: Colors.black),
      ),
    );
  }
}
