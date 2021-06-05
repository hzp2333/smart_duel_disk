import 'package:smart_duel_disk/packages/core/core_data_manager/core_data_manager_interface/lib/core_data_manager_interface.dart';

abstract class YugiohCardsStorageProvider {
  Iterable<YugiohCard> getSpeedDuelCards();
  Future<void> saveSpeedDuelCards(Iterable<YugiohCard> speedDuelCards);
  YugiohCard getSpeedDuelCard(int cardId);
  YugiohCard getToken();
  Future<void> saveToken(YugiohCard token);
}
