import 'package:equatable/equatable.dart';
import 'package:firebase_news_full_app/product/utility/base/base_firebase_model.dart';
import 'package:flutter/cupertino.dart';

@immutable
class Category extends Equatable with IDModel, BaseFirebaseModel<Category> {
  Category({
    this.active,
    this.name,
  });

  bool? active;
  String? name;

  @override
  List<Object?> get props => [active, name];

  Category copyWith({
    bool? active,
    String? name,
  }) {
    return Category(
      active: active ?? this.active,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'active': active,
      'name': name,
    };
  }

  @override
  Category fromJson(Map<String, dynamic> json) {
    return Category(
      active: json['active'] as bool?,
      name: json['name'] as String?,
    );
  }
}
