import 'package:mockito/annotations.dart';
import 'package:smart_duel_disk/packages/core/authentication/authentication.dart';
import 'package:smart_duel_disk/packages/core/core_config/lib/core_config.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/core/core_file_manager/lib/core_file_manager.dart';
import 'package:smart_duel_disk/packages/core/core_localization/lib/core_localization.dart';
import 'package:smart_duel_disk/packages/core/core_logger/lib/core_logger.dart';
import 'package:smart_duel_disk/packages/core/core_messaging/lib/core_messaging.dart';
import 'package:smart_duel_disk/packages/core/core_navigation/lib/core_navigation.dart';
import 'package:smart_duel_disk/packages/core/core_storage/lib/core_storage.dart';
import 'package:smart_duel_disk/packages/features/feature_home/lib/feature_home.dart';
import 'package:smart_duel_disk/packages/features/feature_home/lib/src/duel/mixins/duel_form_validators.dart';
import 'package:smart_duel_disk/packages/features/feature_home/lib/src/home/usecases/get_home_tabs_use_case.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_connectivity/lib/src/connectivity_provider.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_shared_preferences/lib/wrapper_shared_preferences.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_system_chrome/lib/src/system_chrome_provider.dart';
import 'package:universal_io/io.dart';

@GenerateMocks([
  Logger,
  DialogService,
  AppRouter,
  DataManager,
  DuelFormValidators,
  DuelDialogProvider,
  SnackBarService,
  SharedPreferencesProvider,
  AppConfig,
  DuelStorageProvider,
  GetHomeTabsUseCase,
  StringProvider,
  SystemChromeProvider,
  ConnectivityProvider,
  CacheCardImagesUseCase,
  FileManager,
  Directory,
  AreAllCardImagesCachedUseCase,
  AuthenticationService,
])
void main() {}
