import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/play_card.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone.dart';

import 'play_card_dialog/widgets/play_card_dialog_provider.dart';

@LazySingleton()
class SpeedDuelDialogProvider {
  Widget getPlayCardDialog(PlayCard playCard, {Zone newZone}) =>
      PlayCardDialogProvider(playCard: playCard, newZone: newZone);
}
