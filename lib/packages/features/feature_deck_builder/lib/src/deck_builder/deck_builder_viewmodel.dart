import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/core_data_manager_interface/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/core/core_navigation/lib/core_navigation.dart';
import 'package:smart_duel_disk/packages/features/feature_deck_builder/lib/src/deck_builder/models/deck_builder_state.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_crashlytics/wrapper_crashlytics_interface/lib/wrapper_crashlytics_interface.dart';

@Injectable()
class DeckBuilderViewModel extends BaseViewModel {
  final PreBuiltDeck _preBuiltDeck;
  final RouterHelper _routerHelper;
  final DataManager _dataManager;
  final CrashlyticsProvider _crashlyticsProvider;

  final _deckBuilderState = BehaviorSubject<DeckBuilderState>();
  Stream<DeckBuilderState> get deckBuilderState => _deckBuilderState.stream;

  final _yugiohCards = BehaviorSubject<Iterable<YugiohCard>>();
  final _textFilter = BehaviorSubject<String>.seeded('');
  final _preBuiltDeckCardIds = BehaviorSubject<Iterable<int>>();

  StreamSubscription<DeckBuilderState> _filteredCardsSubscription;

  bool get showFilter => _preBuiltDeck == null;

  DeckBuilderViewModel(
    @factoryParam this._preBuiltDeck,
    this._routerHelper,
    this._dataManager,
    this._crashlyticsProvider,
  );

  Future<void> init() async {
    if (_preBuiltDeck == null) {
      _preBuiltDeckCardIds.add([]);
    } else {
      final preBuiltDeckCardIds = await _dataManager.getPreBuiltDeckCardIds(_preBuiltDeck);
      _preBuiltDeckCardIds.add(preBuiltDeckCardIds);
    }

    _filteredCardsSubscription = Rx.combineLatest3(_yugiohCards, _textFilter, _preBuiltDeckCardIds,
        (Iterable<YugiohCard> cards, String filterValue, Iterable<int> preBuiltDeckCardIds) {
      if (!preBuiltDeckCardIds.isNullOrEmpty) {
        final deckCards = preBuiltDeckCardIds.map((id) => cards.singleWhere((card) => card.id == id)).toList()
          ..sort((c1, c2) => c1.name.compareTo(c2.name));
        return DeckBuilderState(deckCards, isPreBuilt: true);
      }

      if (filterValue.isNullOrEmpty) {
        return DeckBuilderState(cards, isPreBuilt: false);
      }

      final textFilter = filterValue.toLowerCase();
      final filteredCards = cards.where((card) =>
          card.name.toLowerCase().contains(textFilter) ||
          (card.archetype?.toLowerCase()?.contains(textFilter) ?? false));

      if (filteredCards.isEmpty) {
        return const DeckBuilderState.noData();
      }

      return DeckBuilderState(filteredCards, isPreBuilt: false);
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

  void onTextFilterChanged(String value) {
    _textFilter.add(value);
  }

  void onClearTextFilterPressed() {
    _textFilter.add('');
  }

  Future<void> onYugiohCardPressed(YugiohCard yugiohCard, int index) {
    return _routerHelper.showYugiohCardDetail(yugiohCard, index);
  }

  @override
  void dispose() {
    _filteredCardsSubscription?.cancel();
    _filteredCardsSubscription = null;

    _deckBuilderState?.close();
    _yugiohCards?.close();
    _textFilter?.close();

    super.dispose();
  }
}
