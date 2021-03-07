import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/play_card.dart';

import 'widgets/card_detail_dialog.dart';

@LazySingleton()
class SpeedDuelDialogProvider {
  Widget getCardDetailDialog(PlayCard playCard) => CardDetailDialog(playCard: playCard);
}
