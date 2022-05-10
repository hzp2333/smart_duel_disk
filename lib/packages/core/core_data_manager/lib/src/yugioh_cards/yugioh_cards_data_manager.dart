import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/core/core_logger/lib/core_logger.dart';
import 'package:smart_duel_disk/packages/core/core_storage/lib/core_storage.dart';
import 'package:smart_duel_disk/packages/core/core_ygoprodeck/lib/core_ygoprodeck.dart';

import 'extensions/db_yugioh_card_extensions.dart';
import 'extensions/yugioh_card_extensions.dart';

abstract class YugiohCardsDataManager {
  Future<YugiohCard> getSpeedDuelCard(int cardId);
  Future<Iterable<YugiohCard>> getSpeedDuelCards();
  Future<Iterable<YugiohCard>> getSkillCards();
  Future<YugiohCard> getToken();
  bool hasSpeedDuelCardsCache();
}

@LazySingleton(as: YugiohCardsDataManager)
class YugiohCardsDataManagerImpl implements YugiohCardsDataManager {
  static const _tag = 'YugiohCardsDataManagerImpl';

  final YgoProDeckApiProvider _ygoProDeckApiProvider;
  final YugiohCardsStorageProvider _yugiohCardsStorageProvider;
  final Logger _logger;

  YugiohCardsDataManagerImpl(
    this._ygoProDeckApiProvider,
    this._yugiohCardsStorageProvider,
    this._logger,
  );

  @override
  Future<YugiohCard> getSpeedDuelCard(int cardId) async {
    _logger.info(_tag, 'getSpeedDuelCard(cardId: $cardId)');

    final dbCard = _yugiohCardsStorageProvider.getSpeedDuelCard(cardId);
    if (dbCard != null) {
      return dbCard.toEntity();
    }

    final apiCard = await _ygoProDeckApiProvider.getSpeedDuelCard(cardId);
    final card = apiCard.toEntity();

    await _yugiohCardsStorageProvider.saveSpeedDuelCard(card.toDbModel());

    return card;
  }

  @override
  Future<Iterable<YugiohCard>> getSpeedDuelCards() async {
    _logger.info(_tag, 'getSpeedDuelCards()');

    var dbCards = _yugiohCardsStorageProvider.getSpeedDuelCards();
    if (dbCards != null) {
      final cards = await compute(_mapDatabaseCardsToEntities, dbCards.toList());
      return cards;
    }

    final apiCards = await _ygoProDeckApiProvider.getSpeedDuelCards();
    final cards = await compute(_mapApiCardsToEntities, apiCards.toList());

    dbCards = await compute(_mapCardsToDatabaseModels, cards);
    await _yugiohCardsStorageProvider.saveSpeedDuelCards(dbCards!);

    return cards;
  }

  static List<YugiohCard> _mapDatabaseCardsToEntities(List<DbYugiohCard> cards) {
    return cards.map((card) => card.toEntity()).toList();
  }

  static List<YugiohCard> _mapApiCardsToEntities(List<SpeedDuelCardModel> cards) {
    return cards.map((card) => card.toEntity()).toList();
  }

  static List<DbYugiohCard> _mapCardsToDatabaseModels(List<YugiohCard> cards) {
    return cards.map((card) => card.toDbModel()).toList();
  }

  @override
  Future<Iterable<YugiohCard>> getSkillCards() async {
    _logger.info(_tag, 'getSkillCards()');

    final cards = await getSpeedDuelCards();
    return cards.where((card) => card.type == CardType.skillCard).toList();
  }

  @override
  Future<YugiohCard> getToken() {
    _logger.info(_tag, 'getToken()');

    return getSpeedDuelCard(73915052);
  }

  @override
  bool hasSpeedDuelCardsCache() {
    _logger.info(_tag, 'hasSpeedDuelCardsCache()');

    return _yugiohCardsStorageProvider.hasData();
  }
}
