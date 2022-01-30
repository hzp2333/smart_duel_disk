import 'dart:async';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:smart_duel_disk/packages/core/core_config/lib/core_config.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';
import 'package:smart_duel_disk/packages/core/core_logger/lib/src/logger.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

import 'models/game_setting_type.dart';

@Injectable()
class GameSettingsViewModel extends BaseViewModel {
  static const _tag = 'GameSettingsViewModel';

  static const _soundEffectDebounceDuration = Duration(milliseconds: 200);

  static const _gameSettingTypes = [
    GameSettingType.soundEffectVolume,
  ];

  final DataManager _dataManager;
  final DelayProvider _delayProvider;

  final _gameSettings = BehaviorSubject<Iterable<SettingItem<GameSettingType>>>();
  Stream<Iterable<SettingItem>> get gameSettings => _gameSettings.stream;

  final _soundEffectVolume = BehaviorSubject<double>();
  Stream<double> get soundEffectVolume => _soundEffectVolume.stream;

  Timer? _soundEffectDebounceTimer;

  GameSettingsViewModel(
    Logger logger,
    this._dataManager,
    this._delayProvider,
  ) : super(logger);

  Future<void> init() async {
    logger.info(_tag, 'init()');

    var gameSettings = _gameSettingTypes.map((type) => type.toSettingItem()).toList();

    gameSettings = _updateSoundEffectVolumeSetting(gameSettings);

    _gameSettings.safeAdd(gameSettings);
  }

  //region Sound effect volume

  List<SettingItem<GameSettingType>> _updateSoundEffectVolumeSetting(List<SettingItem<GameSettingType>> settings) {
    logger.verbose(_tag, '_updateSoundEffectVolumeSetting()');

    final oldSetting = settings.firstWhere((setting) => setting.type == GameSettingType.soundEffectVolume);
    final oldSettingIndex = settings.indexOf(oldSetting);

    _soundEffectVolume.safeAdd(_dataManager.getSoundEffectVolume());

    final newSetting = SliderSettingItem<GameSettingType>(
      titleId: oldSetting.titleId,
      leadingIcon: oldSetting.leadingIcon,
      type: oldSetting.type,
      trailingIcon: Icons.volume_up,
      valueStream: soundEffectVolume,
      onValueChanged: _onSoundEffectVolumeChanged,
    );

    settings.remove(oldSetting);
    settings.insert(oldSettingIndex, newSetting);

    return settings;
  }

  Future<void> _onSoundEffectVolumeChanged(double value) async {
    _soundEffectVolume.safeAdd(value);

    _soundEffectDebounceTimer?.cancel();
    _soundEffectDebounceTimer = _delayProvider.timer(_soundEffectDebounceDuration, () async {
      logger.verbose(_tag, '_onSoundEffectVolumeChanged(value: $value)');
      await _dataManager.saveSoundEffectVolume(value);
    });
  }

  //endregion

  @override
  void dispose() {
    logger.info(_tag, 'dispose()');

    _gameSettings.close();
    _soundEffectVolume.close();

    super.dispose();
  }
}
