import 'package:firebase_news_full_app/product/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class News_Time extends StatelessWidget {
  const News_Time({super.key, required this.releaseTime});
  final String releaseTime;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.watch_later_outlined, color: ColorConst.grayScale),
        const SizedBox(
          width: 5,
        ),
        Text(
          releaseTime,
          style: context.textTheme.titleSmall?.copyWith(
            color: ColorConst.grayScale,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
