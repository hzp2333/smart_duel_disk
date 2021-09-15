import 'package:flutter/material.dart';
import 'package:smart_duel_disk/generated/locale_keys.g.dart';

import 'setting_item.dart';

enum UserSettingType {
  developerModeEnabled,
}

extension UserSettingTypeExtensions on UserSettingType {
  SettingItem toSettingItem() {
    switch (this) {
      case UserSettingType.developerModeEnabled:
        return const SettingItem(
          titleId: LocaleKeys.user_setting_developer_mode_title,
          leadingIcon: Icons.developer_mode,
          type: UserSettingType.developerModeEnabled,
        );
      default:
        throw Exception('Invalid user setting type');
    }
  }
}
