import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';
import 'package:smart_duel_disk/packages/core/core_logger/lib/core_logger.dart';
import 'package:smart_duel_disk/packages/core/core_navigation/lib/core_navigation.dart';
import 'package:smart_duel_disk/packages/features/feature_home/lib/src/news/models/news_list_item.dart';
import 'package:smart_duel_disk/packages/features/feature_home/lib/src/news/models/news_state.dart';
import 'package:smart_duel_disk/packages/features/feature_home/lib/src/news/models/social_media.dart';

import 'extensions/news_item_extensions.dart';

@Injectable()
class NewsViewModel extends BaseViewModel {
  static const _tag = 'NewsViewModel';

  final AppRouter _router;
  final DataManager _dataManager;
  final DateFormatter _dateFormatter;

  final _newsState = BehaviorSubject<NewsState>();
  Stream<NewsState> get newsState => _newsState.stream;

  NewsViewModel(
    this._router,
    this._dataManager,
    this._dateFormatter,
    Logger logger,
  ) : super(logger);

  Future<void> init() async {
    logger.info(_tag, 'init()');

    await _fetchData();
  }

  Future<void> onRefresh() async {
    logger.info(_tag, 'onRefresh()');

    await _fetchData();
  }

  Future<void> onRetryPressed() async {
    logger.info(_tag, 'onRetryPressed()');

    await _fetchData();
  }

  Future<void> onNewsItemTapped(NewsListItem newsListItem) async {
    logger.info(_tag, 'onNewsItemTapped(newsListItem: $newsListItem)');

    await _router.showNewsDetails(newsListItem.id, newsListItem.authorId);
  }

  Future<void> onSocialMediaPressed(SocialMedia socialMedia) {
    logger.info(_tag, 'onSocialMediaPressed(socialMedia: $socialMedia)');

    switch (socialMedia) {
      case SocialMedia.youtube:
        return _router.showYoutube();
      case SocialMedia.twitter:
        return _router.showTwitter();
      case SocialMedia.discord:
        return _router.showDiscord();
      default:
        throw 'Invalid social media.';
    }
  }

  Future<void> _fetchData() async {
    logger.verbose(_tag, '_fetchData()');

    _newsState.add(const NewsLoading());

    try {
      final newsItems = await _dataManager.getNewsItems();
      final newsListItems = newsItems.map((newsItem) => newsItem.toNewsListItem(_dateFormatter));
      _newsState.add(NewsData(newsListItems));
    } catch (exception, stackTrace) {
      logger.error(_tag, 'An error occured while fetching the news', exception, stackTrace);
      _newsState.add(const NewsError());
    }
  }

  @override
  void dispose() {
    _newsState.close();

    super.dispose();
  }
}
