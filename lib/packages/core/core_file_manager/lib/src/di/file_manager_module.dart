import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_config/lib/core_config.dart';
import 'package:smart_duel_disk/packages/core/core_logger/lib/core_logger.dart';

const fileManagerDioName = 'FileManagerDio';

@module
abstract class FileManagerModule {
  @Named(fileManagerDioName)
  @LazySingleton()
  Dio provideFileManagerDio(
    AppConfig appConfig,
    DioPluginProvider dioPluginProvider,
    Logger logger,
  ) {
    return Dio(
      BaseOptions(
        connectTimeout: appConfig.defaultApiConnectTimeout,
        receiveTimeout: appConfig.defaultApiReceiveTimeout,
      ),
    );
  }
}
