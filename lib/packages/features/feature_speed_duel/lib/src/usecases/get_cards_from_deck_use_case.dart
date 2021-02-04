import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/core_data_manager_interface/lib/core_data_manager_interface.dart';

@LazySingleton()
class GetCardsFromDeckUseCase {
  final DataManager _dataManager;

  GetCardsFromDeckUseCase(
    this._dataManager,
  );

  Future<Iterable<YugiohCard>> call(PreBuiltDeck deck) async {
    final allCards = await _dataManager.getSpeedDuelCards();
    final deckCardIds = await _dataManager.getPreBuiltDeckCardIds(deck);

    // TODO: as this is a heavy computation we should probably spawn an isolate.
    // Curently having a problem with that though: Invalid argument(s): Illegal argument in isolate message : (object is a closure - Function '<anonymous closure>':.)
    return deckCardIds.map((id) => allCards.firstWhere((card) => card.id == id));
  }
}
