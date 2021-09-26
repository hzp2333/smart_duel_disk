// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart' as _i51;
import 'package:connectivity_plus/connectivity_plus.dart' as _i17;
import 'package:dart_twitter_api/twitter_api.dart' as _i89;
import 'package:dio/dio.dart' as _i37;
import 'package:firebase_crashlytics/firebase_crashlytics.dart' as _i50;
import 'package:firebase_remote_config/firebase_remote_config.dart' as _i69;
import 'package:flutter/services.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive/hive.dart' as _i10;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i77;
import 'package:socket_io_client/socket_io_client.dart' as _i82;

import '../../generated/codegen_loader.g.dart' as _i16;
import '../../packages/core/core_config/lib/core_config.dart' as _i4;
import '../../packages/core/core_config/lib/src/providers/date_time_provider.dart'
    as _i28;
import '../../packages/core/core_config/lib/src/providers/delay_provider.dart'
    as _i35;
import '../../packages/core/core_config/lib/src/providers/dio_plugin_provider/dio_plugin_provider.dart'
    as _i38;
import '../../packages/core/core_data_manager/lib/core_data_manager_interface.dart'
    as _i25;
import '../../packages/core/core_data_manager/lib/src/data_manager.dart'
    as _i26;
import '../../packages/core/core_data_manager/lib/src/deck/deck_data_manager.dart'
    as _i31;
import '../../packages/core/core_data_manager/lib/src/duel/duel_data_manager.dart'
    as _i40;
import '../../packages/core/core_data_manager/lib/src/news/news_data_manager.dart'
    as _i59;
import '../../packages/core/core_data_manager/lib/src/settings/settings_data_manager.dart'
    as _i75;
import '../../packages/core/core_data_manager/lib/src/yugioh_cards/yugioh_cards_data_manager.dart'
    as _i97;
import '../../packages/core/core_display_config/lib/core_display_config.dart'
    as _i86;
import '../../packages/core/core_display_config/lib/src/display_config_service.dart'
    as _i103;
import '../../packages/core/core_general/lib/core_general.dart' as _i63;
import '../../packages/core/core_general/lib/src/formatters/date_formatter.dart'
    as _i27;
import '../../packages/core/core_localization/lib/core_localization.dart'
    as _i30;
import '../../packages/core/core_localization/lib/src/di/localization_module.dart'
    as _i107;
import '../../packages/core/core_localization/lib/src/string_provider.dart'
    as _i87;
import '../../packages/core/core_logger/lib/core_logger.dart' as _i14;
import '../../packages/core/core_logger/lib/src/logger.dart' as _i55;
import '../../packages/core/core_logger/lib/src/logger_impl.dart' as _i56;
import '../../packages/core/core_messaging/lib/core_messaging.dart' as _i34;
import '../../packages/core/core_messaging/lib/src/snack_bar/snack_bar_service.dart'
    as _i81;
import '../../packages/core/core_navigation/lib/core_navigation.dart' as _i5;
import '../../packages/core/core_navigation/lib/src/app_router.dart' as _i3;
import '../../packages/core/core_navigation/lib/src/dialogs/dialog_service.dart'
    as _i36;
import '../../packages/core/core_smart_duel_server/lib/core_smart_duel_server.dart'
    as _i44;
import '../../packages/core/core_smart_duel_server/lib/src/smart_duel_server.dart'
    as _i79;
import '../../packages/core/core_storage/lib/core_storage.dart' as _i11;
import '../../packages/core/core_storage/lib/src/di/storage_module.dart'
    as _i106;
import '../../packages/core/core_storage/lib/src/duel/duel_storage_provider.dart'
    as _i46;
import '../../packages/core/core_storage/lib/src/settings/settings_storage_provider.dart'
    as _i76;
import '../../packages/core/core_storage/lib/src/yugioh_cards/yugioh_cards_storage_provider.dart'
    as _i99;
import '../../packages/core/core_ygoprodeck/lib/core_ygoprodeck.dart' as _i98;
import '../../packages/core/core_ygoprodeck/lib/src/api/ygoprodeck_api.dart'
    as _i95;
