import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/core_data_manager_interface/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';
import 'package:smart_duel_disk/packages/features/feature_home/lib/src/news/models/news_state.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_crashlytics_provider/wrapper_crashlytics_provider_interface/lib/wrapper_crashlytics_provider_interface.dart';

import './extensions/news_item_extensions.dart';

@Injectable()
class NewsViewModel {
  final DataManager _dataManager;
  final DateFormatter _dateFormatter;
  final CrashlyticsProvider _crashlyticsProvider;

  final _newsState = BehaviorSubject<NewsState>();
  Stream<NewsState> get newsState => _newsState.stream;

  NewsViewModel(
    this._dataManager,
    this._dateFormatter,
    this._crashlyticsProvider,
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
}
