import 'package:audioplayers/audioplayers.dart';
import 'package:injectable/injectable.dart';

abstract class AudioPlayerProvider {
  Future<void> play(String filePath, double volume);
}

@LazySingleton(as: AudioPlayerProvider)
class AudioPlayerProviderImpl implements AudioPlayerProvider {
  final AudioCache _audioPlayer;

  AudioPlayerProviderImpl(
    this._audioPlayer,
  );

  @override
  Future<void> play(String filePath, double volume) {
    return _audioPlayer.play(filePath, volume: volume);
  }
}
