import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_twitter_api/twitter_api.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_duel_disk/packages/core/core_config/core_config_interface/lib/core_config_interface.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/core_data_manager_interface/lib/core_data_manager_interface.dart';
import 'package:socket_io_client/socket_io_client.dart';

@module
abstract class FirebaseModule {
  @LazySingleton()
  FirebaseCrashlytics provideFirebaseCrashlytics() {
    return FirebaseCrashlytics.instance;
  }

  @LazySingleton()
  FirebaseFirestore provideFirebaseFirestore() {
    return FirebaseFirestore.instance;
  }
}

@module
abstract class TwitterModule {
  @LazySingleton()
  TwitterApi provideTwitterApi(AppConfig appConfig) {
    return TwitterApi(
      client: TwitterClient(
        consumerKey: appConfig.twitterConsumerKey,
        consumerSecret: appConfig.twitterConsumerSecret,
        token: appConfig.twitterToken,
        secret: appConfig.twitterSecret,
      ),
    );
  }
}

@module
abstract class SocketIoModule {
  @Injectable()
  Socket provideSocket(DataManager dataManager) {
    final connectionInfo = dataManager.getConnectionInfo();
    final prefix = connectionInfo.ipAddress.startsWith('http://') || connectionInfo.ipAddress.startsWith('https://')
        ? ''
        : 'http://';
    final uri = '$prefix${connectionInfo.ipAddress}:${connectionInfo.port}';

    return io(uri, OptionBuilder().setTransports(['websocket']).disableAutoConnect().build());
  }
}

@module
abstract class SharedPreferencesModule {
  @preResolve
  @LazySingleton()
  Future<SharedPreferences> provideSharedPreferences() {
    return SharedPreferences.getInstance();
  }
}
