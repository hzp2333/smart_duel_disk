import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'select_deck/widgets/select_deck_dialog_provider.dart';

@LazySingleton()
class DuelDialogProvider {
  Widget createSelectDeckDialog() => const SelectDeckDialogProvider();
}
