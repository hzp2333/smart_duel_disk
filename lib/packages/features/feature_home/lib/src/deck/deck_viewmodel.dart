import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/generated/locale_keys.g.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';
import 'package:smart_duel_disk/packages/core/core_localization/lib/core_localization.dart';
import 'package:smart_duel_disk/packages/core/core_logger/lib/core_logger.dart';
import 'package:smart_duel_disk/packages/core/core_messaging/lib/core_messaging.dart';
import 'package:smart_duel_disk/packages/core/core_navigation/lib/core_navigation.dart';

@Injectable()
class DeckViewModel extends BaseViewModel {
  final AppRouter _router;
  final DataManager _dataManager;
  final SnackBarService _snackBarService;
  final StringProvider _stringProvider;

  DeckViewModel(
    this._router,
    this._dataManager,
    this._snackBarService,
    this._stringProvider,
    Logger logger,
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

  void onBuildDeckPressed() {
    _snackBarService.showSnackBar(
      _stringProvider.getString(LocaleKeys.feature_not_available_yet_description, ['Creating a personal deck']),
    );
  }
}
