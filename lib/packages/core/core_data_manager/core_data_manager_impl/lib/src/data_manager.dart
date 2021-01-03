import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/core_data_manager_interface/lib/core_data_manager_interface.dart';

@LazySingleton(as: DataManager)
class DataManagerImpl implements DataManager {
  final NewsDataManager _newsDataManager;

  DataManagerImpl(
    this._newsDataManager,
  );

  @override
  Future<Iterable<NewsItem>> getNewsItems() {
    return _newsDataManager.getNewsItems();
  }
}
