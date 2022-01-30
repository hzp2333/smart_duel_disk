import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/generated/locale_keys.g.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

import '../game_settings_viewmodel.dart';

class GameSettingsScreen extends StatefulWidget {
  final bool showBackButton;
  final bool showCloseButton;

  const GameSettingsScreen({
    required this.showBackButton,
    required this.showCloseButton,
  });

  @override
  State<GameSettingsScreen> createState() => _GameSettingsScreenState();
}

class _GameSettingsScreenState extends State<GameSettingsScreen> {
  @override
  void initState() {
    super.initState();

    final vm = Provider.of<GameSettingsViewModel>(context, listen: false);
    vm.init();
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<GameSettingsViewModel>(context);

    return BaseSettingsScreenProvider(
      screenTitleId: LocaleKeys.game_settings_title,
      settingsStream: vm.gameSettings,
      showBackButton: widget.showBackButton,
      showCloseButton: widget.showCloseButton,
    );
  }
}
