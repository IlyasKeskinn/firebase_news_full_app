class FirebaseCustomException implements Exception {
  FirebaseCustomException(this.error);

  final String error;
  @override
  String toString() {
    return '$this $error';
  }
}


class VersionCustomException implements Exception {
  VersionCustomException(this.error);

  final String error;
  @override
  String toString() {
    return '$this $error';
  }
}
