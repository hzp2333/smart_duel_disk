import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/core_data_manager_interface/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/play_card.dart';

import 'create_play_card_use_case.dart';

@LazySingleton()
class GetCardsFromDeckUseCase {
  final DataManager _dataManager;
  final CreatePlayCardUseCase _createPlayCardUseCase;

  GetCardsFromDeckUseCase(
    this._dataManager,
    this._createPlayCardUseCase,
  );

  Future<Iterable<PlayCard>> call(PreBuiltDeck deck) async {
    final allCards = await _dataManager.getSpeedDuelCards();
    // TODO: we do this here to cache the token, can be improved
    await _dataManager.getToken();
    final deckCardIds = await _dataManager.getPreBuiltDeckCardIds(deck);

    // TODO: as this is a heavy computation we should probably spawn an isolate.
    // Curently having a problem with that though: Invalid argument(s): Illegal argument in isolate message : (object is a closure - Function '<anonymous closure>':.)
    final yugiohCards = deckCardIds.map((id) => allCards.firstWhere((card) => card.id == id));

    final playCards = <PlayCard>[];

    for (final card in yugiohCards) {
      final copyNumber = playCards.where((playCard) => playCard.yugiohCard == card).length + 1;
      playCards.add(_createPlayCardUseCase(card, copyNumber));
    }

    return playCards;
  }
}
