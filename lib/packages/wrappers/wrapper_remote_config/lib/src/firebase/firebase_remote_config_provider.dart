import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_remote_config/lib/src/remote_config_provider.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_remote_config/lib/wrapper_remote_config.dart';
import 'package:smart_duel_disk/src/di/di.dart';

@mobile
@LazySingleton(as: RemoteConfigProvider)
class FirebaseRemoteConfigProvider extends RemoteConfigProvider {
  final RemoteConfig _remoteConfig;

  FirebaseRemoteConfigProvider(
    this._remoteConfig,
  );

  @override
  Future<void> init() async {
    await _remoteConfig.setDefaults(<String, Object>{
      RemoteConfigKeys.lastCardDatabaseUpdate: '2021-09-01T00:00:00Z',
    });

    await _remoteConfig.fetchAndActivate();
  }

  @override
  String getString(String key) {
    return _remoteConfig.getString(key);
  }
}
