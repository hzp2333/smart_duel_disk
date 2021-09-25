import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_logger/lib/core_logger.dart';
import 'package:smart_duel_disk/packages/core/core_storage/lib/core_storage.dart';

abstract class YugiohCardsStorageProvider {
  DbYugiohCard? getSpeedDuelCard(int cardId);
  Iterable<DbYugiohCard>? getSpeedDuelCards();
  Future<void> saveSpeedDuelCard(DbYugiohCard card);
  Future<void> saveSpeedDuelCards(Iterable<DbYugiohCard> cards);
}

@LazySingleton(as: YugiohCardsStorageProvider)
class YugiohCardsStorageProviderImpl implements YugiohCardsStorageProvider {
  static const _tag = 'YugiohCardsStorageProviderImpl';

  final Box<DbYugiohCard> _box;
  final Logger _logger;

  YugiohCardsStorageProviderImpl(
    this._box,
    this._logger,
  );

  @override
  DbYugiohCard? getSpeedDuelCard(int cardId) {
    _logger.info(_tag, 'getSpeedDuelCard(cardId: $cardId)');

    return _box.get(cardId);
  }

  @override
  Iterable<DbYugiohCard>? getSpeedDuelCards() {
    _logger.info(_tag, 'getSpeedDuelCards()');

    final cards = _box.values;
    return cards.isEmpty ? null : cards;
  }

  @override
  Future<void> saveSpeedDuelCard(DbYugiohCard card) async {
    _logger.info(_tag, 'saveSpeedDuelCard(card: ${card.id})');

    await _box.put(card.id, card);
  }

  @override
  Future<void> saveSpeedDuelCards(Iterable<DbYugiohCard> cards) async {
    _logger.info(_tag, 'saveSpeedDuelCards()');

    final map = <int, DbYugiohCard>{};
    for (final card in cards) {
      map[card.id] = card;
    }

    await _box.putAll(map);
  }
}
