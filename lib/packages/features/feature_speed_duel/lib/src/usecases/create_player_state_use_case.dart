import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/core_data_manager_interface/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/play_card.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/player_state.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone_type.dart';

import 'create_play_card_use_case.dart';

@LazySingleton()
class CreatePlayerStateUseCase {
  final DataManager _dataManager;
  final CreatePlayCardUseCase _createPlayCardUseCase;

  CreatePlayerStateUseCase(
    this._dataManager,
    this._createPlayCardUseCase,
  );

  Future<PlayerState> call(Iterable<int> deckList) async {
    // TODO: we do this here to cache the token, can be improved
    await _dataManager.getToken();

    final allCards = await _dataManager.getSpeedDuelCards();

    // TODO: as this is a heavy computation we should probably spawn an isolate.
    // Curently having a problem with that though: Invalid argument(s): Illegal argument in isolate message : (object is a closure - Function '<anonymous closure>':.)
    final yugiohCards = deckList.map((cardId) => allCards.firstWhere((card) => card.id == cardId));

    final playCards = <PlayCard>[];
    for (final card in yugiohCards) {
      final copyNumber = playCards.where((playCard) => playCard.yugiohCard == card).length + 1;
      final isExtraDeck = card.type == CardType.fusionMonster;
      final zoneType = isExtraDeck ? ZoneType.extraDeck : ZoneType.deck;

      playCards.add(_createPlayCardUseCase(card, copyNumber, zoneType: zoneType));
    }

    const playerState = PlayerState();

    final mainDeck = playCards.where((card) => !card.belongsInExtraDeck);
    final extraDeck = playCards.where((card) => card.belongsInExtraDeck);

    return playerState.copyWith(
      deckZone: playerState.deckZone.copyWith(cards: mainDeck),
      extraDeckZone: playerState.extraDeckZone.copyWith(cards: extraDeck),
    );
  }
}
