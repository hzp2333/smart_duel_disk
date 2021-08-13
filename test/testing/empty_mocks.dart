import 'package:mockito/mockito.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/core/core_logger/lib/core_logger.dart';
import 'package:smart_duel_disk/packages/core/core_navigation/lib/core_navigation.dart';
import 'package:smart_duel_disk/packages/features/feature_home/lib/src/duel/dialogs/duel_dialog_provider.dart';
import 'package:smart_duel_disk/packages/features/feature_home/lib/src/duel/mixins/duel_form_validators.dart';

//region Core

class MockLogger extends Mock implements Logger {}

class MockDialogService extends Mock implements DialogService {}

class MockRouterHelper extends Mock implements AppRouter {}

class MockDataManager extends Mock implements DataManager {}

//endregion

//region Features

//region Home

class MockDuelFormValidators extends Mock implements DuelFormValidators {}

class MockDuelDialogProvider extends Mock implements DuelDialogProvider {}

//endregion

//endregion
