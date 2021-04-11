import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/play_card.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone.dart';
import 'package:smart_duel_disk/src/di/di.dart';

import '../play_card_dialog_viewmodel.dart';
import 'play_card_dialog.dart';

class PlayCardDialogProvider extends StatelessWidget {
  final PlayCard playCard;
  final Zone newZone;

  const PlayCardDialogProvider({
    @required this.playCard,
    @required this.newZone,
  });

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => di.get<PlayCardDialogViewModel>(
        param1: playCard,
        param2: newZone,
      ),
      child: const PlayCardDialog(),
    );
  }
}
