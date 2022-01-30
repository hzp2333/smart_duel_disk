import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/src/di/di.dart';

import '../game_settings_viewmodel.dart';
import 'game_settings_screen.dart';

class GameSettingsScreenProvider extends StatelessWidget {
  final bool showBackButton;
  final bool showCloseButton;

  const GameSettingsScreenProvider({
    required this.showBackButton,
    required this.showCloseButton,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<GameSettingsViewModel>(
          create: (_) => di.get<GameSettingsViewModel>(),
          dispose: (_, vm) => vm.dispose(),
        ),
      ],
      child: GameSettingsScreen(
        showBackButton: showBackButton,
        showCloseButton: showCloseButton,
      ),
    );
  }
}
