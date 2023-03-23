// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';
import 'package:firebase_news_full_app/enums/platfrom.dart';
import 'package:firebase_news_full_app/product/models/number.dart';
import 'package:firebase_news_full_app/product/utility/firebase/firebase_collection.dart';
import 'package:firebase_news_full_app/product/utility/version_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashNotifier extends StateNotifier<SplashState> {
  SplashNotifier() : super(const SplashState());

  Future<void> checkApplicationVersion(String clientVersion) async {
    final databaseValue = await getVersionNumberFromDatabase();

    if (databaseValue == null || databaseValue.isEmpty) {
      state = state.copyWith(isRequiredForcuUpdate: true);
      return;
    }

    final versionManager = VersionManager(
      deviceValue: clientVersion,
      databaseValue: databaseValue,
    );

    if (versionManager.isNeedUpdate()) {
      state = state.copyWith(isRequiredForcuUpdate: true);
      return;
    }

    state = state.copyWith(isRedirectHome: true);
  }

  Future<String?> getVersionNumberFromDatabase() async {
    // If user comming from browser, we don't need to chechk version control
    if (kIsWeb) return null;
    final response = await FirebaseCollection.version.reference
        .withConverter<Number>(
          fromFirestore: (snapshot, options) => Number().fromFirebase(snapshot),
          toFirestore: (value, options) => value.toJson(),
        )
        .doc(PlatformEnum.versionName)
        .get();

    return response.data()?.number;
  }
}

class SplashState extends Equatable {
  const SplashState({this.isRequiredForcuUpdate, this.isRedirectHome});

  final bool? isRequiredForcuUpdate;
  final bool? isRedirectHome;

  @override
  List<Object?> get props => [isRequiredForcuUpdate, isRedirectHome];

  SplashState copyWith({
    bool? isRequiredForcuUpdate,
    bool? isRedirectHome,
  }) {
    return SplashState(
      isRequiredForcuUpdate:
          isRequiredForcuUpdate ?? this.isRequiredForcuUpdate,
      isRedirectHome: isRedirectHome ?? this.isRedirectHome,
    );
  }
}
