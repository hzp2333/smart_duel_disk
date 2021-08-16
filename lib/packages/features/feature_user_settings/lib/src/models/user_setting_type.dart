import 'package:flutter/material.dart';

import 'setting_item.dart';

enum UserSettingType {
  developerModeEnabled,
}

extension UserSettingTypeExtensions on UserSettingType {
  SettingItem toSettingItem() {
    switch (this) {
      case UserSettingType.developerModeEnabled:
        return const SettingItem(
          title: 'Developer mode',
          leadingIcon: Icons.developer_mode,
          type: UserSettingType.developerModeEnabled,
        );
      default:
        throw Exception('Invalid user setting type');
    }
  }
}
