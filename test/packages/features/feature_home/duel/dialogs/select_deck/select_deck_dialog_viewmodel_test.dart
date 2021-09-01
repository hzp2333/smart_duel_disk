import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/core/core_logger/lib/core_logger.dart';
import 'package:smart_duel_disk/packages/core/core_navigation/lib/core_navigation.dart';
import 'package:smart_duel_disk/packages/features/feature_home/lib/src/duel/dialogs/select_deck/select_deck_dialog_viewmodel.dart';

import '../../../../../../testing/empty_mocks.dart';

void main() {
  SelectDeckDialogViewModel _selectDeckDialogViewModel;

  Logger _logger;
  AppRouter _router;
  DataManager _dataManager;
  DialogService _dialogService;

  final _preBuiltDecks = [KaibaDeck(), MaiDeck(), YugiDeck()];

  setUp(() {
    _router = MockAppRouter();
    _dialogService = MockDialogService();
    _dataManager = MockDataManager();
    _logger = MockLogger();

    when(_dataManager.getPreBuiltDecks()).thenReturn(_preBuiltDecks);

    _selectDeckDialogViewModel = SelectDeckDialogViewModel(
      _logger,
      _router,
      _dataManager,
      _dialogService,
    );
  });

  group('When getPreBuiltDecks is called', () {
    test('then a list of decks is returned', () {
      final decks = _selectDeckDialogViewModel.getPreBuiltDecks();

      expect(decks, _preBuiltDecks);
    });
  });

  group('When onDeckSelected is called', () {
    test('then the dialog is popped with the deck as result', () {
      final deck = KaibaDeck();

      _selectDeckDialogViewModel.onDeckSelected(deck);

      verify(_dialogService.popDialog(deck)).called(1);
    });
  });

  group('When getDeckInfo is called', () {
    test('then the deck builder screen is opened with the deck', () {
      final deck = KaibaDeck();

      _selectDeckDialogViewModel.getDeckInfo(deck);

      verify(_router.showDeckBuilder(preBuiltDeck: deck));
    });
  });
}
