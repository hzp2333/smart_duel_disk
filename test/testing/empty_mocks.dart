import 'package:mockito/mockito.dart';
import 'package:smart_duel_disk/packages/core/core_config/lib/core_config.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/core/core_logger/lib/core_logger.dart';
import 'package:smart_duel_disk/packages/core/core_messaging/lib/core_messaging.dart';
import 'package:smart_duel_disk/packages/core/core_navigation/lib/core_navigation.dart';
import 'package:smart_duel_disk/packages/core/core_storage/lib/core_storage.dart';
import 'package:smart_duel_disk/packages/features/feature_home/lib/src/duel/dialogs/duel_dialog_provider.dart';
import 'package:smart_duel_disk/packages/features/feature_home/lib/src/duel/mixins/duel_form_validators.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_shared_preferences/lib/wrapper_shared_preferences.dart';

class MockLogger extends Mock implements Logger {}

class MockDialogService extends Mock implements DialogService {}

class MockAppRouter extends Mock implements AppRouter {}

class MockDataManager extends Mock implements DataManager {}

class MockDuelFormValidators extends Mock implements DuelFormValidators {}

class MockDuelDialogProvider extends Mock implements DuelDialogProvider {}

class MockSnackBarService extends Mock implements SnackBarService {}

class MockSharedPreferencesProvider extends Mock implements SharedPreferencesProvider {}

// ignore: must_be_immutable
class MockAppConfig extends Mock implements AppConfig {}

class MockDuelStorageProvider extends Mock implements DuelStorageProvider {}
