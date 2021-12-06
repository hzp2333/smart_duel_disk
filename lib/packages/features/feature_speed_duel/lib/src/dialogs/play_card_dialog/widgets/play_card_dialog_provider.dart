import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/packages/core/core_logger/lib/core_logger.dart';
import 'package:smart_duel_disk/packages/core/core_navigation/lib/core_navigation.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/dialogs/base/speed_duel_dialog_viewmodel.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/dialogs/base/widgets/speed_duel_dialog.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/dialogs/play_card_dialog/models/play_card_dialog_parameters.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/dialogs/play_card_dialog/usecases/create_play_card_dialog_actions_use_case.dart';
import 'package:smart_duel_disk/src/di/di.dart';

import '../play_card_dialog_viewmodel.dart';

class PlayCardDialogProvider extends StatelessWidget {
  final PlayCardDialogParameters parameters;

  const PlayCardDialogProvider({
    required this.parameters,
  });

  @override
  Widget build(BuildContext context) {
    return Provider<SpeedDuelDialogViewModel>(
      create: (_) => PlayCardDialogViewModel(
        parameters,
        di.get<CreatePlayCardDialogActionsUseCase>(),
        di.get<DialogService>(),
        di.get<Logger>(),
      ),
      child: const SpeedDuelDialog(),
    );
  }
}
