import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/generated/locale_keys.g.dart';
import 'package:smart_duel_disk/packages/features/feature_user_settings/lib/src/models/setting_item.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

import '../user_settings_viewmodel.dart';

class UserSettingsScreen extends StatefulWidget {
  const UserSettingsScreen();

  @override
  _UserSettingsScreenState createState() => _UserSettingsScreenState();
}

class _UserSettingsScreenState extends State<UserSettingsScreen> with ProviderMixin {
  @override
  void initState() {
    super.initState();

    final vm = Provider.of<UserSettingsViewModel>(context, listen: false);
    vm.init();
  }

  @override
  Widget build(BuildContext context) {
    final stringProvider = getStringProvider(context);

    return Scaffold(
      appBar: SddAppBar(
        title: stringProvider.getString(LocaleKeys.user_settings_title),
        showBackButton: false,
        showCloseButton: true,
      ),
      body: const _Body(),
      backgroundColor: AppColors.primaryBackgroundColor,
    );
  }
}

class _Body extends HookWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<UserSettingsViewModel>(context);
    final userSettingsSnapshot = useStream(vm.userSettings);

    if (!userSettingsSnapshot.hasData) {
      return const GeneralLoadingState();
    }

    final userSettings = userSettingsSnapshot.requireData;

    return ListView.separated(
      shrinkWrap: true,
      padding: const EdgeInsets.all(AppSizes.screenMargin),
      physics: const ClampingScrollPhysics(),
      itemCount: userSettings.length,
      itemBuilder: (_, index) => _SettingListItemContainer(settingItem: userSettings.elementAt(index)),
      separatorBuilder: (_, __) => const SizedBox(height: AppSizes.screenMarginSmall),
    );
  }
}

class _SettingListItemContainer extends StatelessWidget {
  final SettingItem settingItem;

  const _SettingListItemContainer({
    required this.settingItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.cardBackgroundColor,
        borderRadius: BorderRadius.circular(AppSizes.generalBorderRadius),
      ),
      child: _SettingsListItem(settingItem: settingItem),
    );
  }
}

class _SettingsListItem extends StatelessWidget with ProviderMixin {
  final SettingItem settingItem;

  const _SettingsListItem({
    required this.settingItem,
  });

  @override
  Widget build(BuildContext context) {
    final stringProvider = getStringProvider(context);

    final item = settingItem;
    final title = stringProvider.getString(item.titleId);

    if (item is SwitchSettingItem) {
      return _SwitchSettingListItem(
        title: title,
        settingItem: item,
      );
    }

    if (item is ActionSettingItem) {
      return _ActionSettingListItem(
        title: title,
        settingItem: item,
      );
    }

    return ListTile(
      leading: Icon(item.leadingIcon),
      title: Text(title),
      contentPadding: EdgeInsets.zero,
      horizontalTitleGap: 0,
    );
  }
}

class _SwitchSettingListItem extends StatelessWidget {
  final String title;
  final SwitchSettingItem settingItem;

  const _SwitchSettingListItem({
    required this.title,
    required this.settingItem,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(settingItem.leadingIcon),
      title: Text(title),
      contentPadding: EdgeInsets.zero,
      horizontalTitleGap: 0,
      onTap: () => settingItem.onValueChanged(!settingItem.value),
      trailing: Switch.adaptive(
        value: settingItem.value,
        activeColor: AppColors.primaryAccentColor,
        onChanged: settingItem.onValueChanged,
      ),
    );
  }
}

class _ActionSettingListItem extends StatelessWidget {
  final String title;
  final ActionSettingItem settingItem;

  const _ActionSettingListItem({
    required this.title,
    required this.settingItem,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(settingItem.leadingIcon),
      title: Text(title),
      contentPadding: EdgeInsets.zero,
      horizontalTitleGap: 0,
      onTap: settingItem.onPressed,
    );
  }
}
