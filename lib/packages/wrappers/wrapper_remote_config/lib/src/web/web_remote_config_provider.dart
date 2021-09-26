import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_remote_config/lib/src/remote_config_provider.dart';
import 'package:smart_duel_disk/src/di/di.dart';

@web
@LazySingleton(as: RemoteConfigProvider)
class WebRemoteConfigProvider extends RemoteConfigProvider {
  @override
  Future<void> init() async {
    // Ignore on web. Firebase Remote Config isn't supported yet.
  }

  @override
  String getString(String key) {
    // Ignore on web. Firebase Remote Config isn't supported yet.
    return '';
  }
}
