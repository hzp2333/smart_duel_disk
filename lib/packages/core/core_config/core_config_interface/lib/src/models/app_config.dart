import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

@immutable
class AppConfig {
  bool get loggingEnabled => true;

  String get ygoProDeckBaseUrl => 'https://db.ygoprodeck.com/api/v7';
  int get ygoProDeckReceiveTimeout => 10000;
  int get ygoProDeckConnectTimeout => 10000;

  String get twitterUrl => 'https://twitter.com/CrownCorpBE';
  String get tweetUrl => 'https://twitter.com/{0}/status/{1}';
  String get youtubeUrl => 'https://www.youtube.com/channel/UCz2Que3btHnGkwrW-emZV5A';
  String get discordUrl => 'https://discord.gg/SxmeN9Yh8a';

  String get webSocketUrl => 'http://192.168.0.106:3000';

  final String twitterUserId;
  final String twitterConsumerKey;
  final String twitterConsumerSecret;
  final String twitterToken;
  final String twitterSecret;

  const AppConfig._({
    @required this.twitterUserId,
    @required this.twitterConsumerKey,
    @required this.twitterConsumerSecret,
    @required this.twitterToken,
    @required this.twitterSecret,
  });

  factory AppConfig.release(DotEnv dotEnv) {
    return AppConfig._(
      twitterUserId: 'CrownCorpBE',
      twitterConsumerKey: dotEnv.env['TWITTER_CONSUMER_KEY'],
      twitterConsumerSecret: dotEnv.env['TWITTER_CONSUMER_SECRET'],
      twitterToken: dotEnv.env['TWITTER_TOKEN'],
      twitterSecret: dotEnv.env['TWITTER_SECRET'],
    );
  }
}
