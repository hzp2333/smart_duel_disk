import 'package:dart_twitter_api/twitter_api.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_config/lib/core_config.dart';

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
