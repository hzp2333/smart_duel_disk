import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/core_data_manager_interface/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';
import 'package:smart_duel_disk/packages/features/feature_home/lib/src/news/models/news_state.dart';

import './extensions/news_item_extensions.dart';

@Injectable()
class NewsViewModel {
  final DataManager _dataManager;
  final DateFormatter _dateFormatter;

  final _newsState = BehaviorSubject<NewsState>();
  Stream<NewsState> get newsState => _newsState.stream;

  NewsViewModel(
    this._dataManager,
    this._dateFormatter,
  );

  Future<void> init() async {
    _newsState.add(const NewsState.loading());

    try {
      final newsItems = await _dataManager.getNewsItems();
      final newsListItems = newsItems.map((newsItem) => newsItem.toNewsListItem(_dateFormatter));
      _newsState.add(NewsState(newsListItems));
    } catch (e) {
      _newsState.add(const NewsState.error());
    }
  }
}
