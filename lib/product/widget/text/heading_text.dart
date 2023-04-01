import 'package:firebase_news_full_app/product/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class HeadingText extends StatelessWidget {
  const HeadingText({super.key, required this.value, this.maxLines});
  final String value;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: maxLines ?? 1,
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
