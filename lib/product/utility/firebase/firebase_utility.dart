// import 'package:firebase_news_full_app/product/utility/base/base_firebase_model.dart';
// import 'package:firebase_news_full_app/product/utility/exception/custom_exception.dart';
// import 'package:firebase_news_full_app/product/utility/firebase/firebase_collection.dart';

// mixin FirebaseUtilty {
//   Future<List<R>?> fetchList<T extends IDModel, R extends BaseFirebaseModel<T>>(
//     R data,
//     FirebaseCollection collection,
//   ) async {
//     final dataReference = collection.reference;
//     final response = await dataReference.withConverter<T>(
//       fromFirestore: (snapshot, options) {
//         return data.fromFirebase(snapshot);
//       },
//       toFirestore: (value, options) {
//         if (value == null) {
//           throw FirebaseCustomException('$value not null!');
//         } else {
//           return {};
//         }
//       },
//     ).get();

//     if (response.docs.isNotEmpty) {
//       final values = response.docs.map((e) => e.data()).toList();
//       return values;
//     }
//     return null;
//   }
// }
