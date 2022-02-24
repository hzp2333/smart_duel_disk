import 'package:flutter/material.dart';
import 'package:smart_duel_disk/generated/locale_keys.g.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

enum GameSettingType {
  soundEffectVolume,
}

extension GameSettingTypeExtensions on GameSettingType {
  SettingItem<GameSettingType> toSettingItem() {
    switch (this) {
      case GameSettingType.soundEffectVolume:
        return const SettingItem(
          titleId: LocaleKeys.game_setting_sound_effect_volume_title,
          leadingIcon: Icons.volume_mute,
          type: GameSettingType.soundEffectVolume,
        );
    }
  }
}
