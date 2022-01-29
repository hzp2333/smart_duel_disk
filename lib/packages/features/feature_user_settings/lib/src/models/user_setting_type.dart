import 'package:flutter/material.dart';
import 'package:smart_duel_disk/generated/locale_keys.g.dart';

import 'setting_item.dart';

enum UserSettingType {
  profile,
  signOut,
  developerModeEnabled,
}

extension UserSettingTypeExtensions on UserSettingType {
  SettingItem toSettingItem() {
    switch (this) {
      case UserSettingType.profile:
        return const SettingItem(
          titleId: LocaleKeys.user_setting_profile_title,
          leadingIcon: Icons.person,
          type: UserSettingType.profile,
        );
      case UserSettingType.developerModeEnabled:
        return const SettingItem(
          titleId: LocaleKeys.user_setting_developer_mode_title,
          leadingIcon: Icons.developer_mode,
          type: UserSettingType.developerModeEnabled,
        );
      case UserSettingType.signOut:
        return const SettingItem(
          titleId: LocaleKeys.user_setting_sign_out_title,
          leadingIcon: Icons.logout,
          type: UserSettingType.signOut,
        );
      default:
        throw Exception('Invalid user setting type');
    }
  }
}
