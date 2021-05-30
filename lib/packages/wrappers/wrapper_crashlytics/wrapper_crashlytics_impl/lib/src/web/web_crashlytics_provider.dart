import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_crashlytics/wrapper_crashlytics_interface/lib/wrapper_crashlytics_interface.dart';
import 'package:smart_duel_disk/src/di/di.dart';

@web
@LazySingleton(as: CrashlyticsProvider)
class WebCrashlyticsProvider extends CrashlyticsProvider {
  @override
  void logException(dynamic exception, StackTrace stackTrace) {
    // Ignore on web. Firebase Crashlytics isn't supported yet.
  }

  @override
  void logFlutterException(FlutterErrorDetails flutterErrorDetails) {
    // Ignore on web. Firebase Crashlytics isn't supported yet.
  }
}
