import 'package:firebase_news_full_app/product/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class SubTitleText extends StatelessWidget {
  const SubTitleText({super.key, required this.value});
  final String value;

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: context.textTheme.bodyLarge
          ?.copyWith(color: ColorConst.grayScale, fontWeight: FontWeight.w400),
    );
  }
}
