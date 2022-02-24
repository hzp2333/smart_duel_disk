import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_logger/lib/core_logger.dart';
import 'package:smart_duel_disk/packages/core/core_storage/lib/core_storage.dart';
import 'package:smart_duel_disk/packages/core/core_ygoprodeck/lib/core_ygoprodeck.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_enum_helper/lib/wrapper_enum_helper.dart';

import 'entities/yugioh_card.dart';
import 'extensions/db_yugioh_card_extensions.dart';
import 'extensions/yugioh_card_extensions.dart';

abstract class YugiohCardsDataManager {
  Future<YugiohCard> getSpeedDuelCard(int cardId);
  Future<Iterable<YugiohCard>> getSpeedDuelCards();
  Future<YugiohCard> getToken();
  bool hasSpeedDuelCardsCache();
}

@LazySingleton(as: YugiohCardsDataManager)
class YugiohCardsDataManagerImpl implements YugiohCardsDataManager {
  static const _tag = 'YugiohCardsDataManagerImpl';

  final YgoProDeckApiProvider _ygoProDeckApiProvider;
  final YugiohCardsStorageProvider _yugiohCardsStorageProvider;
  final EnumHelper _enumHelper;
  final Logger _logger;

  YugiohCardsDataManagerImpl(
    this._ygoProDeckApiProvider,
    this._yugiohCardsStorageProvider,
    this._enumHelper,
    this._logger,
  );

  @override
  Future<YugiohCard> getSpeedDuelCard(int cardId) async {
    _logger.info(_tag, 'getSpeedDuelCard(cardId: $cardId)');

    final dbCard = _yugiohCardsStorageProvider.getSpeedDuelCard(cardId);
    if (dbCard != null) {
      return dbCard.toEntity(_enumHelper);
    }

    final apiCard = await _ygoProDeckApiProvider.getSpeedDuelCard(cardId);
    final card = apiCard.toEntity();

    await _yugiohCardsStorageProvider.saveSpeedDuelCard(card.toDbModel(_enumHelper));

    return card;
  }

  @override
  Future<Iterable<YugiohCard>> getSpeedDuelCards() async {
    _logger.info(_tag, 'getSpeedDuelCards()');

    final dbCards = _yugiohCardsStorageProvider.getSpeedDuelCards();
    if (dbCards != null) {
      final cards = dbCards.map((dbCard) => dbCard.toEntity(_enumHelper));
      return cards;
    }

    final apiCards = kDebugMode
        ? await _ygoProDeckApiProvider.getAllYugiohCards()
        : await _ygoProDeckApiProvider.getSpeedDuelCards();
    final cards = apiCards.map((apiCard) => apiCard.toEntity());

    await _yugiohCardsStorageProvider.saveSpeedDuelCards(cards.map((card) => card.toDbModel(_enumHelper)));

    return cards;
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
