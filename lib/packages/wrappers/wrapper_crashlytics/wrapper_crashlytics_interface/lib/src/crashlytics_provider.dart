import 'package:flutter/foundation.dart';

abstract class CrashlyticsProvider {
  void logException(dynamic exception, StackTrace stackTrace);
  void logFlutterException(FlutterErrorDetails flutterErrorDetails);
}
