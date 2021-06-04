import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/core_data_manager_interface/lib/src/yugioh_cards/entities/yugioh_card.dart';
import 'package:smart_duel_disk/packages/core/core_storage/core_storage_interface/lib/core_storage_interface.dart';

@LazySingleton(as: YugiohCardsStorageProvider)
class YugiohCardsStorageProviderImpl implements YugiohCardsStorageProvider {
  Iterable<YugiohCard> _speedDuelCards;
  YugiohCard _token;

  @override
  Iterable<YugiohCard> getSpeedDuelCards() {
    return _speedDuelCards;
  }

  @override
  Future<void> saveSpeedDuelCards(Iterable<YugiohCard> speedDuelCards) async {
    _speedDuelCards = speedDuelCards;
  }

  @override
  YugiohCard getToken() {
    return _token;
  }

  @override
  Future<void> saveToken(YugiohCard token) async {
    _token = token;
  }
}
