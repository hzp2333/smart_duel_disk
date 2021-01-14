import 'package:dio/dio.dart';
import 'package:dio_flutter_transformer/dio_flutter_transformer.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_config/core_config_interface/lib/core_config_interface.dart';

@module
abstract class YgoProDeckModule {
  @LazySingleton()
  Dio provideYgoProDeckDio(AppConfig appConfig) {
    return Dio(
      BaseOptions(
        baseUrl: appConfig.ygoProDeckBaseUrl,
        connectTimeout: appConfig.ygoProDeckConnectTimeout,
        receiveTimeout: appConfig.ygoProDeckReceiveTimeout,
      ),
    )..transformer = FlutterTransformer();
  }
}
