import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/authentication/authentication.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_cloud_database/lib/wrapper_cloud_database.dart';

abstract class DeckDataManager {
  Iterable<PreBuiltDeck> getPreBuiltDecks();
  Future<Iterable<int>> getPreBuiltDeckCardIds(PreBuiltDeck deck);
  Future<bool> canCreateDeck();
  Future<void> createDeck(Iterable<int> cardIds);
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

  final AuthenticationService _authService;
  final CloudDatabaseProvider _cloudDatabaseProvider;

  DeckDataManagerImpl(
    this._authService,
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

  @override
  Future<bool> canCreateDeck() async {
    final userId = _authService.getUser().id;
    final currentUserData = await _getUserData(userId);

    return currentUserData.decks.length < 20;
  }

  @override
  Future<void> createDeck(Iterable<int> cardIds) async {
    final userId = _authService.getUser().id;
    final currentUserData = await _getUserData(userId);

    final updatedUserData = currentUserData.copyWith(
      decks: [
        ...currentUserData.decks,
        UserDeck(
          name: 'Deck ${currentUserData.decks.length + 1}',
          cardIds: cardIds,
        ),
      ],
    );

    await _cloudDatabaseProvider.updateUserData(userId, updatedUserData);
  }

  Future<UserData> _getUserData(String userId) async {
    final userData = await _cloudDatabaseProvider.getCurrentUserData(userId);
    return userData ?? UserData.create();
  }
}
