// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:firebase_news_full_app/product/utility/base/base_firebase_model.dart';

class Number extends Equatable with IDModel, BaseFirebaseModel<Number> {
  Number({
    this.number,
  });
  final String? number;
  @override
  String? id = '';

  @override
  List<Object?> get props => [number];

  Number copyWith({
    String? version,
  }) {
    return Number(
      number: version ?? number,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'version': number,
    };
  }

  @override
  Number fromJson(Map<String, dynamic> json) {
    return Number(
      number: json['number'] as String?,
    );
  }
}
