import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/src/di/di.dart';

import '../crashlytics_provider.dart';

@mobile
@LazySingleton(as: CrashlyticsProvider)
class FirebaseCrashlyticsProvider implements CrashlyticsProvider {
  final FirebaseCrashlytics _firebaseCrashlytics;

  FirebaseCrashlyticsProvider(
    this._firebaseCrashlytics,
  );

  @override
  // ignore: avoid_annotating_with_dynamic
  void logException(dynamic exception, StackTrace stackTrace) {
    _firebaseCrashlytics.recordError(exception, stackTrace);
  }

  @override
  void logFlutterException(FlutterErrorDetails flutterErrorDetails) {
    _firebaseCrashlytics.recordFlutterError(flutterErrorDetails);
  }
}
