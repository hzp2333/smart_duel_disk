import 'package:smart_duel_disk/packages/core/core_data_manager/core_data_manager_interface/lib/core_data_manager_interface.dart';

abstract class RouterHelper {
  //region News

  Future<void> showNewsDetails(String newsItemId, String newsItemAuthorId);

  //endregion

  //region Deck

  Future<void> showDeckBuilder();

  //endregion

  //region Yu-Gi-Oh! Card Detail

  Future<void> showYugiohCardDetail(YugiohCard yugiohCard);

  //endregion

  //region Social Media

  Future<void> showYoutube();
  Future<void> showTwitter();
  Future<void> showDiscord();

  //endregion
}
