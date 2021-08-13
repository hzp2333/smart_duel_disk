import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';
import 'package:smart_duel_disk/packages/core/core_logger/lib/core_logger.dart';
import 'package:smart_duel_disk/packages/core/core_navigation/lib/core_navigation.dart';
import 'package:smart_duel_disk/src/localization/strings.al.dart';

@Injectable()
class SelectDeckDialogViewModel extends BaseViewModel {
  static const _tag = 'SelectDeckDialogViewModel';

  final AppRouter _router;
  final DialogService _dialogService;

  SelectDeckDialogViewModel(
    this._router,
    this._dialogService,
    Logger logger,
  ) : super(logger);

  Map<String, PreBuiltDeck> getDecks() {
    logger.info(_tag, 'getDecks()');

    return {
      Strings.deckPreBuiltYugiTitle.get(): PreBuiltDeck.yugi,
      Strings.deckPreBuiltKaibaTitle.get(): PreBuiltDeck.kaiba,
    };
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
