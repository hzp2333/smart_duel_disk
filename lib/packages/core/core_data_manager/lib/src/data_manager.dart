import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';

abstract class DataManager
    implements NewsDataManager, YugiohCardsDataManager, DeckDataManager, DuelDataManager, SettingsDataManager {}

@LazySingleton(as: DataManager)
class DataManagerImpl implements DataManager {
  final NewsDataManager _newsDataManager;
  final YugiohCardsDataManager _yugiohCardsDataManager;
  final DeckDataManager _deckDataManager;
  final DuelDataManager _duelDataManager;
  final SettingsDataManager _settingsDataManager;

  DataManagerImpl(
    this._newsDataManager,
    this._yugiohCardsDataManager,
    this._deckDataManager,
    this._duelDataManager,
    this._settingsDataManager,
  );

  //region News

  @override
  Future<Iterable<NewsItem>> getNewsItems() {
    return _newsDataManager.getNewsItems();
  }

  //endregion

  //region Yu-Gi-Oh! cards

  @override
  Future<YugiohCard> getSpeedDuelCard(int cardId) {
    return _yugiohCardsDataManager.getSpeedDuelCard(cardId);
  }

  @override
  Future<Iterable<YugiohCard>> getSpeedDuelCards() {
    return _yugiohCardsDataManager.getSpeedDuelCards();
  }

  @override
  Future<YugiohCard> getToken() {
    return _yugiohCardsDataManager.getToken();
  }

  @override
  bool hasSpeedDuelCardsCache() {
    return _yugiohCardsDataManager.hasSpeedDuelCardsCache();
  }

  //endregion

  //region Decks

  @override
  Iterable<PreBuiltDeck> getPreBuiltDecks() {
    return _deckDataManager.getPreBuiltDecks();
  }

  @override
  Future<Iterable<int>> getPreBuiltDeckCardIds(PreBuiltDeck deck) {
    return _deckDataManager.getPreBuiltDeckCardIds(deck);
  }

  //endregion

  //region Duel

  @override
  ConnectionInfo? getConnectionInfo({bool forceLocalInfo = false}) {
    return _duelDataManager.getConnectionInfo(forceLocalInfo: forceLocalInfo);
  }

  @override
  Future<void> saveConnectionInfo(ConnectionInfo connectionInfo) {
    return _duelDataManager.saveConnectionInfo(connectionInfo);
  }

  @override
  bool useOnlineDuelRoom() {
    return _duelDataManager.useOnlineDuelRoom();
  }

  @override
  Future<void> saveUseOnlineDuelRoom({required bool value}) {
    return _duelDataManager.saveUseOnlineDuelRoom(value: value);
  }

  @override
  Iterable<DeckAction> getDeckActions() {
    return _duelDataManager.getDeckActions();
  }

  //endregion

  //region Settings

  @override
  bool isDeveloperModeEnabled() {
    return _settingsDataManager.isDeveloperModeEnabled();
  }

  @override
  Future<void> saveDeveloperModeEnabled({required bool value}) {
    return _settingsDataManager.saveDeveloperModeEnabled(value: value);
  }

  //endregion
}
