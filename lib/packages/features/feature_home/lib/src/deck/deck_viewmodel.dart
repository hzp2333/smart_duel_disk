import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:smart_duel_disk/generated/locale_keys.g.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/core/core_file_manager/lib/core_file_manager.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';
import 'package:smart_duel_disk/packages/core/core_localization/lib/core_localization.dart';
import 'package:smart_duel_disk/packages/core/core_logger/lib/core_logger.dart';
import 'package:smart_duel_disk/packages/core/core_messaging/lib/core_messaging.dart';
import 'package:smart_duel_disk/packages/core/core_navigation/lib/core_navigation.dart';

import 'models/deck_state.dart';
import 'models/invalid_deck_exception.dart';
import 'usecases/get_card_ids_from_deck_file_use_case.dart';

@Injectable()
class DeckViewModel extends BaseViewModel {
  static const _tag = 'DeckViewModel';

  final AppRouter _router;
  final DataManager _dataManager;
  final SnackBarService _snackBarService;
  final DialogService _dialogService;
  final StringProvider _stringProvider;
  final GetCardIdsFromDeckFileUseCase _getCardIdsFromDeckFileUseCase;

  final _deckState = BehaviorSubject<DeckState>.seeded(const DeckState(decks: [], loading: false));
  Stream<DeckState> get deckState => _deckState.stream.distinct();

  StreamSubscription<Iterable<UserDeck>>? _userDeckSubscription;

  DeckViewModel(
    Logger logger,
    this._router,
    this._dataManager,
    this._snackBarService,
    this._dialogService,
    this._stringProvider,
    this._getCardIdsFromDeckFileUseCase,
  ) : super(logger) {
    _init();
  }

  void _init() {
    logger.verbose(_tag, '_init()');

    _userDeckSubscription = _dataManager.getUserDecks().listen((userDecks) {
      _deckState.safeAdd(_deckState.value.copyWith(decks: userDecks));
    });
  }

  Iterable<PreBuiltDeck> getPreBuiltDecks() {
    logger.info(_tag, 'getPreBuiltDecks()');

    return _dataManager.getPreBuiltDecks();
  }

  Future<void> onPreBuiltDeckPressed(PreBuiltDeck preBuiltDeck) {
    logger.info(_tag, 'onPreBuiltDeckPressed(preBuiltDeck: ${preBuiltDeck.id})');

    return _router.showDeckBuilder(preBuiltDeck: preBuiltDeck);
  }

  Future<void> onSearchCardPressed() {
    logger.info(_tag, 'onSearchCardPressed()');

    return _router.showDeckBuilder();
  }

  Future<void> onBuildDeckPressed() async {
    logger.info(_tag, 'onBuildDeckPressed()');

    _deckState.safeAdd(_deckState.value.copyWith(loading: true));

    final canCreateDeck = await _dataManager.canCreateDeck();
    if (!canCreateDeck) {
      _deckState.safeAdd(_deckState.value.copyWith(loading: false));
      await _showDeckBuildErrorDialog(LocaleKeys.deck_create_error_description_deck_limit);
      return;
    }

    try {
      final cardIds = await _getCardIdsFromDeckFileUseCase();
      await _dataManager.createDeck('New Deck', cardIds);

      _snackBarService.showSnackBar('Deck created successfully!');
    } on NoFileSelectedException {
      // User cancelled flow, no need to do anything.
    } on FileNotFoundException {
      await _showDeckBuildErrorDialog(LocaleKeys.deck_create_error_description_file_not_found);
    } on InvalidExtensionException {
      await _showDeckBuildErrorDialog(LocaleKeys.deck_create_error_description_invalid_extension);
    } on InvalidDeckException catch (e) {
      await _showDeckBuildErrorDialogWithDescription(e.reason);
    } catch (e, stackTrace) {
      logger.error(_tag, 'An unexpected error occurred while creating a deck', e, stackTrace);
      await _showDeckBuildErrorDialog(LocaleKeys.deck_create_error_description_unexpected);
    } finally {
      _deckState.safeAdd(_deckState.value.copyWith(loading: false));

      // TODO: Deck icon
      // TODO: deck detail screen with options to edit title and delete deck
      // TODO: allow user to select personal deck for duelling

      // TODO: firebase rules
      // TODO: banlist
      // TODO: indicate which cards have 3D model
    }
  }

  Future<void> _showDeckBuildErrorDialog(String key) {
    logger.verbose(_tag, '_showDeckBuildErrorDialog()');

    return _showDeckBuildErrorDialogWithDescription(_stringProvider.getString(key));
  }

  Future<void> _showDeckBuildErrorDialogWithDescription(String description) {
    logger.verbose(_tag, '_showDeckBuildErrorDialogWithDescription()');

    return _dialogService.showAlertDialog(
      DialogConfig(
        title: _stringProvider.getString(LocaleKeys.deck_create_error_title),
        description: description,
        positiveButtonText: _stringProvider.getString(LocaleKeys.general_dialog_ok),
      ),
    );
  }

  Future<CardCopy> getCardCopy(int cardId) async {
    logger.info(_tag, 'getCardCopy(cardId: $cardId)');

    final card = await _dataManager.getSpeedDuelCard(cardId);
    final cardImage = await _dataManager.getCardImageFile(card);

    return CardCopy(card, cardImage);
  }

  Future<void> onPersonalDeckPressed(UserDeck userDeck) {
    logger.info(_tag, 'onPersonalDeckPressed(userDeck: ${userDeck.name})');

    return _router.showDeckBuilder(userDeck: userDeck);
  }

  @override
  void dispose() {
    logger.info(_tag, 'dispose()');

    _userDeckSubscription?.cancel();

    _deckState.close();

    super.dispose();
  }
}
