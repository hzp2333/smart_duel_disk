import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_config/lib/core_config.dart';
import 'package:smart_duel_disk/packages/core/core_logger/lib/core_logger.dart';
import 'package:smart_duel_disk/packages/core/core_storage/lib/core_storage.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_remote_config/lib/wrapper_remote_config.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_shared_preferences/lib/wrapper_shared_preferences.dart';

abstract class YugiohCardsStorageProvider {
  bool hasData();
  DbYugiohCard? getSpeedDuelCard(int cardId);
  Iterable<DbYugiohCard>? getSpeedDuelCards();
  Future<void> saveSpeedDuelCard(DbYugiohCard card);
  Future<void> saveSpeedDuelCards(Iterable<DbYugiohCard> cards);
}

@LazySingleton(as: YugiohCardsStorageProvider)
class YugiohCardsStorageProviderImpl implements YugiohCardsStorageProvider {
  static const _tag = 'YugiohCardsStorageProviderImpl';

  static const _yugiohCardsCacheTimestampKey = 'yugiohCardsCacheTimestamp';

  final Box<DbYugiohCard> _box;
  final SharedPreferencesProvider _sharedPreferencesProvider;
  final RemoteConfigProvider _remoteConfigProvider;
  final DateTimeProvider _dateTimeProvider;
  final Logger _logger;

  YugiohCardsStorageProviderImpl(
    this._box,
    this._sharedPreferencesProvider,
    this._remoteConfigProvider,
    this._dateTimeProvider,
    this._logger,
  );

  @override
  bool hasData() {
    _logger.info(_tag, 'hasData()');

    return _isCacheValid();
  }

  @override
  DbYugiohCard? getSpeedDuelCard(int cardId) {
    _logger.info(_tag, 'getSpeedDuelCard(cardId: $cardId)');

    return _box.get(cardId);
  }

  @override
  Iterable<DbYugiohCard>? getSpeedDuelCards() {
    _logger.info(_tag, 'getSpeedDuelCards()');

    if (!_isCacheValid()) {
      return null;
    }

    final cards = _box.values;
    return cards.isEmpty ? null : cards;
  }

  bool _isCacheValid() {
    _logger.verbose(_tag, '_isCacheValid()');

    final lastCacheString = _sharedPreferencesProvider.getString(_yugiohCardsCacheTimestampKey);
    if (lastCacheString == null) {
      return false;
    }

    final databaseUpdateString = _remoteConfigProvider.getString(RemoteConfigKeys.lastCardDatabaseUpdate);
    final databaseUpdate = DateTime.parse(databaseUpdateString);

    final lastCache = DateTime.parse(lastCacheString);
    return lastCache.isAfter(databaseUpdate) && _box.values.length > 1;
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

    await _updateYugiohCardsCacheTimestamp();
  }

  Future<void> _updateYugiohCardsCacheTimestamp() async {
    _logger.verbose(_tag, '_updateYugiohCardsCacheTimestamp()');

    await _sharedPreferencesProvider.setString(
      _yugiohCardsCacheTimestampKey,
      _dateTimeProvider.currentUtcDateTime.toString(),
    );
  }
}
