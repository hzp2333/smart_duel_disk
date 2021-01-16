import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/core_data_manager_interface/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/features/feature_deck_builder/lib/src/deck_builder/models/deck_builder_state.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_crashlytics/wrapper_crashlytics_interface/lib/wrapper_crashlytics_interface.dart';

@Injectable()
class DeckBuilderViewModel {
  final DataManager _dataManager;
  final CrashlyticsProvider _crashlyticsProvider;

  final _deckBuilderState = BehaviorSubject<DeckBuilderState>();
  Stream<DeckBuilderState> get deckBuilderState => _deckBuilderState.stream;

  final _yugiohCards = BehaviorSubject<Iterable<YugiohCard>>();
  final _textFilter = BehaviorSubject<String>.seeded('');

  StreamSubscription<DeckBuilderState> _filteredCardsSubscription;

  DeckBuilderViewModel(
    this._dataManager,
    this._crashlyticsProvider,
  );

  //region Data fetching

  Future<void> init() async {
    _filteredCardsSubscription =
        Rx.combineLatest2(_yugiohCards, _textFilter, (Iterable<YugiohCard> cards, String filterValue) {
      if (filterValue.isNullOrEmpty) {
        return DeckBuilderState(cards);
      }

      final textFilter = filterValue.toLowerCase();
      final filteredCards = cards.where((card) =>
          card.name.toLowerCase().contains(textFilter) ||
          (card.archetype?.toLowerCase()?.contains(textFilter) ?? false));

      if (filteredCards.isEmpty) {
        return const DeckBuilderState.noData();
      }

      return DeckBuilderState(filteredCards);
    }).listen(_deckBuilderState.add);

    return _fetchData();
  }

  Future<void> onRetryPressed() {
    return _fetchData();
  }

  Future<void> _fetchData() async {
    _deckBuilderState.add(const DeckBuilderState.loading());

    try {
      final speedDuelCards = await _dataManager.getSpeedDuelCards();
      if (speedDuelCards.isNullOrEmpty) {
        throw Exception('No cards');
      }

      _yugiohCards.add(speedDuelCards);
    } catch (exception, stackTrace) {
      _crashlyticsProvider.logException(exception, stackTrace);
      _deckBuilderState.add(const DeckBuilderState.error());
    }
  }

  //endregion

  //region Data filtering

  void onTextFilterChanged(String value) {
    _textFilter.add(value);
  }

  void onClearTextFilterPressed() {
    _textFilter.add('');
  }

  //endregion

  void dispose() {
    _filteredCardsSubscription?.cancel();
    _filteredCardsSubscription = null;

    _deckBuilderState?.close();
    _yugiohCards?.close();
    _textFilter?.close();
  }
}
