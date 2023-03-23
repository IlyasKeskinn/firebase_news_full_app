import 'package:firebase_news_full_app/product/utility/exception/custom_exception.dart';

class VersionManager {
  VersionManager({required this.deviceValue, required this.databaseValue});
  final String deviceValue;
  final String databaseValue;

  bool isNeedUpdate() {
    final deviceValueSplited = deviceValue.split('.').join();
    final databaseValueSplited = databaseValue.split('.').join();

    final deviceNumber = int.tryParse(deviceValueSplited);
    final databaseNumber = int.tryParse(databaseValueSplited);

    if (deviceNumber == null || databaseNumber == null) {
      throw VersionCustomException(
        '$deviceValue or $databaseValue is not valid for parse',
      );
    }
    return deviceNumber < databaseNumber;
  }
}
