import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/generated/assets.gen.dart';
import 'package:smart_duel_disk/packages/wrappers/audio_player/src/audio_player_provider.dart';

@LazySingleton()
class SpeedDuelEventAudioHandler {
  final AudioPlayerProvider _audioPlayer;

  SpeedDuelEventAudioHandler(
    this._audioPlayer,
  );

  //region Card events

  Future<void> onDeclareCardEvent() async => _audioPlayer.play(Assets.sound.soundEffects.seActivateEffect);

  Future<void> onAddCounterToCardEvent() async => _audioPlayer.play(Assets.sound.soundEffects.seUpdateCounter);

  Future<void> onRemoveCounterFromCardEvent() async => _audioPlayer.play(Assets.sound.soundEffects.seUpdateCounter);

  //endregion

  //region Deck

  Future<void> onDeckDrawEvent() async => _audioPlayer.play(Assets.sound.soundEffects.seDrawCard);

  Future<void> onDeckShuffleEvent() async => _audioPlayer.play(Assets.sound.soundEffects.seShuffle);

  //endregion

  //region Duelist events

  Future<void> onRollDiceEvent() async => _audioPlayer.play(Assets.sound.soundEffects.seRollDice);

  Future<void> onFlipCoinEvent() async => _audioPlayer.play(Assets.sound.soundEffects.seFlipCoin);

  Future<void> onDeclarePhaseEvent() async => _audioPlayer.play(Assets.sound.soundEffects.seDeclarePhase);

  Future<void> onEndTurnEvent() async => _audioPlayer.play(Assets.sound.soundEffects.seNextTurn);

  Future<void> onUpdateLifepointsEvent() async => _audioPlayer.play(Assets.sound.soundEffects.seUpdateLifepoints);

  //endregion
}
