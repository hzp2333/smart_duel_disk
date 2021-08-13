import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/core/core_logger/lib/core_logger.dart';
import 'package:smart_duel_disk/packages/core/core_navigation/lib/core_navigation.dart';
import 'package:smart_duel_disk/packages/features/feature_home/lib/src/duel/dialogs/select_deck/select_deck_dialog_viewmodel.dart';
import 'package:smart_duel_disk/src/localization/strings.al.dart';

import '../../../../../testing/empty_mocks.dart';

void main() {
  SelectDeckDialogViewModel _selectDeckDialogViewModel;

  AppRouter _router;
  DialogService _dialogService;
  Logger _logger;

  setUp(() {
    _router = MockRouterHelper();
    _dialogService = MockDialogService();
    _logger = MockLogger();

    _selectDeckDialogViewModel = SelectDeckDialogViewModel(
      _router,
      _dialogService,
      _logger,
    );
  });

  group('When getDecks is called', () {
    test('then a list of decks is returned', () {
      final expected = {
        Strings.deckPreBuiltYugiTitle.get(): PreBuiltDeck.yugi,
        Strings.deckPreBuiltKaibaTitle.get(): PreBuiltDeck.kaiba,
      };

      final decks = _selectDeckDialogViewModel.getDecks();

      expect(decks, expected);
    });
  });

  group('When onDeckSelected is called', () {
    test('then the dialog is popped with the deck as result', () {
      const deck = PreBuiltDeck.kaiba;

      _selectDeckDialogViewModel.onDeckSelected(deck);

      verify(_dialogService.popDialog(deck)).called(1);
    });
  });

  group('When getDeckInfo is called', () {
    test('then the deck builder screen is opened with the deck', () {
      const deck = PreBuiltDeck.kaiba;

      _selectDeckDialogViewModel.getDeckInfo(deck);

      verify(_router.showDeckBuilder(preBuiltDeck: deck));
    });
  });
}
