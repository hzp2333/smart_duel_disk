import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_config/core_config_interface/lib/core_config_interface.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/core_data_manager_interface/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_crashlytics_provider/wrapper_crashlytics_provider_interface/lib/wrapper_crashlytics_provider_interface.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_twitter_provider/wrapper_twitter_provider_interface/lib/wrapper_twitter_provider_interface.dart';

@LazySingleton(as: NewsDataManager)
class NewsDataManagerImpl implements NewsDataManager {
  final AppConfig _appConfig;
  final TwitterProvider _twitterProvider;
  final CrashlyticsProvider _crashlyticsProvider;

  NewsDataManagerImpl(
    this._appConfig,
    this._twitterProvider,
    this._crashlyticsProvider,
  );

  @override
  Future<Iterable<NewsItem>> getNewsItems() async {
    try {
      final newsItems = await _twitterProvider.getUserTweets(_appConfig.twitterUserId);
      newsItems.sort((a, b) => a.createdAt.compareTo(b.createdAt));
      return newsItems.reversed;
    } catch (ex, stackTrace) {
      _crashlyticsProvider.logException(ex, stackTrace);
      return [];
    }
  }
}
