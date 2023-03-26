import 'package:firebase_news_full_app/product/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class HeadingText extends StatelessWidget {
  const HeadingText({super.key, required this.value});
  final String value;

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: 2,
      softWrap: true,
      overflow: TextOverflow.ellipsis,
      textWidthBasis: TextWidthBasis.longestLine,
      value,
      style: context.textTheme.titleMedium?.copyWith(
        color: ColorConst.titleActive,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
