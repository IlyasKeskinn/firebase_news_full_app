import 'package:firebase_news_full_app/product/models/news.dart';
import 'package:firebase_news_full_app/product/widget/news_widget/news_footer/news_footer.dart';
import 'package:firebase_news_full_app/product/widget/text/heading_text.dart';
import 'package:firebase_news_full_app/product/widget/text/sub_title_text.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, this.news});

  final News? news;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      width: context.dynamicWidth(0.8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 180,
            width: 360,
            child: Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: Image.network(
                //fix
                news!.backgroundImage ?? '',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: context.onlyTopPaddingLow,
            //fix
            child: SubTitleText(value: news!.category ?? ''),
          ),
          Padding(
            padding: context.onlyTopPaddingLow,
            child: HeadingText(
              //fix
              value: news!.title ?? '',
            ),
          ),
          Padding(
            padding: context.onlyTopPaddingLow,
            child: NewsFooter(
              authorName: news!.author ?? '',
              releaseTime: '12m ago',
            ),
          ),
        ],
      ),
    );
  }
}
