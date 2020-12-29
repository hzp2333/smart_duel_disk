import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_crashlytics_provider/wrapper_crashlytics_provider_interface/lib/wrapper_crashlytics_provider_interface.dart';

@LazySingleton(as: CrashlyticsProvider)
class FirebaseCrashlyticsProvider implements CrashlyticsProvider {
  final FirebaseCrashlytics _firebaseCrashlytics;

  FirebaseCrashlyticsProvider(
    this._firebaseCrashlytics,
  );

  @override
  void logException(dynamic exception, StackTrace stackTrace) {
    _firebaseCrashlytics.recordError(exception, stackTrace);
  }

  @override
  void logFlutterException(FlutterErrorDetails flutterErrorDetails) {
    _firebaseCrashlytics.recordFlutterError(flutterErrorDetails);
  }
}
