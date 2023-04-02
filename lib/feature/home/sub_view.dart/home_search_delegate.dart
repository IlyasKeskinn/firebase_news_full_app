import 'package:firebase_news_full_app/product/models/news.dart';
import 'package:firebase_news_full_app/product/widget/news_widget/news_tile/news_tile.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class HomeSearchDelegate extends SearchDelegate<News?> {
  HomeSearchDelegate(this.newsItems);
  final List<News> newsItems;
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.chevron_left),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final result = newsItems.where(
      (element) =>
          element.title?.toLowerCase().contains(query.toLowerCase()) ?? false,
    );

    return ListView.builder(
      itemCount: result.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: context.paddingLow,
          child: NewsTile(
            newsItem: result.elementAt(index),
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final result = newsItems.where(
      (element) =>
          element.title?.toLowerCase().contains(query.toLowerCase()) ?? false,
    );

    return ListView.builder(
      itemCount: result.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: context.paddingLow,
          child: GestureDetector(
            onTap: () {
              close(context, result.elementAt(index));
            },
            child: NewsTile(
              newsItem: result.elementAt(index),
            ),
          ),
        );
      },
    );
  }
}
