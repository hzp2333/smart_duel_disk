import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:smart_duel_disk/packages/core/core_config/lib/core_config.dart';
import 'package:smart_duel_disk/packages/core/core_logger/lib/core_logger.dart';

@module
abstract class YgoProDeckModule {
  @LazySingleton()
  Dio provideYgoProDeckDio(
    AppConfig appConfig,
    DioPluginProvider dioPluginProvider,
    Logger logger,
  ) {
    final dio = Dio(
      BaseOptions(
        baseUrl: appConfig.ygoProDeckBaseUrl,
        connectTimeout: appConfig.ygoProDeckConnectTimeout,
        receiveTimeout: appConfig.ygoProDeckReceiveTimeout,
      ),
    );

    dio.transformer = dioPluginProvider.getDioBackgroundDecoder();

    if (appConfig.loggingEnabled) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: false,
          logPrint: (log) => logger.print(log.toString()),
        ),
      );
    }

    return dio;
  }
}
