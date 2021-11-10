import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_remote_config/lib/wrapper_remote_config.dart';
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
    // TODO: update this value whenever it is changed on Firebase.
    if (key == RemoteConfigKeys.lastCardDatabaseUpdate) {
      return '2021-09-26T14:13:00Z';
    }

    // Ignore on web. Firebase Remote Config isn't supported yet.
    return '';
  }
}
