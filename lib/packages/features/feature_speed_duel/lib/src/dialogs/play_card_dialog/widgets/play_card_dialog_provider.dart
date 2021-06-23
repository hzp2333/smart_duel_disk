import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/dialogs/play_card_dialog/models/play_card_dialog_parameters.dart';
import 'package:smart_duel_disk/src/di/di.dart';

import '../play_card_dialog_viewmodel.dart';
import 'play_card_dialog.dart';

class PlayCardDialogProvider extends StatelessWidget {
  final PlayCardDialogParameters parameters;

  const PlayCardDialogProvider({
    @required this.parameters,
  });

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => di.get<PlayCardDialogViewModel>(
        param1: parameters,
      ),
      child: const PlayCardDialog(),
    );
  }
}
