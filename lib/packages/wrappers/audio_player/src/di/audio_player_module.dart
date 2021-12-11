import 'package:audioplayers/audioplayers.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AudioPlayerModule {
  @LazySingleton()
  AudioCache provideAudioCache() => AudioCache(
        prefix: '',
        fixedPlayer: AudioPlayer(mode: PlayerMode.LOW_LATENCY),
      );
}
