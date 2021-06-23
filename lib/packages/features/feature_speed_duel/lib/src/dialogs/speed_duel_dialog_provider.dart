import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'play_card_dialog/models/play_card_dialog_parameters.dart';
import 'play_card_dialog/widgets/play_card_dialog_provider.dart';

@LazySingleton()
class SpeedDuelDialogProvider {
  Widget createPlayCardDialog(PlayCardDialogParameters parameters) {
    return PlayCardDialogProvider(parameters: parameters);
  }
}
