import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/generated/assets.gen.dart';
import 'package:smart_duel_disk/packages/core/audio/audio.dart';
import 'package:smart_duel_disk/packages/core/core_smart_duel_server/lib/core_smart_duel_server.dart';

@LazySingleton()
class SpeedDuelEventAudioHandler {
  final AudioService _audioService;

  SpeedDuelEventAudioHandler(
    this._audioService,
  );

  //region Card events

  void onCardPlayed(CardPlayType? playType) {
    switch (playType) {
      case CardPlayType.normalSummon:
        _audioService.playSoundEffect(Assets.sound.soundEffects.seNormalSummon);
        break;
      case CardPlayType.specialSummon:
        _audioService.playSoundEffect(Assets.sound.soundEffects.seSpecialSummon);
        break;
      case CardPlayType.set:
        _audioService.playSoundEffect(Assets.sound.soundEffects.seSetCard);
        break;
      case CardPlayType.activate:
        _audioService.playSoundEffect(Assets.sound.soundEffects.seActivateEffect);
        break;
      case CardPlayType.draw:
        _audioService.playSoundEffect(Assets.sound.soundEffects.seDrawCard);
        break;
      default:
        break;
    }
  }

  void onAttackCardEvent() => _audioService.playSoundEffect(Assets.sound.soundEffects.seAttack);

  void onDeclareCardEvent() => _audioService.playSoundEffect(Assets.sound.soundEffects.seActivateEffect);

  void onAddCounterToCardEvent() => _audioService.playSoundEffect(Assets.sound.soundEffects.seUpdateCounter);

  void onRemoveCounterFromCardEvent() => _audioService.playSoundEffect(Assets.sound.soundEffects.seUpdateCounter);

  //endregion

  //region Deck

  void onDeckShuffleEvent() => _audioService.playSoundEffect(Assets.sound.soundEffects.seShuffle);

  //endregion

  //region Duelist events

  void onRollDiceEvent() => _audioService.playSoundEffect(Assets.sound.soundEffects.seRollDice);

  void onFlipCoinEvent() => _audioService.playSoundEffect(Assets.sound.soundEffects.seFlipCoin);

  void onDeclarePhaseEvent() => _audioService.playSoundEffect(Assets.sound.soundEffects.seDeclarePhase);

  void onEndTurnEvent() => _audioService.playSoundEffect(Assets.sound.soundEffects.seNextTurn);

  void onUpdateLifepointsEvent() => _audioService.playSoundEffect(Assets.sound.soundEffects.seUpdateLifepoints);

  //endregion
}
