import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';
import 'package:smart_duel_disk/packages/core/core_logger/lib/core_logger.dart';
import 'package:smart_duel_disk/packages/core/core_navigation/lib/core_navigation.dart';
import 'package:smart_duel_disk/packages/features/feature_home/lib/src/news/models/news_list_item.dart';
import 'package:smart_duel_disk/packages/features/feature_home/lib/src/news/models/news_state.dart';
import 'package:smart_duel_disk/packages/features/feature_home/lib/src/news/models/social_media.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_crashlytics/lib/wrapper_crashlytics.dart';

import 'extensions/news_item_extensions.dart';

@Injectable()
class NewsViewModel extends BaseViewModel {
  final AppRouter _routerHelper;
  final DataManager _dataManager;
  final DateFormatter _dateFormatter;
  final CrashlyticsProvider _crashlyticsProvider;

  final _newsState = BehaviorSubject<NewsState>();
  Stream<NewsState> get newsState => _newsState.stream;

  NewsViewModel(
    Logger logger,
    this._routerHelper,
    this._dataManager,
    this._dateFormatter,
    this._crashlyticsProvider,
  ) : super(
          logger,
        );

  Future<void> init() async {
    return _fetchData();
  }

  Future<void> onRefresh() {
    return _fetchData();
  }

  Future<void> onRetryPressed() {
    return _fetchData();
  }

  Future<void> onNewsItemTapped(NewsListItem newsListItem) {
    return _routerHelper.showNewsDetails(newsListItem.id, newsListItem.authorId);
  }

  Future<void> onSocialMediaPressed(SocialMedia socialMedia) {
    switch (socialMedia) {
      case SocialMedia.youtube:
        return _routerHelper.showYoutube();
      case SocialMedia.twitter:
        return _routerHelper.showTwitter();
      case SocialMedia.discord:
        return _routerHelper.showDiscord();
      default:
        throw 'Invalid social media.';
    }
  }

  Future<void> _fetchData() async {
    _newsState.add(const NewsState.loading());

    try {
      final newsItems = await _dataManager.getNewsItems();
      final newsListItems = newsItems.map((newsItem) => newsItem.toNewsListItem(_dateFormatter));
      _newsState.add(NewsState(newsListItems));
    } catch (exception, stackTrace) {
      _crashlyticsProvider.logException(exception, stackTrace);
      _newsState.add(const NewsState.error());
    }
  }

  @override
  void dispose() {
    _newsState.close();

    super.dispose();
  }
}
