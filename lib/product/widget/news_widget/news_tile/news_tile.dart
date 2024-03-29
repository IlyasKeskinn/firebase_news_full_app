import 'package:firebase_news_full_app/product/models/news.dart';
import 'package:firebase_news_full_app/product/widget/news_widget/news_footer/news_footer.dart';
import 'package:firebase_news_full_app/product/widget/text/heading_text.dart';
import 'package:firebase_news_full_app/product/widget/text/sub_title_text.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, this.newsItem});
  final News? newsItem;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 112,
      child: Row(
        children: [
          SizedBox(
            height: 92,
            width: 92,
            child: Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              margin: EdgeInsets.zero,
              semanticContainer: false,
              child: Image.network(
                //fix
                newsItem!.backgroundImage ?? '',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: context.onlyLeftPaddingLow,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //fix
                  SubTitleText(value: newsItem!.category ?? ''),
                  Padding(
                    padding: context.onlyTopPaddingLow,
                    child: HeadingText(
                      //fix
                      value: newsItem!.title ?? '',
                    ),
                  ),
                  NewsFooter(
                    //fix
                    authorName: newsItem!.author ?? '',
                    releaseTime: '53m ago',
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
