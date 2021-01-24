import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/core_data_manager_interface/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_cloud_database/wrapper_cloud_database_interface/lib/wrapper_cloud_database_interface.dart';

@LazySingleton(as: DeckDataManager)
class DeckDataManagerImpl implements DeckDataManager {
  final CloudDatabaseProvider _cloudDatabaseProvider;

  DeckDataManagerImpl(
    this._cloudDatabaseProvider,
  );

  @override
  Future<Iterable<int>> getPreBuiltDeckCardIds(PreBuiltDeck deck) {
    return _cloudDatabaseProvider.getPreBuiltDeckCardIds(deck);
  }
}
