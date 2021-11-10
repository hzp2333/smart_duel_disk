import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/speed_duel_models.dart';

import 'add_card_to_deck_dialog/widgets/add_card_to_deck_dialog_provider.dart';
import 'play_card_dialog/models/play_card_dialog_parameters.dart';
import 'play_card_dialog/widgets/play_card_dialog_provider.dart';

@LazySingleton()
class SpeedDuelDialogProvider {
  Widget createAddCardToDeckDialog(PlayCard playCard) {
    return AddCardToDeckDialogProvider(playCard: playCard);
  }

  Widget createPlayCardDialog(PlayCardDialogParameters parameters) {
    return PlayCardDialogProvider(parameters: parameters);
  }
}
