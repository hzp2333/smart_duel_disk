import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/core/core_smart_duel_server/lib/core_smart_duel_server.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/play_card.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/player_state.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone.dart';
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

  Future<PlayerState> call(Duelist duelist, {bool isOpponent = false}) async {
    final allCards = await _dataManager.getSpeedDuelCards();

    // TODO: we do this here to cache the token, can be improved
    await _dataManager.getToken();

    // TODO: as this is a heavy computation we should probably spawn an isolate.
    // Curently having a problem with that though: Invalid argument(s): Illegal argument in isolate message : (object is a closure - Function '<anonymous closure>':.)
    final yugiohCards = duelist.deckList.map((cardId) => allCards.firstWhere((card) => card.id == cardId));

    final playCards = <PlayCard>[];
    for (final card in yugiohCards) {
      final copyNumber = playCards.where((playCard) => playCard.yugiohCard == card).length + 1;
      final isExtraDeck = card.type == CardType.fusionMonster;
      final zoneType = isExtraDeck ? ZoneType.extraDeck : ZoneType.deck;

      playCards.add(
        _createPlayCardUseCase(
          card,
          duelist.id,
          copyNumber,
          zoneType: zoneType,
        ),
      );
    }

    final playerState = PlayerState(
      duelistId: duelist.id,
      isOpponent: isOpponent,
      hand: Zone(zoneType: ZoneType.hand, duelistId: duelist.id),
      fieldZone: Zone(zoneType: ZoneType.field, duelistId: duelist.id),
      mainMonsterZone1: Zone(zoneType: ZoneType.mainMonster1, duelistId: duelist.id),
      mainMonsterZone2: Zone(zoneType: ZoneType.mainMonster2, duelistId: duelist.id),
      mainMonsterZone3: Zone(zoneType: ZoneType.mainMonster3, duelistId: duelist.id),
      graveyardZone: Zone(zoneType: ZoneType.graveyard, duelistId: duelist.id),
      banishedZone: Zone(zoneType: ZoneType.banished, duelistId: duelist.id),
      extraDeckZone: Zone(zoneType: ZoneType.extraDeck, duelistId: duelist.id),
      spellTrapZone1: Zone(zoneType: ZoneType.spellTrap1, duelistId: duelist.id),
      spellTrapZone2: Zone(zoneType: ZoneType.spellTrap2, duelistId: duelist.id),
      spellTrapZone3: Zone(zoneType: ZoneType.spellTrap3, duelistId: duelist.id),
      deckZone: Zone(zoneType: ZoneType.deck, duelistId: duelist.id),
    );

    final mainDeck = playCards.where((card) => !card.belongsInExtraDeck);
    final extraDeck = playCards.where((card) => card.belongsInExtraDeck);

    return playerState.copyWith(
      deckZone: playerState.deckZone.copyWith(cards: mainDeck),
      extraDeckZone: playerState.extraDeckZone.copyWith(cards: extraDeck),
    );
  }
}