import '../../packages/core/core_ygoprodeck/lib/src/di/ygoprodeck_module.dart'
    as _i109;
import '../../packages/core/core_ygoprodeck/lib/src/ygoprodeck_api_provider.dart'
    as _i104;
import '../../packages/features/feature_deck_builder/lib/src/deck_builder/deck_builder_viewmodel.dart'
    as _i29;
import '../../packages/features/feature_duel_room/lib/src/duel_room_viewmodel.dart'
    as _i43;
import '../../packages/features/feature_home/lib/feature_home.dart' as _i7;
import '../../packages/features/feature_home/lib/src/deck/deck_viewmodel.dart'
    as _i33;
import '../../packages/features/feature_home/lib/src/duel/dialogs/duel_dialog_provider.dart'
    as _i41;
import '../../packages/features/feature_home/lib/src/duel/dialogs/select_deck/select_deck_dialog_viewmodel.dart'
    as _i74;
import '../../packages/features/feature_home/lib/src/duel/duel_viewmodel.dart'
    as _i48;
import '../../packages/features/feature_home/lib/src/duel/mixins/duel_form_validators.dart'
    as _i42;
import '../../packages/features/feature_home/lib/src/home/home_viewmodel.dart'
    as _i53;
import '../../packages/features/feature_home/lib/src/home/usecases/get_home_tabs_use_case.dart'
    as _i52;
import '../../packages/features/feature_home/lib/src/news/news_viewmodel.dart'
    as _i62;
import '../../packages/features/feature_onboarding/lib/src/onboarding/onboarding_viewmodel.dart'
    as _i64;
import '../../packages/features/feature_privacy_policy/lib/src/privacy_policy_viewmodel.dart'
    as _i68;
import '../../packages/features/feature_speed_duel/lib/feature_speed_duel.dart'
    as _i8;
import '../../packages/features/feature_speed_duel/lib/src/dialogs/play_card_dialog/models/play_card_dialog_parameters.dart'
    as _i67;
import '../../packages/features/feature_speed_duel/lib/src/dialogs/play_card_dialog/play_card_dialog_viewmodel.dart'
    as _i66;
import '../../packages/features/feature_speed_duel/lib/src/dialogs/play_card_dialog/use_cases/create_play_card_dialog_actions_use_case.dart'
    as _i21;
import '../../packages/features/feature_speed_duel/lib/src/dialogs/speed_duel_dialog_provider.dart'
    as _i83;
import '../../packages/features/feature_speed_duel/lib/src/helpers/card_event_animation_handler.dart'
    as _i13;
import '../../packages/features/feature_speed_duel/lib/src/helpers/speed_duel_event_emitter.dart'
    as _i84;
import '../../packages/features/feature_speed_duel/lib/src/speed_duel_viewmodel.dart'
    as _i85;
import '../../packages/features/feature_speed_duel/lib/src/usecases/can_card_attack_zone_use_case.dart'
    as _i12;
import '../../packages/features/feature_speed_duel/lib/src/usecases/create_play_card_use_case.dart'
    as _i22;
import '../../packages/features/feature_speed_duel/lib/src/usecases/create_player_state_use_case.dart'
    as _i24;
import '../../packages/features/feature_speed_duel/lib/src/usecases/does_card_fit_in_zone_use_case.dart'
    as _i39;
import '../../packages/features/feature_speed_duel/lib/src/usecases/move_card_use_case.dart'
    as _i58;
import '../../packages/features/feature_user_settings/lib/src/user_settings_viewmodel.dart'
    as _i92;
import '../../packages/features/feature_yugioh_card_detail/lib/src/yugioh_card_detail_viewmodel.dart'
    as _i96;
import '../../packages/wrappers/wrapper_clipboard/lib/src/clipboard_provider.dart'
    as _i15;
import '../../packages/wrappers/wrapper_clipboard/lib/wrapper_clipboard.dart'
    as _i45;
