import 'package:firebase_news_full_app/product/widget/news_widget/news_footer/author.dart';
import 'package:firebase_news_full_app/product/widget/news_widget/news_footer/news_release_time.dart';
import 'package:flutter/material.dart';

class NewsFooter extends StatelessWidget {
  const NewsFooter(
      {super.key, required this.authorName, required this.releaseTime});
  final String authorName;
  final String releaseTime;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Author(
          author: authorName,
        ),
        const SizedBox(
          width: 20,
        ),
        News_Time(releaseTime: releaseTime),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_horiz_outlined),
        )
      ],
    );
  }
}
