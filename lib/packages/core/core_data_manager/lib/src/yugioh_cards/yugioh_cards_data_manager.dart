import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_storage/lib/core_storage.dart';
import 'package:smart_duel_disk/packages/core/core_ygoprodeck/lib/core_ygoprodeck.dart';

import 'entities/yugioh_card.dart';

abstract class YugiohCardsDataManager {
  Future<Iterable<YugiohCard>> getSpeedDuelCards();
  Future<YugiohCard> getSpeedDuelCard(int cardId);
  Future<YugiohCard> getToken();
}

@LazySingleton(as: YugiohCardsDataManager)
class YugiohCardsDataManagerImpl implements YugiohCardsDataManager {
  final YgoProDeckApiProvider _ygoProDeckApiProvider;
  final YugiohCardsStorageProvider _yugiohCardsStorageProvider;

  YugiohCardsDataManagerImpl(
    this._ygoProDeckApiProvider,
    this._yugiohCardsStorageProvider,
  );

  @override
  Future<Iterable<YugiohCard>> getSpeedDuelCards() async {
    var cards = _yugiohCardsStorageProvider.getSpeedDuelCards();
    if (cards != null) {
      return cards;
    }

    cards = await _ygoProDeckApiProvider.getSpeedDuelCards();
    await _yugiohCardsStorageProvider.saveSpeedDuelCards(cards);
    return cards;
  }

  @override
  Future<YugiohCard> getSpeedDuelCard(int cardId) {
    return Future.value(_yugiohCardsStorageProvider.getSpeedDuelCard(cardId));
  }

  @override
  Future<YugiohCard> getToken() async {
    var token = _yugiohCardsStorageProvider.getToken();
    if (token != null) {
      return token;
    }

    token = await _ygoProDeckApiProvider.getToken();
    await _yugiohCardsStorageProvider.saveToken(token);
    return token;
  }
}
