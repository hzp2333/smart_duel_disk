import 'package:injectable/injectable.dart';

import 'plugins/dio_background_decoder.dart';

abstract class DioPluginProvider {
  DioBackgroundDecoder getDioBackgroundDecoder();
}

@LazySingleton(as: DioPluginProvider)
class DioPluginProviderImpl implements DioPluginProvider {
  @override
  DioBackgroundDecoder getDioBackgroundDecoder() => DioBackgroundDecoder();
}
