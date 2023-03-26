import 'package:firebase_news_full_app/product/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class ActiveChip extends StatelessWidget {
  const ActiveChip({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: ColorConst.lightPrimary,
      label: Text(
        text,
        style: context.textTheme.bodyLarge?.copyWith(color: ColorConst.white),
      ),
    );
  }
}
