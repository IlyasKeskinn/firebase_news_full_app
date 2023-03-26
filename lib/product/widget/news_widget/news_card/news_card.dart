import 'package:firebase_news_full_app/product/widget/news_widget/news_footer/news_footer.dart';
import 'package:firebase_news_full_app/product/widget/text/heading_text.dart';
import 'package:firebase_news_full_app/product/widget/text/sub_title_text.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.image});
  final String image;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 180,
            width: 360,
            child: Card(
              child: Image.network(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: context.onlyTopPaddingLow,
            child: const SubTitleText(value: 'Europe'),
          ),
          Padding(
            padding: context.onlyTopPaddingLow,
            child: const HeadingText(
              value: 'Russian warship: Moskva sinks in Black Sea',
            ),
          ),
          Padding(
            padding: context.onlyTopPaddingLow,
            child: const NewsFooter(
              authorName: 'BBC News',
              releaseTime: '1m ago',
            ),
          ),
        ],
      ),
    );
  }
}
