import 'package:cloud_firestore/cloud_firestore.dart';

enum FirebaseCollection {
  news,
  version;

  CollectionReference get reference =>
      FirebaseFirestore.instance.collection(name);
}
