import 'package:dart_twitter_api/twitter_api.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_config/core_config_interface/lib/core_config_interface.dart';

@module
abstract class FirebaseModule {
  @LazySingleton()
  FirebaseCrashlytics provideFirebaseCrashlytics() {
    return FirebaseCrashlytics.instance;
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
    ));
  }
}
