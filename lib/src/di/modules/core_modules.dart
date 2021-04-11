import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:smart_duel_disk/packages/core/core_config/core_config_interface/lib/core_config_interface.dart';
import 'package:smart_duel_disk/packages/core/core_logger/core_logger_interface/lib/core_logger_interface.dart';

@module
abstract class YgoProDeckModule {
  @LazySingleton()
  Dio provideYgoProDeckDio(AppConfig appConfig, Logger logger) {
    return Dio(
      BaseOptions(
        baseUrl: appConfig.ygoProDeckBaseUrl,
        connectTimeout: appConfig.ygoProDeckConnectTimeout,
        receiveTimeout: appConfig.ygoProDeckReceiveTimeout,
      ),
    )
      ..transformer = _FlutterTransformer()
      ..interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: false,
          logPrint: (log) => logger.print(log.toString()),
        ),
      );
  }
}

// TODO: replace this code from dio_transformer with something from executor, as soon as it has null safety.
class _FlutterTransformer extends DefaultTransformer {
  _FlutterTransformer() : super(jsonDecodeCallback: _parseJson);
}

dynamic _parseJson(String text) {
  return compute<dynamic, dynamic>(_parseAndDecode, text);
}

// Must be top-level function
FutureOr<dynamic> _parseAndDecode(dynamic response) {
  return response is String ? jsonDecode(response) : null;
}
