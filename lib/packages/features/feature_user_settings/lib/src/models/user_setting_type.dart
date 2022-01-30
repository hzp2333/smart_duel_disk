import 'package:flutter/material.dart';
import 'package:smart_duel_disk/generated/locale_keys.g.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

enum UserSettingType {
  profile,
  signOut,
  gameSettings,
  developerModeEnabled,
}

extension UserSettingTypeExtensions on UserSettingType {
  SettingItem<UserSettingType> toSettingItem() {
    switch (this) {
      case UserSettingType.profile:
        return const SettingItem<UserSettingType>(
          titleId: LocaleKeys.user_setting_profile_title,
          leadingIcon: Icons.person,
          type: UserSettingType.profile,
        );
      case UserSettingType.developerModeEnabled:
        return const SettingItem<UserSettingType>(
          titleId: LocaleKeys.user_setting_developer_mode_title,
          leadingIcon: Icons.developer_mode,
          type: UserSettingType.developerModeEnabled,
        );
      case UserSettingType.gameSettings:
        return const SettingItem<UserSettingType>(
          titleId: LocaleKeys.user_setting_game_settings_title,
          leadingIcon: Icons.gamepad,
          type: UserSettingType.gameSettings,
        );
      case UserSettingType.signOut:
        return const SettingItem<UserSettingType>(
          titleId: LocaleKeys.user_setting_sign_out_title,
          leadingIcon: Icons.logout,
          type: UserSettingType.signOut,
        );
      default:
        throw Exception('Invalid user setting type');
    }
  }
}
