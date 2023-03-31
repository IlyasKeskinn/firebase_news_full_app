import 'package:equatable/equatable.dart';
import 'package:firebase_news_full_app/product/utility/base/base_firebase_model.dart';
import 'package:flutter/cupertino.dart';

@immutable
class Category extends Equatable with IDModel, BaseFirebaseModel<Category> {
  Category({
    this.active,
    this.name,
    this.id,
  });

  final bool? active;
  final String? name;
  @override
  final String? id;

  @override
  List<Object?> get props => [id];

  Category copyWith({
    bool? active,
    String? name,
    String? id,
  }) {
    return Category(
      active: active ?? this.active,
      name: name ?? this.name,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toJson() {
    return {'active': active, 'name': name, 'id': id};
  }

  @override
  Category fromJson(Map<String, dynamic> json) {
    return Category(
      active: json['active'] as bool?,
      name: json['name'] as String?,
      id: json['id'] as String?,
    );
  }
}
