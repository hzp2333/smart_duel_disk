import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';
import 'package:smart_duel_disk/packages/core/core_logger/lib/core_logger.dart';
import 'package:smart_duel_disk/packages/core/core_navigation/lib/core_navigation.dart';

@Injectable()
class SelectDeckDialogViewModel extends BaseViewModel {
  static const _tag = 'SelectDeckDialogViewModel';

  final AppRouter _router;
  final DataManager _dataManager;
  final DialogService _dialogService;

  SelectDeckDialogViewModel(
    this._router,
    this._dataManager,
    this._dialogService,
    Logger logger,
  ) : super(logger);

  Iterable<PreBuiltDeck> getPreBuiltDecks() {
    logger.info(_tag, 'getPreBuiltDecks()');

    return _dataManager.getPreBuiltDecks();
  }

  void onDeckSelected(PreBuiltDeck deck) {
    logger.info(_tag, 'onDeckSelected(deck: $deck)');

    _dialogService.popDialog(deck);
  }

  Future<void> getDeckInfo(PreBuiltDeck deck) async {
    logger.info(_tag, 'getDeckInfo(deck: $deck)');

    await _router.showDeckBuilder(preBuiltDeck: deck);
  }
}
