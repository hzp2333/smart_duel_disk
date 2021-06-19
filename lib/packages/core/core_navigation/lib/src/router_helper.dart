import 'package:flutter/foundation.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/core_data_manager_interface/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/core/core_smart_duel_server/core_smart_duel_server_interface/lib/core_smart_duel_server_interface.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/card_position.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/play_card.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone.dart';

import '../core_navigation.dart';

abstract class RouterHelper {
  Future<void> closeScreen();
  Future<bool> showDialog(DialogConfig dialogConfig);

  //region Home

  Future<void> showHome();

  //endregion

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

  Future<void> showSpeedDuel(DuelRoom duelRoom);
  Future<PreBuiltDeck> showSelectDeckDialog();

  //endregion

  //region Deck builder

  Future<void> showYugiohCardDetail(YugiohCard yugiohCard, int index);

  //endregion

  //region Speed duel

  Future<void> showDrawCard(VoidCallback cardDrawnCallback);
  Future<CardPosition> showPlayCardDialog(PlayCard playCard, {Zone newZone});

  //endregion

  //region Duel Room

  Future<void> showDuelRoom(PreBuiltDeck preBuiltDeck);

  //endregion

  Future<void> launchUrl(String url);
}
