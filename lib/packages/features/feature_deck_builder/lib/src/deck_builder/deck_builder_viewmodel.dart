import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';
import 'package:smart_duel_disk/packages/core/core_localization/lib/core_localization.dart';
import 'package:smart_duel_disk/packages/core/core_logger/lib/core_logger.dart';
import 'package:smart_duel_disk/packages/core/core_navigation/lib/core_navigation.dart';

import 'models/deck_builder_section.dart';
import 'models/deck_builder_state.dart';

@Injectable()
class DeckBuilderViewModel extends BaseViewModel {
  static const _tag = 'DeckBuilderViewModel';

  final PreBuiltDeck? _preBuiltDeck;
  final AppRouter _router;
  final DataManager _dataManager;
  final StringProvider _stringProvider;

  final _deckBuilderState = BehaviorSubject<DeckBuilderState>.seeded(const DeckBuilderLoading());
  Stream<DeckBuilderState> get deckBuilderState => _deckBuilderState.stream;

  final _speedDuelCards = BehaviorSubject<Iterable<YugiohCard>>();
  final _preBuiltDeckCardIds = BehaviorSubject<Iterable<int>>();
  final _textFilter = BehaviorSubject<String>.seeded('');

  late StreamSubscription<DeckBuilderState>? _filteredCardsSubscription;

  String? get preBuiltDeckTitle => _preBuiltDeck == null ? null : _stringProvider.getString(_preBuiltDeck!.titleId);

  DeckBuilderViewModel(
    @factoryParam this._preBuiltDeck,
    this._router,
    this._dataManager,
    this._stringProvider,
    Logger logger,
  ) : super(logger);

  Future<void> init() async {
    logger.info(_tag, 'init()');

    _initFilteredCardsSubscription();
    await _fetchData();
  }

  //region Data state subscription

  void _initFilteredCardsSubscription() {
    logger.verbose(_tag, '_initFilteredCardsSubscription()');

    _filteredCardsSubscription = Rx.combineLatest3(_speedDuelCards, _preBuiltDeckCardIds, _textFilter, (
      Iterable<YugiohCard> cards,
      Iterable<int> cardIds,
      String filterValue,
    ) {
      final cardCopies = <CardCopy>[];
      for (final card in cards) {
        final image = _dataManager.getCardImageFile(card);
        cardCopies.add(CardCopy(card, image));
      }

      cardCopies.sort((cc1, cc2) => cc1.card.name.compareTo(cc2.card.name));

      if (cardIds.isNotEmpty) {
        return _createPreBuiltDeckState(cardIds, cardCopies);
      }

      if (filterValue.isNullOrEmpty) {
        return DeckBuilderFiltered(cardCopies);
      }

      return _createFilteredCardsState(cardCopies, filterValue);
    }).listen(_deckBuilderState.safeAdd);
  }

  DeckBuilderState _createPreBuiltDeckState(Iterable<int> cardIds, Iterable<CardCopy> cards) {
    logger.verbose(_tag, '_createPreBuiltDeckState()');

    final cardCopies = cardIds.map((id) => cards.firstWhere((cc) => cc.card.id == id));

    final sections = [
      MonsterCardsSection(cards: cardCopies.where((cc) => cc.card.isMonster && !cc.card.belongsInExtraDeck)),
      SpellCardsSection(cards: cardCopies.where((cc) => cc.card.type == CardType.spellCard)),
      TrapCardsSection(cards: cardCopies.where((cc) => cc.card.type == CardType.trapCard)),
      ExtraDeckSection(cards: cardCopies.where((cc) => cc.card.belongsInExtraDeck))
    ]..removeWhere((section) => section.cards.isEmpty);

    return DeckBuilderPreBuilt(sections);
  }

  DeckBuilderState _createFilteredCardsState(Iterable<CardCopy> cards, String filterValue) {
    logger.verbose(_tag, '_createFilteredCardsState()');

    final textFilter = filterValue.toLowerCase();
    final filteredCards = cards.where(
      (cc) =>
          cc.card.name.toLowerCase().contains(textFilter) ||
          (cc.card.archetype?.toLowerCase().contains(textFilter) ?? false),
    );

    if (filteredCards.isEmpty) {
      return const DeckBuilderNoData();
    }

    return filteredCards.isEmpty ? const DeckBuilderNoData() : DeckBuilderFiltered(filteredCards);
  }

  //endregion

  //region Data fetching

  Future<void> _fetchData() async {
    logger.verbose(_tag, '_fetchData()');

    _deckBuilderState.safeAdd(const DeckBuilderLoading());

    try {
      if (!_speedDuelCards.hasValue) {
        await _fetchSpeedDuelCards();
      }

      if (!_preBuiltDeckCardIds.hasValue) {
        await _fetchPreBuiltDeckCardIds();
      }
    } catch (exception, stackTrace) {
      logger.error(_tag, 'An error occurred while fetching the data.', exception, stackTrace);
      _deckBuilderState.safeAdd(const DeckBuilderError());
    }
  }

  Future<void> _fetchSpeedDuelCards() async {
    logger.verbose(_tag, '_fetchSpeedDuelCards()');

    final speedDuelCards = await _dataManager.getSpeedDuelCards();
    if (speedDuelCards.isNullOrEmpty) {
      throw Exception('No speed duel cards');
    }

    _speedDuelCards.safeAdd(speedDuelCards);
  }

  Future<void> _fetchPreBuiltDeckCardIds() async {
    logger.verbose(_tag, '_fetchPreBuiltDeckCardIds()');

    final deck = _preBuiltDeck;
    if (deck == null) {
      _preBuiltDeckCardIds.safeAdd(<int>[]);
      return;
    }

    final preBuiltDeckCardIds = await _dataManager.getPreBuiltDeckCardIds(deck);
    _preBuiltDeckCardIds.safeAdd(preBuiltDeckCardIds);
  }

  String getCardTag(CardCopy cardCopy, int index) => '${cardCopy.card.id} - $index';

  //region Actions

  Future<void> onCardPressed(CardCopy cardCopy, int index) async {
    logger.info(_tag, 'onCardPressed(card: ${cardCopy.card.id}, index: $index)');

    await _router.showYugiohCardDetail(cardCopy, getCardTag(cardCopy, index));
  }

  Future<void> onRetryPressed() async {
    logger.info(_tag, 'onRetryPressed()');

    await _fetchData();
  }

  void onTextFilterChanged(String value) {
    logger.info(_tag, 'onTextFilterChanged($value)');

    _textFilter.safeAdd(value);
  }

  void onClearTextFilterPressed() {
    logger.info(_tag, 'onClearTextFilterPressed()');

    _textFilter.safeAdd('');
  }

  //endregion

  //region Clean-up

  @override
  void dispose() {
    logger.info(_tag, 'dispose()');

    _filteredCardsSubscription?.cancel();
    _filteredCardsSubscription = null;

    _deckBuilderState.close();
    _speedDuelCards.close();
    _preBuiltDeckCardIds.close();
    _textFilter.close();

    super.dispose();
  }

  //endregion
}
