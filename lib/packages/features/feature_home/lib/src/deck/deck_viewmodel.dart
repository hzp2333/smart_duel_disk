import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/generated/locale_keys.g.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/core/core_file_manager/lib/core_file_manager.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';
import 'package:smart_duel_disk/packages/core/core_localization/lib/core_localization.dart';
import 'package:smart_duel_disk/packages/core/core_logger/lib/core_logger.dart';
import 'package:smart_duel_disk/packages/core/core_messaging/lib/core_messaging.dart';
import 'package:smart_duel_disk/packages/core/core_navigation/lib/core_navigation.dart';

import 'usecases/get_card_ids_from_deck_file_use_case.dart';

@Injectable()
class DeckViewModel extends BaseViewModel {
  final AppRouter _router;
  final DataManager _dataManager;
  final SnackBarService _snackBarService;
  final StringProvider _stringProvider;
  final GetCardIdsFromDeckFileUseCase _getCardIdsFromDeckFileUseCase;

  DeckViewModel(
    Logger logger,
    this._router,
    this._dataManager,
    this._snackBarService,
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
    final cardIds = await _getCardIdsFromDeckFileUseCase();
    final x = cardIds.toList();
    final y  = x;

    // final featureName = _stringProvider.getString(LocaleKeys.feature_create_personal_deck);
    // final featureNotAvailableText =
    //     _stringProvider.getString(LocaleKeys.feature_not_available_yet_description, [featureName]);

    // _snackBarService.showSnackBar(
    //   _stringProvider.getString(featureNotAvailableText),
    // );
  }
}
