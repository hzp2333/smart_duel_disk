import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_config/lib/core_config.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_html_unescape/lib/wrapper_html_unescape.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_twitter/lib/wrapper_twitter.dart';

import 'entities/news_item.dart';

abstract class NewsDataManager {
  Future<Iterable<NewsItem>> getNewsItems();
}

@LazySingleton(as: NewsDataManager)
class NewsDataManagerImpl implements NewsDataManager {
  final AppConfig _appConfig;
  final TwitterProvider _twitterProvider;
  final HtmlUnescapeProvider _htmlUnescapeProvider;

  NewsDataManagerImpl(
    this._appConfig,
    this._twitterProvider,
    this._htmlUnescapeProvider,
  );

  @override
  Future<Iterable<NewsItem>> getNewsItems() async {
    final newsItems = (await _twitterProvider.getUserTweets(_appConfig.twitterUserId))
        .map((newsItem) => newsItem.copyWith(text: _htmlUnescapeProvider.convert(newsItem.text)))
        .toList();

    newsItems.sort((a, b) => a.createdAt!.compareTo(b.createdAt!));

    return newsItems.reversed;
  }
}
