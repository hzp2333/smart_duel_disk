import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/core/core_smart_duel_server/lib/core_smart_duel_server.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/speed_duel_models.dart';

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
    final yugiohCards = duelist.deckList.map((cardId) => allCards.firstWhere((card) => card.id == cardId));

    final playCards = <PlayCard>[];
    for (final card in yugiohCards) {
      final copyNumber = playCards.where((playCard) => playCard.yugiohCard == card).length + 1;
      final position = card.type == CardType.skillCard ? CardPosition.faceDown : CardPosition.faceUp;
      final zoneType = card.type == CardType.skillCard
          ? ZoneType.skill
          : card.belongsInExtraDeck
              ? ZoneType.extraDeck
              : ZoneType.deck;

      playCards.add(
        _createPlayCardUseCase(
          card,
          duelist.id,
          copyNumber,
          position: position,
          zoneType: zoneType,
        ),
      );
    }

    PlayCard? skillCard;
    try {
      skillCard = playCards.firstWhere((card) => card.yugiohCard.type == CardType.skillCard);
    } catch (e) {
      // ignore
    }

    final playCardsWithoutSkill = skillCard == null ? playCards : playCards
      ..remove(skillCard);

    final mainDeck = playCardsWithoutSkill.where((card) => !card.belongsInExtraDeck);
    final extraDeck = playCardsWithoutSkill.where((card) => card.belongsInExtraDeck);

    final playerState = PlayerState(duelistId: duelist.id, isOpponent: isOpponent);

    return playerState.copyWith(
      deckZone: playerState.deckZone.copyWith(cards: mainDeck),
      extraDeckZone: playerState.extraDeckZone.copyWith(cards: extraDeck),
      skillZone: playerState.skillZone.copyWith(cards: skillCard == null ? null : [skillCard]),
    );
  }
}
