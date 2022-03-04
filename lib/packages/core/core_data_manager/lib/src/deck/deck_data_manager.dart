import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/authentication/authentication.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_cloud_database/lib/wrapper_cloud_database.dart';

abstract class DeckDataManager {
  Iterable<PreBuiltDeck> getPreBuiltDecks();
  Future<Iterable<int>> getPreBuiltDeckCardIds(PreBuiltDeck deck);
  Stream<Iterable<UserDeck>> getUserDecks();
  Future<bool> canCreateDeck();
  Future<void> createDeck(String name, Iterable<int> cardIds);
  Future<void> deleteDeck(UserDeck deck);
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
  Stream<Iterable<UserDeck>> getUserDecks() {
    final userId = _getUserId();
    return _cloudDatabaseProvider.getUserData(userId).map((userData) => userData?.decks ?? []);
  }

  @override
  Future<bool> canCreateDeck() async {
    final currentUserData = await _getUserData();
    return currentUserData.decks.length < 20;
  }

  @override
  Future<void> createDeck(String name, Iterable<int> cardIds) async {
    final currentUserData = await _getUserData();

    final updatedUserData = currentUserData.copyWith(
      decks: [
        ...currentUserData.decks,
        UserDeck(
          name: name,
          cardIds: cardIds,
        ),
      ],
    );

    final userId = _getUserId();
    await _cloudDatabaseProvider.updateUserData(userId, updatedUserData);
  }

  @override
  Future<void> deleteDeck(UserDeck deck) async {
    final currentUserData = await _getUserData();

    final updatedDecks = currentUserData.decks.toList()..remove(deck);
    final updatedUserData = currentUserData.copyWith(decks: updatedDecks);

    final userId = _getUserId();
    await _cloudDatabaseProvider.updateUserData(userId, updatedUserData);
  }

  String _getUserId() {
    return _authService.getUser().id;
  }

  Future<UserData> _getUserData() async {
    final userId = _getUserId();
    final userData = await _cloudDatabaseProvider.getCurrentUserData(userId);

    return userData ?? UserData.create();
  }
}
