import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/generated/locale_keys.g.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

import '../user_settings_viewmodel.dart';

class UserSettingsScreen extends StatefulWidget {
  const UserSettingsScreen();

  @override
  _UserSettingsScreenState createState() => _UserSettingsScreenState();
}

class _UserSettingsScreenState extends State<UserSettingsScreen> {
  @override
  void initState() {
    super.initState();

    final vm = Provider.of<UserSettingsViewModel>(context, listen: false);
    vm.init();
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<UserSettingsViewModel>(context);

    return BaseSettingsScreenProvider(
      screenTitleId: LocaleKeys.user_settings_title,
      settingsStream: vm.userSettings,
      showBackButton: false,
      showCloseButton: true,
    );
  }
}
