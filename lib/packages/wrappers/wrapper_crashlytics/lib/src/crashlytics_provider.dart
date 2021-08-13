import 'package:flutter/foundation.dart';

abstract class CrashlyticsProvider {
  // ignore: avoid_annotating_with_dynamic
  void logException(dynamic exception, StackTrace stackTrace);
  void logFlutterException(FlutterErrorDetails flutterErrorDetails);
}
