import 'package:firebase_news_full_app/product/widget/news_widget/news_footer/news_footer.dart';
import 'package:firebase_news_full_app/product/widget/text/heading_text.dart';
import 'package:firebase_news_full_app/product/widget/text/sub_title_text.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 112,
      child: Row(
        children: [
          SizedBox(
            height: 112,
            width: 112,
            child: Card(
              margin: EdgeInsets.zero,
              semanticContainer: false,
              child: Image.network(
                image,
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
                  const SubTitleText(value: 'Travel'),
                  Padding(
                    padding: context.onlyTopPaddingLow,
                    child: const HeadingText(
                      value:
                          'Her train broke down. Her phone died. And then she met her...',
                    ),
                  ),
                  const NewsFooter(
                    authorName: 'CNN',
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
