import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';
import 'package:smart_duel_disk/packages/core/core_logger/lib/core_logger.dart';
import 'package:smart_duel_disk/packages/core/core_messaging/lib/core_messaging.dart';
import 'package:smart_duel_disk/packages/core/core_navigation/lib/core_navigation.dart';
import 'package:smart_duel_disk/src/localization/strings.al.dart';

@Injectable()
class DeckViewModel extends BaseViewModel {
  final AppRouter _router;
  final DataManager _dataManager;
  final SnackBarService _snackBarService;

  DeckViewModel(
    Logger logger,
    this._router,
    this._dataManager,
    this._snackBarService,
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
    _snackBarService.showSnackBar(Strings.featureNotAvailableYetDescription.get('Creating a personal deck'));
  }
}
