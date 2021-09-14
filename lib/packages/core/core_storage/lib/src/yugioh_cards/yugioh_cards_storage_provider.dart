import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';

abstract class YugiohCardsStorageProvider {
  Iterable<YugiohCard>? getSpeedDuelCards();
  Future<void> saveSpeedDuelCards(Iterable<YugiohCard> speedDuelCards);
  YugiohCard getSpeedDuelCard(int cardId);
  YugiohCard? getToken();
  Future<void> saveToken(YugiohCard token);
}

@LazySingleton(as: YugiohCardsStorageProvider)
class YugiohCardsStorageProviderImpl implements YugiohCardsStorageProvider {
  Iterable<YugiohCard>? _speedDuelCards;
  YugiohCard? _token;

  @override
  Iterable<YugiohCard>? getSpeedDuelCards() {
    return _speedDuelCards;
  }

  @override
  Future<void> saveSpeedDuelCards(Iterable<YugiohCard> speedDuelCards) async {
    _speedDuelCards = speedDuelCards;
  }

  @override
  YugiohCard getSpeedDuelCard(int cardId) {
    return _speedDuelCards!.firstWhere((card) => card.id == cardId);
  }

  @override
  YugiohCard? getToken() {
    return _token;
  }

  @override
  Future<void> saveToken(YugiohCard token) async {
    _token = token;
  }
}
