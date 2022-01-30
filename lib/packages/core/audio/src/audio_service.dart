import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/wrappers/audio_player/audio_player.dart';

abstract class AudioService {
  void playSoundEffect(String filePath);
}

@LazySingleton(as: AudioService)
class AudioServiceImpl implements AudioService {
  final AudioPlayerProvider _audioPlayer;
  final DataManager _dataManager;

  AudioServiceImpl(
    this._audioPlayer,
    this._dataManager,
  );

  @override
  void playSoundEffect(String filePath) {
    final volume = _dataManager.getSoundEffectVolume();
    _audioPlayer.play(filePath, volume);
  }
}
