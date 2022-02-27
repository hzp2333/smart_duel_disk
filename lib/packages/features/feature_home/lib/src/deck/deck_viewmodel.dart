import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/generated/locale_keys.g.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/core/core_file_manager/lib/core_file_manager.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';
import 'package:smart_duel_disk/packages/core/core_localization/lib/core_localization.dart';
import 'package:smart_duel_disk/packages/core/core_logger/lib/core_logger.dart';
import 'package:smart_duel_disk/packages/core/core_messaging/lib/core_messaging.dart';
import 'package:smart_duel_disk/packages/core/core_navigation/lib/core_navigation.dart';

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

  DeckViewModel(
    Logger logger,
    this._router,
    this._dataManager,
    this._snackBarService,
    this._dialogService,
    this._stringProvider,
    this._getCardIdsFromDeckFileUseCase,
  ) : super(logger);

  Iterable<PreBuiltDeck> getPreBuiltDecks() {
    return _dataManager.getPreBuiltDecks();
  }

  Future<void> onPreBuiltDeckPressed(PreBuiltDeck preBuiltDeck) {
    return _router.showDeckBuilder(preBuiltDeck: preBuiltDeck);
  }

  Future<void> onSearchCardPressed() {
    return _router.showDeckBuilder();
  }

  Future<void> onBuildDeckPressed() async {
    final canCreateDeck = await _dataManager.canCreateDeck();
    if (!canCreateDeck) {
      return _showDeckBuildErrorDialog(LocaleKeys.deck_create_error_description_deck_limit);
    }

    try {
      final cardIds = await _getCardIdsFromDeckFileUseCase();
      await _dataManager.createDeck(cardIds);

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
      // TODO: loading state
      // TODO: look into isolates for heavy computations
      // TODO: firebase rules
      // TODO: show decks on deck screen
      // TODO: deck detail screen with options to edit title and delete deck
      // TODO: allow user to select personal deck for duelling
    }
  }

  Future<void> _showDeckBuildErrorDialog(String key) {
    return _showDeckBuildErrorDialogWithDescription(_stringProvider.getString(key));
  }

  Future<void> _showDeckBuildErrorDialogWithDescription(String description) {
    return _dialogService.showAlertDialog(
      DialogConfig(
        title: _stringProvider.getString(LocaleKeys.deck_create_error_title),
        description: description,
        positiveButtonText: _stringProvider.getString(LocaleKeys.general_dialog_ok),
      ),
    );
  }
}
