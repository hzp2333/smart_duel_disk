import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/src/di/di.dart';

import '../user_settings_viewmodel.dart';
import 'user_settings_screen.dart';

class UserSettingsScreenProvider extends StatelessWidget {
  const UserSettingsScreenProvider();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => di.get<UserSettingsViewModel>()),
      ],
      child: const UserSettingsScreen(),
    );
  }
}
