import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

import 'body/setting_list_items.dart';

class BaseSettingsScreen extends StatelessWidget with ProviderMixin {
  final String screenTitleId;
  final Stream<Iterable<SettingItem>> settingsStream;
  final bool showBackButton;
  final bool showCloseButton;

  const BaseSettingsScreen({
    required this.screenTitleId,
    required this.settingsStream,
    required this.showBackButton,
    required this.showCloseButton,
  });

  @override
  Widget build(BuildContext context) {
    final stringProvider = getStringProvider(context);

    return Scaffold(
      appBar: SddAppBar(
        title: stringProvider.getString(screenTitleId),
        showBackButton: showBackButton,
        showCloseButton: showCloseButton,
      ),
      body: _Body(settingsStream: settingsStream),
    );
  }
}

class _Body extends HookWidget {
  final Stream<Iterable<SettingItem>> settingsStream;

  const _Body({
    required this.settingsStream,
  });

  @override
  Widget build(BuildContext context) {
    final settingsSnapshot = useStream(settingsStream);

    if (!settingsSnapshot.hasData) {
      return const GeneralLoadingState();
    }

    final settings = settingsSnapshot.requireData;

    return ListView.separated(
      shrinkWrap: true,
      padding: const EdgeInsets.all(AppSizes.screenMargin),
      physics: const ClampingScrollPhysics(),
      itemCount: settings.length,
      itemBuilder: (_, index) => _SettingsListItem(settingItem: settings.elementAt(index)),
      separatorBuilder: (_, __) => const SizedBox(height: AppSizes.screenMarginSmall),
    );
  }
}

class _SettingsListItem extends StatelessWidget {
  final SettingItem settingItem;

  const _SettingsListItem({
    required this.settingItem,
  });

  @override
  Widget build(BuildContext context) {
    final item = settingItem;

    if (item is SwitchSettingItem) {
      return SwitchSettingListItem(item: item);
    }

    if (item is ActionSettingItem) {
      return ActionSettingListItem(item: item);
    }

    if (item is SliderSettingItem) {
      return SliderSettingListItem(item: item);
    }

    return SettingListItem(item: settingItem);
  }
}
