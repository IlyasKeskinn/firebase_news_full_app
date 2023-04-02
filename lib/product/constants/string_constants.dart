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

  //Profile

  static const String profile = 'Profile';
  static const String profileFollowers = 'Followers';
  static const String profileFollowing = 'Following';
  static const String profileTotalNews = 'News';
  static const String profileEdit = 'Edit Profile';
  static const String profileWebsite = 'Website';
  static const String profileNews = 'News';

  //Setting
  static const String settingsPage = 'Settings';
  static const String settingsPageSecurity = 'Security';
  static const String settingsPageHelp = 'Help';
  static const String logout = 'Logout';

  //Edit Profile
  static const String editUsername = 'Username';
  static const String editFullname = 'Full Name';
  static const String editEmailAddress = 'Email Address';
  static const String editPhone = 'Username';
  static const String editBio = 'Bio';

  //Add News
  static const String addNewsAppbar = 'Add News';
  static const String addNewsSelectCategory = 'Please select category';
  static const String addNewsEnterTitle = 'Enter news title';
  static const String addNewsPublish = 'Publsih';

  //Validate Forms
  static const String validateTitle = 'Please enter title';
  static const String validateCategory = 'Please select a category';

  //bottomnavigationbar
  static const String bottomnavigationbar_home = 'Home';
  static const String bottomnavigationbar_explore = 'Explore';
  static const String bottomnavigationbar_bookmark = 'Bookmark';
  static const String bottomnavigationbar_profile = 'Profile';
}
