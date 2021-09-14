import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';
import 'package:smart_duel_disk/packages/core/core_localization/lib/core_localization.dart';
import 'package:smart_duel_disk/packages/core/core_logger/lib/core_logger.dart';
import 'package:smart_duel_disk/packages/core/core_navigation/lib/core_navigation.dart';
import 'package:smart_duel_disk/packages/features/feature_deck_builder/lib/src/deck_builder/models/deck_builder_state.dart';

@Injectable()
class DeckBuilderViewModel extends BaseViewModel {
  static const _tag = 'DeckBuilderViewModel';

  final PreBuiltDeck? _preBuiltDeck;
  final AppRouter _routerHelper;
  final DataManager _dataManager;
  final StringProvider _stringProvider;

  final _deckBuilderState = BehaviorSubject<DeckBuilderState>();
  Stream<DeckBuilderState> get deckBuilderState => _deckBuilderState.stream;

  final _yugiohCards = BehaviorSubject<Iterable<YugiohCard>>();
  final _textFilter = BehaviorSubject<String>.seeded('');
  final _preBuiltDeckCardIds = BehaviorSubject<Iterable<int>>();

  StreamSubscription<DeckBuilderState>? _filteredCardsSubscription;

  String? get preBuiltDeckTitle => _preBuiltDeck == null ? null : _stringProvider.getString(_preBuiltDeck!.titleId);

  DeckBuilderViewModel(
    @factoryParam this._preBuiltDeck,
    this._routerHelper,
    this._dataManager,
    this._stringProvider,
    Logger logger,
  ) : super(logger);

  Future<void> init() async {
    logger.info(_tag, 'init()');

    if (_preBuiltDeck == null) {
      _preBuiltDeckCardIds.add([]);
    } else {
      final preBuiltDeckCardIds = await _dataManager.getPreBuiltDeckCardIds(_preBuiltDeck!);
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
      final filteredCards = cards.where(
        (card) =>
            card.name.toLowerCase().contains(textFilter) ||
            (card.archetype?.toLowerCase().contains(textFilter) ?? false),
      );

      if (filteredCards.isEmpty) {
        return const DeckBuilderNoData();
      }

      return DeckBuilderState(filteredCards, isPreBuilt: false);
    }).listen(_deckBuilderState.add);

    return _fetchData();
  }

  Future<void> onRetryPressed() async {
    logger.info(_tag, 'onRetryPressed()');

    await _fetchData();
  }

  Future<void> _fetchData() async {
    logger.verbose(_tag, '_fetchData()');

    _deckBuilderState.add(const DeckBuilderLoading());

    try {
      final speedDuelCards = await _dataManager.getSpeedDuelCards();
      if (speedDuelCards.isNullOrEmpty) {
        throw Exception('No cards');
      }

      _yugiohCards.add(speedDuelCards);
    } catch (exception, stackTrace) {
      logger.error(_tag, 'An error occurred while fetching the speed tuel cards.', exception, stackTrace);
      _deckBuilderState.add(const DeckBuilderError());
    }
  }

  void onTextFilterChanged(String value) {
    logger.info(_tag, 'onTextFilterChanged($value)');

    _textFilter.add(value);
  }

  void onClearTextFilterPressed() {
    logger.info(_tag, 'onClearTextFilterPressed()');

    _textFilter.add('');
  }

  Future<void> onYugiohCardPressed(YugiohCard yugiohCard, int index) {
    logger.info(_tag, 'onYugiohCardPressed($yugiohCard, $index)');

    return _routerHelper.showYugiohCardDetail(yugiohCard, index);
  }

  @override
  void dispose() {
    logger.info(_tag, 'dispose()');

    _filteredCardsSubscription?.cancel();
    _filteredCardsSubscription = null;

    _deckBuilderState.close();
    _yugiohCards.close();
    _textFilter.close();

    super.dispose();
  }
}
