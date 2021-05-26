import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/core_data_manager_interface/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/core/core_logger/core_logger_interface/lib/core_logger_interface.dart';
import 'package:smart_duel_disk/packages/core/core_navigation/lib/core_navigation.dart';
import 'package:smart_duel_disk/packages/features/feature_home/lib/src/duel/duel_viewmodel.dart';
import 'package:smart_duel_disk/packages/features/feature_home/lib/src/duel/mixins/duel_form_validators.dart';

import '../../../testing/empty_mocks.dart';

void main() {
  DuelViewModel _viewModel;

  Logger _logger;
  DuelFormValidators _duelFormValidators;
  RouterHelper _router;
  DataManager _dataManager;

  setUp(() {
    _logger = MockLogger();
    _duelFormValidators = MockDuelFormValidators();
    _router = MockRouterHelper();
    _dataManager = MockDataManager();

    _viewModel = DuelViewModel(
      _logger,
      _duelFormValidators,
      _router,
      _dataManager,
    );
  });

  group('When onDuelRoomPressed is called', () {
    test('then the select deck dialog is shown', () async {
      await _viewModel.onDuelRoomPressed();

      verify(_router.showSelectDeckDialog()).called(1);
    });

    group('and the selected deck is null', () {
      test('then the duel room screen is not opened', () async {
        when(_router.showSelectDeckDialog()).thenAnswer((_) => Future.value());

        await _viewModel.onDuelRoomPressed();

        verifyNever(_router.showDuelRoom(any));
      });
    });

    group('and the selected deck is not null', () {
      test('then the duel room screen is opened with the selected deck', () async {
        const deck = PreBuiltDeck.kaiba;
        when(_router.showSelectDeckDialog()).thenAnswer((_) => Future.value(deck));

        await _viewModel.onDuelRoomPressed();

        verify(_router.showDuelRoom(deck)).called(1);
      });
    });
  });
}
