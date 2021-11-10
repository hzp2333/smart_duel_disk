import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/packages/core/core_logger/lib/core_logger.dart';
import 'package:smart_duel_disk/packages/core/core_navigation/lib/core_navigation.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/dialogs/base/speed_duel_dialog_viewmodel.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/dialogs/base/widgets/speed_duel_dialog.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/speed_duel_models.dart';
import 'package:smart_duel_disk/src/di/di.dart';

import '../add_card_to_deck_dialog_viewmodel.dart';

class AddCardToDeckDialogProvider extends StatelessWidget {
  final PlayCard playCard;

  const AddCardToDeckDialogProvider({
    required this.playCard,
  });

  @override
  Widget build(BuildContext context) {
    return Provider<SpeedDuelDialogViewModel>(
      create: (_) => AddCardToDeckDialogViewModel(
        playCard,
        di.get<DialogService>(),
        di.get<Logger>(),
      ),
      child: const SpeedDuelDialog(),
    );
  }
}
