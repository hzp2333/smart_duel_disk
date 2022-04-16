import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/authentication/authentication.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/core/core_storage/lib/core_storage.dart';
import 'package:smart_duel_disk/packages/wrappers/uuid/uuid.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_cloud_database/lib/wrapper_cloud_database.dart';

abstract class DeckDataManager {
  Iterable<PreBuiltDeck> getPreBuiltDecks();
  Future<Iterable<int>> getPreBuiltDeckCardIds(PreBuiltDeck deck);
  Stream<Iterable<UserDeck>> getUserDecks();
  Future<bool> canCreateDeck();
  Future<UserDeck> createDeck(String name, Iterable<int> cardIds);
  Future<void> updateDeckName(String newName, UserDeck deck);
  Future<void> deleteDeck(UserDeck deck);
  String? getLastSelectedDeckId();
  Future<void> setLastSelectedDeckId(String deckId);
  int? getLastSelectedSkillCardId();
  Future<void> setLastSelectedSkillCardId(int cardId);
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
  final DeckStorageProvider _deckStorageProvider;
  final UuidProvider _uuidProvider;

  DeckDataManagerImpl(
    this._authService,
    this._cloudDatabaseProvider,
    this._deckStorageProvider,
    this._uuidProvider,
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
  Future<UserDeck> createDeck(String name, Iterable<int> cardIds) async {
    final currentUserData = await _getUserData();

    final newDeck = UserDeck(
      id: _uuidProvider.generateUuid(),
      name: name,
      cardIds: cardIds,
    );

    final updatedUserData = currentUserData.copyWith(
      decks: [
        ...currentUserData.decks,
        newDeck,
      ],
    );

    final userId = _getUserId();
    await _cloudDatabaseProvider.updateUserData(userId, updatedUserData);

    return newDeck;
  }

  @override
  Future<void> updateDeckName(String newName, UserDeck deck) async {
    final currentUserData = await _getUserData();
    final currentDecks = currentUserData.decks.toList();
    final deckIndex = currentDecks.indexOf(deck);

    final updatedDeck = deck.copyWith(name: newName);
    final updatedDecks = currentDecks
      ..removeAt(deckIndex)
      ..insert(deckIndex, updatedDeck);

    final updatedUserData = currentUserData.copyWith(decks: updatedDecks);

    final userId = _getUserId();
    await _cloudDatabaseProvider.updateUserData(userId, updatedUserData);
  }

  @override
  Future<void> deleteDeck(UserDeck deck) async {
    final currentUserData = await _getUserData();

    final updatedDecks = currentUserData.decks.toList()..removeWhere((d) => d.id == deck.id);
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

  @override
  String? getLastSelectedDeckId() {
    return _deckStorageProvider.getLastSelectedDeckId();
  }

  @override
  Future<void> setLastSelectedDeckId(String deckId) {
    return _deckStorageProvider.setLastSelectedDeckId(deckId);
  }

  @override
  int? getLastSelectedSkillCardId() {
    return _deckStorageProvider.getLastSelectedSkillCardId();
  }

  @override
  Future<void> setLastSelectedSkillCardId(int cardId) {
    return _deckStorageProvider.setLastSelectedSkillCardId(cardId);
  }
}
