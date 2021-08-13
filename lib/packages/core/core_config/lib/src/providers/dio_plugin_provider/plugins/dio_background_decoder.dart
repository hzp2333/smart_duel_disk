import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioBackgroundDecoder extends DefaultTransformer {
  DioBackgroundDecoder() : super(jsonDecodeCallback: _parseJson);
}

// Must be top-level function
dynamic _parseJson(String text) {
  return compute<dynamic, dynamic>(_parseAndDecode, text);
}

// ignore: avoid_annotating_with_dynamic
FutureOr<dynamic> _parseAndDecode(dynamic response) {
  return response is String ? jsonDecode(response) : null;
}
