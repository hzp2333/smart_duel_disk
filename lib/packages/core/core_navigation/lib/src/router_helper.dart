import 'package:flutter/foundation.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/core_data_manager_interface/lib/core_data_manager_interface.dart';

import '../core_navigation.dart';

abstract class RouterHelper {
  Future<void> closeScreen();
  Future<bool> showDialog(DialogConfig dialogConfig);

  //region News

  Future<void> showNewsDetails(String newsItemId, String newsItemAuthorId);
  Future<void> showYoutube();
  Future<void> showTwitter();
  Future<void> showDiscord();

  //endregion

  //region Deck

  Future<void> showDeckBuilder({PreBuiltDeck preBuiltDeck});

  //endregion

  //region Duel

  Future<void> showSpeedDuel(PreBuiltDeck preBuiltDeck);
  Future<PreBuiltDeck> showSelectDeckDialog();

  //endregion

  //region Deck builder

  Future<void> showYugiohCardDetail(YugiohCard yugiohCard, int index);

  //endregion

  //region Speed duel

  Future<void> showDrawCard(VoidCallback cardDrawnCallback);

  //endregion
}
