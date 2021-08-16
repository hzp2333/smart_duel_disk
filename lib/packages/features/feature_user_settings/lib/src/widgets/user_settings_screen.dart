import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/packages/features/feature_user_settings/lib/src/models/setting_item.dart';
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
    return const Scaffold(
      // TODO: localization
      appBar: SddAppBar(
        title: 'User Settings',
        showBackButton: false,
        showCloseButton: true,
      ),
      body: _Body(),
      backgroundColor: AppColors.primaryBackgroundColor,
    );
  }
}

class _Body extends HookWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<UserSettingsViewModel>(context);
    final userSettings = useStream(vm.userSettings);

    if (!userSettings.hasData) {
      return const GeneralLoadingState();
    }

    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(AppSizes.screenMargin),
      itemCount: userSettings.data.length,
      itemBuilder: (context, index) {
        return _SettingListItemContainer(settingItem: userSettings.data.elementAt(index));
      },
    );
  }
}

class _SettingListItemContainer extends StatelessWidget {
  final SettingItem settingItem;

  const _SettingListItemContainer({
    @required this.settingItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: AppColors.cardBackgroundColor,
        borderRadius: BorderRadius.circular(AppSizes.generalBorderRadius),
      ),
      child: _SettingsListItem(settingItem: settingItem),
    );
  }
}

class _SettingsListItem extends StatelessWidget {
  final SettingItem settingItem;

  const _SettingsListItem({
    @required this.settingItem,
  });

  @override
  Widget build(BuildContext context) {
    final item = settingItem;

    if (item is SwitchSettingItem) {
      return ListTile(
        leading: Icon(item.leadingIcon),
        title: Text(item.title),
        contentPadding: EdgeInsets.zero,
        horizontalTitleGap: 0,
        trailing: Switch.adaptive(
          value: item.value,
          onChanged: item.onValueChanged,
        ),
      );
    }

    return ListTile(
      leading: Icon(item.leadingIcon),
      title: Text(item.title),
      contentPadding: EdgeInsets.zero,
      horizontalTitleGap: 0,
    );
  }
}
