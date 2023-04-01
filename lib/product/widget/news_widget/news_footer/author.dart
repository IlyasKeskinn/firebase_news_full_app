import 'package:firebase_news_full_app/enums/icon_constants.dart';
import 'package:firebase_news_full_app/product/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class Author extends StatelessWidget {
  const Author({super.key, required this.author});
  final String author;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          IconConstants.author_icon.toPng,
          height: 20,
        ),
        const SizedBox(
          width: 5,
        ),
        SizedBox(
          width: 75,
          child: Text(
            maxLines: 1,
            author,
            style: context.textTheme.titleSmall?.copyWith(
              color: ColorConst.grayScale,
              fontWeight: FontWeight.w400,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}
