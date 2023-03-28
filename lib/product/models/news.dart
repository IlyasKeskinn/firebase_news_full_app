import 'package:equatable/equatable.dart';
import 'package:firebase_news_full_app/product/utility/base/base_firebase_model.dart';

class News extends Equatable with IDModel, BaseFirebaseModel<News> {
  News({
    this.category,
    this.categoryId,
    this.title,
    this.backgroundImage,
    this.id,
    this.author,
  });

  final String? category;
  final String? categoryId;
  final String? title;
  final String? backgroundImage;
  @override
  final String? id;
  final String? author;

  @override
  List<Object?> get props =>
      [category, categoryId, title, backgroundImage, id, author];

  News copyWith({
    String? category,
    String? categoryId,
    String? title,
    String? backgroundImage,
    String? id,
    String? author,
  }) {
    return News(
      category: category ?? this.category,
      categoryId: categoryId ?? this.categoryId,
      title: title ?? this.title,
      backgroundImage: backgroundImage ?? this.backgroundImage,
      author: author ?? this.author,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'categoryId': categoryId,
      'title': title,
      'backgroundImage': backgroundImage,
      'id': id,
      'author': author,
    };
  }

  @override
  News fromJson(Map<String, dynamic> json) {
    return News(
      category: json['category'] as String?,
      categoryId: json['categoryId'] as String?,
      title: json['title'] as String?,
      backgroundImage: json['backgroundImage'] as String?,
      id: json['id'] as String?,
      author: json['author'] as String?,
    );
  }
}
