import 'package:dio/dio.dart';
import 'package:dio_flutter_transformer/dio_flutter_transformer.dart';
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
      ..transformer = FlutterTransformer()
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
