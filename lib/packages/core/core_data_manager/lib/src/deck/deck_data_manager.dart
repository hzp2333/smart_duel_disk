import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_cloud_database/lib/wrapper_cloud_database.dart';

import 'entities/pre_built_deck.dart';

abstract class DeckDataManager {
  Iterable<PreBuiltDeck> getPreBuiltDecks();
  Future<Iterable<int>> getPreBuiltDeckCardIds(PreBuiltDeck deck);
}

@LazySingleton(as: DeckDataManager)
class DeckDataManagerImpl implements DeckDataManager {
  static final _preBuiltDecks = [
    if (kDebugMode) ...[
      TestDeck(),
    ],
    KaibaDeck(),
    MaiDeck(),
    YugiDeck(),
  ];

  final CloudDatabaseProvider _cloudDatabaseProvider;

  DeckDataManagerImpl(
    this._cloudDatabaseProvider,
  );

  @override
  Iterable<PreBuiltDeck> getPreBuiltDecks() {
    return _preBuiltDecks;
  }

  @override
  Future<Iterable<int>> getPreBuiltDeckCardIds(PreBuiltDeck deck) {
    return _cloudDatabaseProvider.getPreBuiltDeckCardIds(deck.id);
  }
}
