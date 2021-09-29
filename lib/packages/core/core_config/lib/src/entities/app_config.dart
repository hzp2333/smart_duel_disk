import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

@immutable
class AppConfig {
  bool get loggingEnabled => true;

  List<Locale> get supportedLocales => const [Locale('en')];
  Locale get fallbackLocale => const Locale('en');
  String get translationsPath => 'assets/translations';

  String get smartDuelServerAddress => 'https://smart-duel-server.herokuapp.com';
  String get smartDuelServerPort => '443';

  String get ygoProDeckBaseUrl => 'https://db.ygoprodeck.com/api/v7';
  int get defaultApiReceiveTimeout => 60000;
  int get defaultApiConnectTimeout => 60000;

  String get twitterUrl => 'https://twitter.com/CrownCorpBE';
  String get tweetUrl => 'https://twitter.com/{0}/status/{1}';
  String get youtubeUrl => 'https://www.youtube.com/channel/UCz2Que3btHnGkwrW-emZV5A';
  String get discordUrl => 'https://discord.gg/XCcfcbBcjE';

  final String twitterUserId;
  final String? twitterConsumerKey;
  final String? twitterConsumerSecret;
  final String? twitterToken;
  final String? twitterSecret;

  const AppConfig._({
    required this.twitterUserId,
    required this.twitterConsumerKey,
    required this.twitterConsumerSecret,
    required this.twitterToken,
    required this.twitterSecret,
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

  factory AppConfig.develop() {
    return const AppConfig._(
      twitterUserId: '',
      twitterConsumerKey: '',
      twitterConsumerSecret: '',
      twitterToken: '',
      twitterSecret: '',
    );
  }
}
