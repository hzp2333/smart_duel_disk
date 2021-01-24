import 'package:smart_duel_disk/packages/core/core_data_manager/core_data_manager_interface/lib/core_data_manager_interface.dart';

abstract class RouterHelper {
  Future<void> closeScreen();

  //region News

  Future<void> showNewsDetails(String newsItemId, String newsItemAuthorId);
  Future<void> showYoutube();
  Future<void> showTwitter();
  Future<void> showDiscord();

  //endregion

  //region Deck

  Future<void> showDeckBuilder();

  //endregion

  //region Duel

  Future<void> showDrawCard();
  Future<void> showSpeedDuel();

  //endregion

  //region Deck builder

  Future<void> showYugiohCardDetail(YugiohCard yugiohCard);

  //endregion
}
