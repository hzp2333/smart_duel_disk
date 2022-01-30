import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

class SwitchSettingListItem extends StatelessWidget {
  final SwitchSettingItem item;

  const SwitchSettingListItem({
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return SettingListItem(
      item: item,
      onPressed: () => item.onValueChanged(!item.value),
      trailing: Switch.adaptive(
        value: item.value,
        activeColor: AppColors.primaryAccentColor,
        onChanged: item.onValueChanged,
      ),
    );
  }
}

class ActionSettingListItem extends StatelessWidget {
  final ActionSettingItem item;

  const ActionSettingListItem({
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return SettingListItem(
      item: item,
      onPressed: item.onPressed,
    );
  }
}

class SliderSettingListItem extends HookWidget {
  final SliderSettingItem item;

  const SliderSettingListItem({
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final volume = useStream(item.valueStream, initialData: 0.0);

    return SettingListItem(
      item: item,
      bottom: Row(
        children: [
          Icon(item.leadingIcon),
          Expanded(
            child: Slider(
              value: volume.requireData,
              onChanged: item.onValueChanged,
            ),
          ),
          Icon(item.trailingIcon),
        ],
      ),
    );
  }
}

class SettingListItem extends StatelessWidget {
  final SettingItem item;
  final VoidCallback? onPressed;
  final Widget? trailing;
  final Widget? bottom;

  const SettingListItem({
    required this.item,
    this.onPressed,
    this.trailing,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: bottom == null ? Icon(item.leadingIcon) : null,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
      horizontalTitleGap: 0,
      tileColor: AppColors.cardBackgroundColor,
      onTap: onPressed,
      trailing: trailing,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.generalBorderRadius),
      ),
      title: _SettingListItemTitle(
        item: item,
        bottom: bottom,
      ),
    );
  }
}

class _SettingListItemTitle extends StatelessWidget with ProviderMixin {
  final SettingItem item;
  final Widget? bottom;

  const _SettingListItemTitle({
    required this.item,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    final stringProvider = getStringProvider(context);
    final title = stringProvider.getString(item.titleId);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: bottom == null ? 0.0 : AppSizes.screenMarginSmall),
          child: Text(title),
        ),
        if (bottom != null) ...[
          bottom!,
        ],
      ],
    );
  }
}
