import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_news_full_app/product/utility/exception/custom_exception.dart';

abstract class IDModel {
  String? id;
}

abstract class BaseFirebaseModel<T extends IDModel> {
  T fromJson(Map<String, dynamic> json);
  T fromFirebase(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final value = snapshot.data();
    if (value == null) {
      throw FirebaseCustomException('$snapshot not null!');
    }
    value.addEntries([MapEntry('id', snapshot.id)]);
    return fromJson(value);
  }
}
