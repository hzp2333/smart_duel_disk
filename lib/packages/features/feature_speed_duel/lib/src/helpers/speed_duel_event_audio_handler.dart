import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/generated/assets.gen.dart';
import 'package:smart_duel_disk/packages/core/core_smart_duel_server/lib/core_smart_duel_server.dart';
import 'package:smart_duel_disk/packages/wrappers/audio_player/src/audio_player_provider.dart';

@LazySingleton()
class SpeedDuelEventAudioHandler {
  final AudioPlayerProvider _audioPlayer;

  SpeedDuelEventAudioHandler(
    this._audioPlayer,
  );

  //region Card events

  void onCardPlayed(CardPlayType? playType) {
    switch (playType) {
      case CardPlayType.normalSummon:
        _audioPlayer.play(Assets.sound.soundEffects.seNormalSummon);
        break;
      case CardPlayType.specialSummon:
        _audioPlayer.play(Assets.sound.soundEffects.seSpecialSummon);
        break;
      case CardPlayType.set:
        _audioPlayer.play(Assets.sound.soundEffects.seSetCard);
        break;
      case CardPlayType.activate:
        _audioPlayer.play(Assets.sound.soundEffects.seActivateEffect);
        break;
      case CardPlayType.draw:
        _audioPlayer.play(Assets.sound.soundEffects.seDrawCard);
        break;
      default:
        break;
    }
  }

  void onAttackCardEvent() => _audioPlayer.play(Assets.sound.soundEffects.seAttack);

  void onDeclareCardEvent() => _audioPlayer.play(Assets.sound.soundEffects.seActivateEffect);

  void onAddCounterToCardEvent() => _audioPlayer.play(Assets.sound.soundEffects.seUpdateCounter);

  void onRemoveCounterFromCardEvent() => _audioPlayer.play(Assets.sound.soundEffects.seUpdateCounter);

  //endregion

  //region Deck

  void onDeckShuffleEvent() => _audioPlayer.play(Assets.sound.soundEffects.seShuffle);

  //endregion

  //region Duelist events

  void onRollDiceEvent() => _audioPlayer.play(Assets.sound.soundEffects.seRollDice);

  void onFlipCoinEvent() => _audioPlayer.play(Assets.sound.soundEffects.seFlipCoin);

  void onDeclarePhaseEvent() => _audioPlayer.play(Assets.sound.soundEffects.seDeclarePhase);

  void onEndTurnEvent() => _audioPlayer.play(Assets.sound.soundEffects.seNextTurn);

  void onUpdateLifepointsEvent() => _audioPlayer.play(Assets.sound.soundEffects.seUpdateLifepoints);

  //endregion
}
