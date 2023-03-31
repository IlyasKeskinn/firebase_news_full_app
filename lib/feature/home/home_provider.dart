// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:firebase_news_full_app/product/models/category.dart';
import 'package:firebase_news_full_app/product/models/news.dart';
import 'package:firebase_news_full_app/product/utility/firebase/firebase_collection.dart';
import 'package:firebase_news_full_app/product/utility/firebase/firebase_utility.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeProvider extends StateNotifier<HomeState> with FirebaseUtilty {
  HomeProvider() : super(const HomeState());

  List<News> _newsList = [];

  List<News> get newsList => _newsList;

  Future<void> fetchNews() async {
    final response =
        await fetchList<News, News>(News(), FirebaseCollection.news);
    state = state.copyWith(news: response);
    _newsList = response!.toList();
  }

  Future<void> fetchCategory() async {
    final response = await fetchList<Category, Category>(
      Category(),
      FirebaseCollection.category,
    );
    state = state.copyWith(category: response);
  }

  Future<void> fetchingLoad() async {
    state = state.copyWith(isLoading: true);
    await fetchNews();
    await fetchCategory();
    state = state.copyWith(isLoading: false);
  }
}

class HomeState extends Equatable {
  const HomeState({this.news, this.isLoading, this.category});

  final List<News>? news;
  final List<Category>? category;
  final bool? isLoading;

  @override
  List<Object?> get props => [news, isLoading, category];

  HomeState copyWith({
    List<News>? news,
    List<Category>? category,
    bool? isLoading,
  }) {
    return HomeState(
      news: news ?? this.news,
      category: category ?? this.category,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
