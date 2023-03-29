// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:firebase_news_full_app/product/models/category.dart';
import 'package:firebase_news_full_app/product/models/news.dart';
import 'package:firebase_news_full_app/product/utility/exception/custom_exception.dart';
import 'package:firebase_news_full_app/product/utility/firebase/firebase_collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeProvider extends StateNotifier<HomeState> {
  HomeProvider() : super(const HomeState());

  List<News> _NewsList = [];

  List<News> get NewsList => _NewsList;

  Future<void> fetchNews() async {
    final newsReference = FirebaseCollection.news.reference;
    final response = await newsReference
        .withConverter(
          fromFirestore: (snapshot, options) => News().fromFirebase(snapshot),
          toFirestore: (value, options) {
            if (value == null) {
              throw FirebaseCustomException('$value not null!');
            } else {
              return value.toJson();
            }
          },
        )
        .get();

    if (response.docs.isNotEmpty) {
      final values = response.docs.map((e) => e.data()).toList();
      state = state.copyWith(news: values);
      _NewsList = values;
    }
  }

  Future<void> fetchCategory() async {
    final categoryReference =
        FirebaseCollection.category.reference.orderBy('name');
    final response = await categoryReference
        .withConverter(
          fromFirestore: (snapshot, options) =>
              Category().fromFirebase(snapshot),
          toFirestore: (value, options) {
            if (value == null) {
              throw FirebaseCustomException('$value not null!');
            } else {
              return value.toJson();
            }
          },
        )
        .get();

    if (response.docs.isNotEmpty) {
      final values = response.docs.map((e) => e.data()).toList();
      state = state.copyWith(category: values);
    }
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
