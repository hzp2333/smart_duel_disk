import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/core_data_manager_interface/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/core/core_storage/core_storage_interface/lib/core_storage_interface.dart';
import 'package:smart_duel_disk/packages/core/core_ygoprodeck/core_ygoprodeck_interface/lib/core_ygoprodeck_interface.dart';

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
    _yugiohCardsStorageProvider.saveSpeedDuelCards(cards);
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
    _yugiohCardsStorageProvider.saveToken(token);
    return token;
  }
}
