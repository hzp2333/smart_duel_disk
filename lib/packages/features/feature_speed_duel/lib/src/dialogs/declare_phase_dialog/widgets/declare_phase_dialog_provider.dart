import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/packages/core/core_logger/lib/core_logger.dart';
import 'package:smart_duel_disk/packages/core/core_navigation/lib/core_navigation.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/dialogs/declare_phase_dialog/models/declare_phase_dialog_parameters.dart';

import 'package:smart_duel_disk/src/di/di.dart';

import '../declare_phase_dialog_viewmodel.dart';
import 'declare_phase_dialog.dart';

class DeclarePhaseDialogProvider extends StatelessWidget {
  final DeclarePhaseDialogParameters parameters;

  const DeclarePhaseDialogProvider({
    required this.parameters,
  });

  @override
  Widget build(BuildContext context) {
    return Provider<DeclarePhaseDialogViewModel>(
      create: (_) => DeclarePhaseDialogViewModel(
        parameters,
        di.get<DialogService>(),
        di.get<Logger>(),
      ),
      child: const DeclarePhaseDialog(),
    );
  }
}
