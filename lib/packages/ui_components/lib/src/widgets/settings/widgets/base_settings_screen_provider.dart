import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/packages/core/core_localization/lib/core_localization.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';
import 'package:smart_duel_disk/src/di/di.dart';

import 'base_settings_screen.dart';

class BaseSettingsScreenProvider extends StatelessWidget {
  final String screenTitleId;
  final Stream<Iterable<SettingItem>> settingsStream;
  final bool showBackButton;
  final bool showCloseButton;

  const BaseSettingsScreenProvider({
    required this.screenTitleId,
    required this.settingsStream,
    this.showBackButton = true,
    this.showCloseButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => di.get<StringProvider>()),
      ],
      child: BaseSettingsScreen(
        screenTitleId: screenTitleId,
        settingsStream: settingsStream,
        showBackButton: showBackButton,
        showCloseButton: showCloseButton,
      ),
    );
  }
}
