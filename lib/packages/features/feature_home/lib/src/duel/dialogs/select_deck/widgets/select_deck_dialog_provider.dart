import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/src/di/di.dart';

import '../select_deck_dialog_viewmodel.dart';
import 'select_deck_dialog.dart';

class SelectDeckDialogProvider extends StatelessWidget {
  const SelectDeckDialogProvider();

  @override
  Widget build(BuildContext context) {
    return Provider<SelectDeckDialogViewModel>(
      create: (_) => di.get<SelectDeckDialogViewModel>(),
      dispose: (_, vm) => vm.dispose(),
      child: const SelectDeckDialog(),
    );
  }
}
