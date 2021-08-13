import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_cloud_database/lib/wrapper_cloud_database.dart';

import 'entities/pre_built_deck.dart';

abstract class DeckDataManager {
  Future<Iterable<int>> getPreBuiltDeckCardIds(PreBuiltDeck deck);
}

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
