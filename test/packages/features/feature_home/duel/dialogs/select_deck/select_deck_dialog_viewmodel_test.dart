import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/features/feature_home/lib/src/duel/dialogs/select_deck/select_deck_dialog_viewmodel.dart';

import '../../../../../../testing/mocks/shared.mocks.dart';

void main() {
  late SelectDeckDialogViewModel _selectDeckDialogViewModel;

  late MockAppRouter _router;
  late MockDataManager _dataManager;
  late MockDialogService _dialogService;
  late MockLogger _logger;

  final _preBuiltDecks = [KaibaDeck(), MaiDeck(), YugiDeck()];

  setUp(() {
    _router = MockAppRouter();
    _dialogService = MockDialogService();
    _dataManager = MockDataManager();
    _logger = MockLogger();

    when(_dataManager.getPreBuiltDecks()).thenReturn(_preBuiltDecks);

    _selectDeckDialogViewModel = SelectDeckDialogViewModel(
      _router,
      _dataManager,
      _dialogService,
      _logger,
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