import '../../packages/wrappers/wrapper_cloud_database/lib/src/cloud_database_provider.dart'
    as _i100;
import '../../packages/wrappers/wrapper_cloud_database/lib/src/di/cloud_database_module.dart'
    as _i111;
import '../../packages/wrappers/wrapper_cloud_database/lib/src/firebase/firebase_cloud_database_provider.dart'
    as _i101;
import '../../packages/wrappers/wrapper_cloud_database/lib/wrapper_cloud_database.dart'
    as _i32;
import '../../packages/wrappers/wrapper_connectivity/lib/src/connectivity_provider.dart'
    as _i18;
import '../../packages/wrappers/wrapper_connectivity/lib/src/di/connectivity_module.dart'
    as _i108;
import '../../packages/wrappers/wrapper_connectivity/lib/wrapper_connectivity.dart'
    as _i65;
import '../../packages/wrappers/wrapper_crashlytics/lib/src/crashlytics_provider.dart'
    as _i19;
import '../../packages/wrappers/wrapper_crashlytics/lib/src/di/crashlytics_module.dart'
    as _i110;
import '../../packages/wrappers/wrapper_crashlytics/lib/src/firebase/firebase_crashlytics_provider.dart'
    as _i102;
import '../../packages/wrappers/wrapper_crashlytics/lib/src/web/web_crashlytics_provider.dart'
    as _i20;
import '../../packages/wrappers/wrapper_crashlytics/lib/wrapper_crashlytics.dart'
    as _i57;
import '../../packages/wrappers/wrapper_enum_helper/lib/src/enum_helper.dart'
    as _i49;
import '../../packages/wrappers/wrapper_enum_helper/lib/wrapper_enum_helper.dart'
    as _i23;
import '../../packages/wrappers/wrapper_html_unescape/lib/src/html_unescape_provider.dart'
    as _i54;
import '../../packages/wrappers/wrapper_html_unescape/lib/wrapper_html_unescape.dart'
    as _i61;
import '../../packages/wrappers/wrapper_remote_config/lib/src/di/remote_config_module.dart'
    as _i112;
import '../../packages/wrappers/wrapper_remote_config/lib/src/firebase/firebase_remote_config_provider.dart'
    as _i71;
import '../../packages/wrappers/wrapper_remote_config/lib/src/remote_config_provider.dart'
    as _i72;
import '../../packages/wrappers/wrapper_remote_config/lib/src/web/web_remote_config_provider.dart'
    as _i73;
import '../../packages/wrappers/wrapper_remote_config/lib/wrapper_remote_config.dart'
    as _i70;
import '../../packages/wrappers/wrapper_shared_preferences/lib/src/di/shared_preferences_module.dart'
    as _i113;
import '../../packages/wrappers/wrapper_shared_preferences/lib/src/shared_preferences_provider.dart'
    as _i78;
import '../../packages/wrappers/wrapper_shared_preferences/lib/wrapper_shared_preferences.dart'
    as _i47;
import '../../packages/wrappers/wrapper_system_chrome/lib/src/system_chrome_provider.dart'
    as _i88;
import '../../packages/wrappers/wrapper_twitter/lib/src/di/twitter_module.dart'
    as _i115;
import '../../packages/wrappers/wrapper_twitter/lib/src/twitter_provider.dart'
    as _i90;
import '../../packages/wrappers/wrapper_twitter/lib/wrapper_twitter.dart'
    as _i60;
import '../../packages/wrappers/wrapper_url_launcher/lib/src/url_launcher_provider.dart'
    as _i91;
import '../../packages/wrappers/wrapper_url_launcher/lib/wrapper_url_launcher.dart'
    as _i6;
import '../../packages/wrappers/wrapper_web_socket/lib/src/di/web_socket_module.dart'
    as _i114;
import '../../packages/wrappers/wrapper_web_socket/lib/src/web_socket_factory.dart'
    as _i93;
import '../../packages/wrappers/wrapper_web_socket/lib/src/web_socket_provider.dart'
    as _i94;
