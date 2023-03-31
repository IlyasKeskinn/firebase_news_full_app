import 'package:flutter/material.dart';

@immutable
class StringConstants {
  const StringConstants._();
  static const String appName = 'News';

  //login
  static const String loginHello = 'Hello';
  static const String loginAgain = 'Again!';
  static const String loginMsg = "Welcome back you're been missed";

  //home
  static const String homeTrend = 'Trending';
  static const String homeLatest = 'Latest';
  static const String homeSeeAll = 'See all';
  static const String homeSearch = 'Search';

  //Add News
  static const String addNewsAppbar = 'Add News';
  static const String addNewsSelectCategory = 'Please select category';
  static const String addNewsEnterTitle = 'Enter news title';
}