import '../../packages/wrappers/wrapper_web_socket/lib/wrapper_web_socket.dart'
    as _i80;
import 'modules/flutter_module.dart' as _i105;

const String _web = 'web';
const String _mobile = 'mobile';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final flutterModule = _$FlutterModule();
  final storageModule = _$StorageModule();
  final localizationModule = _$LocalizationModule();
  final connectivityModule = _$ConnectivityModule();
  final ygoProDeckModule = _$YgoProDeckModule();
  final crashlyticsModule = _$CrashlyticsModule();
  final cloudDatabaseModule = _$CloudDatabaseModule();
  final remoteConfigModule = _$RemoteConfigModule();
  final sharedPreferencesModule = _$SharedPreferencesModule();
  final socketIoModule = _$SocketIoModule();
  final twitterModule = _$TwitterModule();
  gh.lazySingleton<_i3.AppRouter>(() => _i3.AppRouterImpl(
      get<_i4.AppConfig>(),
      get<_i5.AutoRouteRouter>(),
      get<_i5.DialogService>(),
      get<_i6.UrlLauncherProvider>(),
      get<_i7.DuelDialogProvider>(),
      get<_i8.SpeedDuelDialogProvider>()));
  gh.lazySingleton<_i9.AssetBundle>(() => flutterModule.provideAssetBundle);
  await gh.lazySingletonAsync<_i10.Box<_i11.DbYugiohCard>>(
      () => storageModule.provideYugiohCardBox(),
      preResolve: true);
  gh.lazySingleton<_i12.CanCardAttackZoneUseCase>(
      () => _i12.CanCardAttackZoneUseCase());
  gh.lazySingleton<_i13.CardEventAnimationHandler>(
      () => _i13.CardEventAnimationHandler(
          get<_i4.DelayProvider>(), get<_i14.Logger>()),
      dispose: (i) => i.dispose());
  gh.lazySingleton<_i15.ClipboardProvider>(() => _i15.ClipboardProviderImpl());
  gh.lazySingleton<_i16.CodegenLoader>(
      () => localizationModule.provideCodegenLoader);
  gh.lazySingleton<_i17.Connectivity>(
      () => connectivityModule.provideConnectivity());
  gh.lazySingleton<_i18.ConnectivityProvider>(
      () => _i18.ConnectivityProviderImpl(get<_i17.Connectivity>()));
  gh.lazySingleton<_i19.CrashlyticsProvider>(
      () => _i20.WebCrashlyticsProvider(),
      registerFor: {_web});
  gh.lazySingleton<_i21.CreatePlayCardDialogActionsUseCase>(
      () => _i21.CreatePlayCardDialogActionsUseCase(get<_i14.Logger>()));
  gh.lazySingleton<_i22.CreatePlayCardUseCase>(
      () => _i22.CreatePlayCardUseCase(get<_i23.EnumHelper>()));
  gh.lazySingleton<_i24.CreatePlayerStateUseCase>(() =>
      _i24.CreatePlayerStateUseCase(
          get<_i25.DataManager>(), get<_i22.CreatePlayCardUseCase>()));
  gh.lazySingleton<_i26.DataManager>(() => _i26.DataManagerImpl(
      get<_i25.NewsDataManager>(),
      get<_i25.YugiohCardsDataManager>(),
      get<_i25.DeckDataManager>(),
      get<_i25.DuelDataManager>(),
      get<_i25.SettingsDataManager>()));
  gh.lazySingleton<_i27.DateFormatter>(() => _i27.DateFormatter());
  gh.lazySingleton<_i28.DateTimeProvider>(() => _i28.DateTimeProviderImpl());
  gh.factoryParam<_i29.DeckBuilderViewModel, _i25.PreBuiltDeck?, dynamic>(
      (_preBuiltDeck, _) => _i29.DeckBuilderViewModel(
          _preBuiltDeck,
          get<_i5.AppRouter>(),
          get<_i25.DataManager>(),
          get<_i30.StringProvider>(),
          get<_i14.Logger>()));
  gh.lazySingleton<_i31.DeckDataManager>(
      () => _i31.DeckDataManagerImpl(get<_i32.CloudDatabaseProvider>()));
  gh.factory<_i33.DeckViewModel>(() => _i33.DeckViewModel(
      get<_i5.AppRouter>(),
      get<_i25.DataManager>(),
      get<_i34.SnackBarService>(),
      get<_i30.StringProvider>(),
      get<_i14.Logger>()));
  gh.lazySingleton<_i35.DelayProvider>(() => _i35.DelayProviderImpl());
  gh.lazySingleton<_i36.DialogService>(
      () => _i36.DialogServiceImpl(get<_i5.AutoRouteRouter>()));
  gh.lazySingleton<_i37.Dio>(() => ygoProDeckModule.provideYgoProDeckDio(
      get<_i4.AppConfig>(), get<_i4.DioPluginProvider>(), get<_i14.Logger>()));
  gh.lazySingleton<_i38.DioPluginProvider>(() => _i38.DioPluginProviderImpl());
  gh.lazySingleton<_i39.DoesCardFitInZoneUseCase>(
      () => _i39.DoesCardFitInZoneUseCase());
  gh.lazySingleton<_i40.DuelDataManager>(() => _i40.DuelDataManagerImpl(
      get<_i4.AppConfig>(), get<_i11.DuelStorageProvider>()));
  gh.lazySingleton<_i41.DuelDialogProvider>(() => _i41.DuelDialogProvider());
  gh.lazySingleton<_i42.DuelFormValidators>(
      () => _i42.DuelFormValidators(get<_i30.StringProvider>()));
  gh.factoryParam<_i43.DuelRoomViewModel, _i25.PreBuiltDeck?, dynamic>(
      (_preBuiltDeck, _) => _i43.DuelRoomViewModel(
          _preBuiltDeck,
          get<_i5.AppRouter>(),
          get<_i44.SmartDuelServer>(),
          get<_i25.DataManager>(),
          get<_i34.SnackBarService>(),
          get<_i45.ClipboardProvider>(),
          get<_i14.Logger>()));
  gh.lazySingleton<_i46.DuelStorageProvider>(() =>
      _i46.DuelStorageProviderImpl(get<_i47.SharedPreferencesProvider>()));
  gh.factory<_i48.DuelViewModel>(() => _i48.DuelViewModel(
      get<_i42.DuelFormValidators>(),
      get<_i5.AppRouter>(),
      get<_i25.DataManager>(),
      get<_i14.Logger>()));
  gh.lazySingleton<_i49.EnumHelper>(() => _i49.EnumHelperImpl());
  gh.lazySingleton<_i50.FirebaseCrashlytics>(
      () => crashlyticsModule.provideFirebaseCrashlytics());
  gh.lazySingleton<_i51.FirebaseFirestore>(
      () => cloudDatabaseModule.provideFirebaseFirestore());
  gh.lazySingleton<_i52.GetHomeTabsUseCase>(() => _i52.GetHomeTabsUseCase());
  gh.factory<_i53.HomeViewModel>(() => _i53.HomeViewModel(get<_i5.AppRouter>(),
      get<_i52.GetHomeTabsUseCase>(), get<_i14.Logger>()));
  gh.lazySingleton<_i54.HtmlUnescapeProvider>(
      () => _i54.HtmlUnescapeProviderImpl());
  gh.lazySingleton<_i55.Logger>(() =>
      _i56.LoggerImpl(get<_i57.CrashlyticsProvider>(), get<_i4.AppConfig>()));
  gh.lazySingleton<_i58.MoveCardUseCase>(() => _i58.MoveCardUseCase());
  gh.lazySingleton<_i59.NewsDataManager>(() => _i59.NewsDataManagerImpl(
      get<_i4.AppConfig>(),
      get<_i60.TwitterProvider>(),
      get<_i61.HtmlUnescapeProvider>()));
  gh.factory<_i62.NewsViewModel>(() => _i62.NewsViewModel(get<_i5.AppRouter>(),
      get<_i25.DataManager>(), get<_i63.DateFormatter>(), get<_i14.Logger>()));
  gh.factory<_i64.OnboardingViewModel>(() => _i64.OnboardingViewModel(
      get<_i5.AppRouter>(),
      get<_i25.DataManager>(),
      get<_i30.StringProvider>(),
      get<_i65.ConnectivityProvider>(),
      get<_i14.Logger>()));
  gh.factoryParam<_i66.PlayCardDialogViewModel, _i67.PlayCardDialogParameters?,
          dynamic>(
      (_parameters, _) => _i66.PlayCardDialogViewModel(
          _parameters,
          get<_i21.CreatePlayCardDialogActionsUseCase>(),
          get<_i5.DialogService>(),
          get<_i14.Logger>()));
  gh.factory<_i68.PrivacyPolicyViewModel>(() => _i68.PrivacyPolicyViewModel(
      get<_i9.AssetBundle>(), get<_i5.AppRouter>(), get<_i14.Logger>()));
  gh.lazySingleton<_i69.RemoteConfig>(
      () => remoteConfigModule.provideRemoteConfig());
  gh.lazySingleton<_i70.RemoteConfigProvider>(
      () => _i71.FirebaseRemoteConfigProvider(get<_i69.RemoteConfig>()),
      registerFor: {_mobile});
  gh.lazySingleton<_i72.RemoteConfigProvider>(
      () => _i73.WebRemoteConfigProvider(),
      registerFor: {_web});
  gh.factory<_i74.SelectDeckDialogViewModel>(() =>
      _i74.SelectDeckDialogViewModel(
          get<_i5.AppRouter>(),
          get<_i25.DataManager>(),
          get<_i5.DialogService>(),
          get<_i14.Logger>()));
  gh.lazySingleton<_i75.SettingsDataManager>(
      () => _i75.SettingsDataManagerImpl(get<_i11.SettingsStorageProvider>()));
  gh.lazySingleton<_i76.SettingsStorageProvider>(() =>
      _i76.SettingsStorageProviderImpl(get<_i47.SharedPreferencesProvider>()));
  await gh.lazySingletonAsync<_i77.SharedPreferences>(
      () => sharedPreferencesModule.provideSharedPreferences(),
      preResolve: true);
  gh.lazySingleton<_i78.SharedPreferencesProvider>(
      () => _i78.SharedPreferencesProviderImpl(get<_i77.SharedPreferences>()));
  gh.lazySingleton<_i79.SmartDuelServer>(() => _i79.SmartDuelServerImpl(
      get<_i80.WebSocketFactory>(), get<_i14.Logger>()));
  gh.lazySingleton<_i81.SnackBarService>(() => _i81.SnackBarServiceImpl());
  gh.factory<_i82.Socket>(
      () => socketIoModule.provideSocket(get<_i25.DataManager>()));
  gh.lazySingleton<_i83.SpeedDuelDialogProvider>(
      () => _i83.SpeedDuelDialogProvider());
  gh.lazySingleton<_i84.SpeedDuelEventEmitter>(() => _i84.SpeedDuelEventEmitter(
      get<_i44.SmartDuelServer>(), get<_i23.EnumHelper>(), get<_i14.Logger>()));
  gh.factoryParam<_i85.SpeedDuelViewModel, _i44.DuelRoom?, dynamic>(
      (_duelRoom, _) => _i85.SpeedDuelViewModel(
          _duelRoom,
          get<_i5.AppRouter>(),
          get<_i44.SmartDuelServer>(),
          get<_i24.CreatePlayerStateUseCase>(),
          get<_i22.CreatePlayCardUseCase>(),
          get<_i39.DoesCardFitInZoneUseCase>(),
          get<_i12.CanCardAttackZoneUseCase>(),
          get<_i58.MoveCardUseCase>(),
          get<_i84.SpeedDuelEventEmitter>(),
          get<_i13.CardEventAnimationHandler>(),
          get<_i25.DataManager>(),
          get<_i57.CrashlyticsProvider>(),
          get<_i34.SnackBarService>(),
          get<_i86.DisplayConfigService>(),
          get<_i14.Logger>()));
  gh.lazySingleton<_i87.StringProvider>(() => _i87.StringProviderImpl());
  gh.lazySingleton<_i88.SystemChromeProvider>(
      () => _i88.SystemChromeProviderImpl());
  gh.lazySingleton<_i89.TwitterApi>(
      () => twitterModule.provideTwitterApi(get<_i4.AppConfig>()));
  gh.lazySingleton<_i90.TwitterProvider>(
      () => _i90.TwitterProviderImpl(get<_i89.TwitterApi>()));
  gh.lazySingleton<_i91.UrlLauncherProvider>(
      () => _i91.UrlLauncherProviderImpl());
  gh.factory<_i92.UserSettingsViewModel>(() => _i92.UserSettingsViewModel(
      get<_i25.DataManager>(),
      get<_i34.SnackBarService>(),
      get<_i30.StringProvider>(),
      get<_i55.Logger>()));
  gh.lazySingleton<_i93.WebSocketFactory>(() => _i93.WebSocketFactoryImpl());
  gh.factory<_i94.WebSocketProvider>(
      () => _i94.WebSocketProviderImpl(get<_i82.Socket>(), get<_i14.Logger>()));
  gh.lazySingleton<_i95.YgoProDeckRestClient>(
      () => _i95.YgoProDeckRestClient(get<_i37.Dio>()));
  gh.factoryParam<_i96.YugiohCardDetailViewModel, _i25.YugiohCard?, int?>(
      (_yugiohCard, _index) => _i96.YugiohCardDetailViewModel(
          _yugiohCard, _index, get<_i14.Logger>()));
  gh.lazySingleton<_i97.YugiohCardsDataManager>(() =>
      _i97.YugiohCardsDataManagerImpl(
          get<_i98.YgoProDeckApiProvider>(),
          get<_i11.YugiohCardsStorageProvider>(),
          get<_i23.EnumHelper>(),
          get<_i14.Logger>()));
  gh.lazySingleton<_i99.YugiohCardsStorageProvider>(() =>
      _i99.YugiohCardsStorageProviderImpl(
          get<_i10.Box<_i11.DbYugiohCard>>(),
          get<_i47.SharedPreferencesProvider>(),
          get<_i70.RemoteConfigProvider>(),
          get<_i4.DateTimeProvider>(),
          get<_i14.Logger>()));
  gh.lazySingleton<_i100.CloudDatabaseProvider>(
      () => _i101.FirebaseCloudDatabaseProvider(get<_i51.FirebaseFirestore>()));
  gh.lazySingleton<_i19.CrashlyticsProvider>(
      () => _i102.FirebaseCrashlyticsProvider(get<_i50.FirebaseCrashlytics>()),
      registerFor: {_mobile});
  gh.lazySingleton<_i103.DisplayConfigService>(
      () => _i103.DisplayConfigServiceImpl(get<_i88.SystemChromeProvider>()));
  gh.lazySingleton<_i104.YgoProDeckApiProvider>(() =>
      _i104.YgoProDeckApiProviderImpl(
          get<_i95.YgoProDeckRestClient>(), get<_i14.Logger>()));
  return get;
}

class _$FlutterModule extends _i105.FlutterModule {}

class _$StorageModule extends _i106.StorageModule {}

class _$LocalizationModule extends _i107.LocalizationModule {}

class _$ConnectivityModule extends _i108.ConnectivityModule {}

class _$YgoProDeckModule extends _i109.YgoProDeckModule {}

class _$CrashlyticsModule extends _i110.CrashlyticsModule {}

class _$CloudDatabaseModule extends _i111.CloudDatabaseModule {}

class _$RemoteConfigModule extends _i112.RemoteConfigModule {}

class _$SharedPreferencesModule extends _i113.SharedPreferencesModule {}

class _$SocketIoModule extends _i114.SocketIoModule {}

class _$TwitterModule extends _i115.TwitterModule {}
