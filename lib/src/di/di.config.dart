// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart' as _i54;
import 'package:connectivity_plus/connectivity_plus.dart' as _i20;
import 'package:dart_twitter_api/twitter_api.dart' as _i91;
import 'package:dio/dio.dart' as _i39;
import 'package:firebase_crashlytics/firebase_crashlytics.dart' as _i53;
import 'package:firebase_remote_config/firebase_remote_config.dart' as _i71;
import 'package:flutter/services.dart' as _i11;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive/hive.dart' as _i12;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i79;
import 'package:socket_io_client/socket_io_client.dart' as _i84;

import '../../generated/codegen_loader.g.dart' as _i19;
import '../../packages/core/core_config/lib/core_config.dart' as _i4;
import '../../packages/core/core_config/lib/src/providers/date_time_provider.dart'
    as _i30;
import '../../packages/core/core_config/lib/src/providers/delay_provider.dart'
    as _i37;
import '../../packages/core/core_config/lib/src/providers/dio_plugin_provider/dio_plugin_provider.dart'
    as _i40;
import '../../packages/core/core_data_manager/lib/core_data_manager_interface.dart'
    as _i10;
import '../../packages/core/core_data_manager/lib/src/card_images/card_image_data_manager.dart'
    as _i102;
import '../../packages/core/core_data_manager/lib/src/card_images/usecases/are_all_card_images_cached_use_case.dart'
    as _i9;
import '../../packages/core/core_data_manager/lib/src/card_images/usecases/cache_card_images_use_case.dart'
    as _i14;
import '../../packages/core/core_data_manager/lib/src/data_manager.dart'
    as _i28;
import '../../packages/core/core_data_manager/lib/src/deck/deck_data_manager.dart'
    as _i33;
import '../../packages/core/core_data_manager/lib/src/duel/duel_data_manager.dart'
    as _i42;
import '../../packages/core/core_data_manager/lib/src/news/news_data_manager.dart'
    as _i62;
import '../../packages/core/core_data_manager/lib/src/settings/settings_data_manager.dart'
    as _i77;
import '../../packages/core/core_data_manager/lib/src/yugioh_cards/yugioh_cards_data_manager.dart'
    as _i99;
import '../../packages/core/core_display_config/lib/core_display_config.dart'
    as _i88;
import '../../packages/core/core_display_config/lib/src/display_config_service.dart'
    as _i106;
import '../../packages/core/core_file_manager/lib/src/di/file_manager_module.dart'
    as _i113;
import '../../packages/core/core_file_manager/lib/src/file_manager.dart'
    as _i52;
import '../../packages/core/core_general/lib/core_general.dart' as _i66;
import '../../packages/core/core_general/lib/src/formatters/date_formatter.dart'
    as _i29;
import '../../packages/core/core_localization/lib/core_localization.dart'
    as _i32;
import '../../packages/core/core_localization/lib/src/di/localization_module.dart'
    as _i110;
import '../../packages/core/core_localization/lib/src/string_provider.dart'
    as _i89;
import '../../packages/core/core_logger/lib/core_logger.dart' as _i17;
import '../../packages/core/core_logger/lib/src/logger.dart' as _i58;
import '../../packages/core/core_logger/lib/src/logger_impl.dart' as _i59;
import '../../packages/core/core_messaging/lib/core_messaging.dart' as _i36;
import '../../packages/core/core_messaging/lib/src/snack_bar/snack_bar_service.dart'
    as _i83;
import '../../packages/core/core_navigation/lib/core_navigation.dart' as _i5;
import '../../packages/core/core_navigation/lib/src/app_router.dart' as _i3;
import '../../packages/core/core_navigation/lib/src/dialogs/dialog_service.dart'
    as _i38;
import '../../packages/core/core_smart_duel_server/lib/core_smart_duel_server.dart'
    as _i46;
import '../../packages/core/core_smart_duel_server/lib/src/smart_duel_server.dart'
    as _i81;
import '../../packages/core/core_storage/lib/core_storage.dart' as _i13;
import '../../packages/core/core_storage/lib/src/di/storage_module.dart'
    as _i109;
import '../../packages/core/core_storage/lib/src/duel/duel_storage_provider.dart'
    as _i48;
import '../../packages/core/core_storage/lib/src/settings/settings_storage_provider.dart'
    as _i78;
import '../../packages/core/core_storage/lib/src/yugioh_cards/yugioh_cards_storage_provider.dart'
    as _i101;
import '../../packages/core/core_ygoprodeck/lib/core_ygoprodeck.dart' as _i100;
import '../../packages/core/core_ygoprodeck/lib/src/api/ygoprodeck_api.dart'
    as _i97;
import '../../packages/core/core_ygoprodeck/lib/src/di/ygoprodeck_module.dart'
    as _i112;
import '../../packages/core/core_ygoprodeck/lib/src/ygoprodeck_api_provider.dart'
    as _i107;
import '../../packages/features/feature_deck_builder/lib/src/deck_builder/deck_builder_viewmodel.dart'
    as _i31;
import '../../packages/features/feature_duel_room/lib/src/duel_room_viewmodel.dart'
    as _i45;
import '../../packages/features/feature_home/lib/feature_home.dart' as _i7;
import '../../packages/features/feature_home/lib/src/deck/deck_viewmodel.dart'
    as _i35;
import '../../packages/features/feature_home/lib/src/duel/dialogs/duel_dialog_provider.dart'
    as _i43;
import '../../packages/features/feature_home/lib/src/duel/dialogs/select_deck/select_deck_dialog_viewmodel.dart'
    as _i76;
import '../../packages/features/feature_home/lib/src/duel/duel_viewmodel.dart'
    as _i50;
import '../../packages/features/feature_home/lib/src/duel/mixins/duel_form_validators.dart'
    as _i44;
import '../../packages/features/feature_home/lib/src/home/home_viewmodel.dart'
    as _i56;
import '../../packages/features/feature_home/lib/src/home/usecases/get_home_tabs_use_case.dart'
    as _i55;
import '../../packages/features/feature_home/lib/src/news/news_viewmodel.dart'
    as _i65;
import '../../packages/features/feature_onboarding/lib/src/onboarding/onboarding_viewmodel.dart'
    as _i67;
import '../../packages/features/feature_privacy_policy/lib/src/privacy_policy_viewmodel.dart'
    as _i70;
import '../../packages/features/feature_speed_duel/lib/feature_speed_duel.dart'
    as _i8;
import '../../packages/features/feature_speed_duel/lib/src/dialogs/play_card_dialog/use_cases/create_play_card_dialog_actions_use_case.dart'
    as _i24;
import '../../packages/features/feature_speed_duel/lib/src/dialogs/speed_duel_dialog_provider.dart'
    as _i85;
import '../../packages/features/feature_speed_duel/lib/src/helpers/card_event_animation_handler.dart'
    as _i16;
import '../../packages/features/feature_speed_duel/lib/src/helpers/speed_duel_event_emitter.dart'
    as _i86;
import '../../packages/features/feature_speed_duel/lib/src/speed_duel_viewmodel.dart'
    as _i87;
import '../../packages/features/feature_speed_duel/lib/src/usecases/can_card_attack_zone_use_case.dart'
    as _i15;
import '../../packages/features/feature_speed_duel/lib/src/usecases/create_play_card_use_case.dart'
    as _i25;
import '../../packages/features/feature_speed_duel/lib/src/usecases/create_player_state_use_case.dart'
    as _i27;
import '../../packages/features/feature_speed_duel/lib/src/usecases/does_card_fit_in_zone_use_case.dart'
    as _i41;
import '../../packages/features/feature_speed_duel/lib/src/usecases/move_card_use_case.dart'
    as _i61;
import '../../packages/features/feature_user_settings/lib/src/user_settings_viewmodel.dart'
    as _i94;
import '../../packages/features/feature_yugioh_card_detail/lib/src/yugioh_card_detail_viewmodel.dart'
    as _i98;
import '../../packages/wrappers/wrapper_clipboard/lib/src/clipboard_provider.dart'
    as _i18;
import '../../packages/wrappers/wrapper_clipboard/lib/wrapper_clipboard.dart'
    as _i47;
import '../../packages/wrappers/wrapper_cloud_database/lib/src/cloud_database_provider.dart'
    as _i103;
import '../../packages/wrappers/wrapper_cloud_database/lib/src/di/cloud_database_module.dart'
    as _i115;
import '../../packages/wrappers/wrapper_cloud_database/lib/src/firebase/firebase_cloud_database_provider.dart'
    as _i104;
import '../../packages/wrappers/wrapper_cloud_database/lib/wrapper_cloud_database.dart'
    as _i34;
import '../../packages/wrappers/wrapper_connectivity/lib/src/connectivity_provider.dart'
    as _i21;
import '../../packages/wrappers/wrapper_connectivity/lib/src/di/connectivity_module.dart'
    as _i111;
import '../../packages/wrappers/wrapper_connectivity/lib/wrapper_connectivity.dart'
    as _i68;
import '../../packages/wrappers/wrapper_crashlytics/lib/src/crashlytics_provider.dart'
    as _i22;
import '../../packages/wrappers/wrapper_crashlytics/lib/src/di/crashlytics_module.dart'
    as _i114;
import '../../packages/wrappers/wrapper_crashlytics/lib/src/firebase/firebase_crashlytics_provider.dart'
    as _i105;
import '../../packages/wrappers/wrapper_crashlytics/lib/src/web/web_crashlytics_provider.dart'
    as _i23;
import '../../packages/wrappers/wrapper_crashlytics/lib/wrapper_crashlytics.dart'
    as _i60;
import '../../packages/wrappers/wrapper_enum_helper/lib/src/enum_helper.dart'
    as _i51;
import '../../packages/wrappers/wrapper_enum_helper/lib/wrapper_enum_helper.dart'
    as _i26;
import '../../packages/wrappers/wrapper_html_unescape/lib/src/html_unescape_provider.dart'
    as _i57;
import '../../packages/wrappers/wrapper_html_unescape/lib/wrapper_html_unescape.dart'
    as _i64;
import '../../packages/wrappers/wrapper_path_provider/lib/src/path_provider_wrapper.dart'
    as _i69;
import '../../packages/wrappers/wrapper_remote_config/lib/src/di/remote_config_module.dart'
    as _i116;
import '../../packages/wrappers/wrapper_remote_config/lib/src/firebase/firebase_remote_config_provider.dart'
    as _i73;
import '../../packages/wrappers/wrapper_remote_config/lib/src/remote_config_provider.dart'
    as _i72;
import '../../packages/wrappers/wrapper_remote_config/lib/src/web/web_remote_config_provider.dart'
    as _i75;
import '../../packages/wrappers/wrapper_remote_config/lib/wrapper_remote_config.dart'
    as _i74;
import '../../packages/wrappers/wrapper_shared_preferences/lib/src/di/shared_preferences_module.dart'
    as _i117;
import '../../packages/wrappers/wrapper_shared_preferences/lib/src/shared_preferences_provider.dart'
    as _i80;
import '../../packages/wrappers/wrapper_shared_preferences/lib/wrapper_shared_preferences.dart'
    as _i49;
import '../../packages/wrappers/wrapper_system_chrome/lib/src/system_chrome_provider.dart'
    as _i90;
import '../../packages/wrappers/wrapper_twitter/lib/src/di/twitter_module.dart'
    as _i119;
import '../../packages/wrappers/wrapper_twitter/lib/src/twitter_provider.dart'
    as _i92;
import '../../packages/wrappers/wrapper_twitter/lib/wrapper_twitter.dart'
    as _i63;
import '../../packages/wrappers/wrapper_url_launcher/lib/src/url_launcher_provider.dart'
    as _i93;
import '../../packages/wrappers/wrapper_url_launcher/lib/wrapper_url_launcher.dart'
    as _i6;
import '../../packages/wrappers/wrapper_web_socket/lib/src/di/web_socket_module.dart'
    as _i118;
import '../../packages/wrappers/wrapper_web_socket/lib/src/web_socket_factory.dart'
    as _i95;
import '../../packages/wrappers/wrapper_web_socket/lib/src/web_socket_provider.dart'
    as _i96;
import '../../packages/wrappers/wrapper_web_socket/lib/wrapper_web_socket.dart'
    as _i82;
import 'modules/flutter_module.dart' as _i108;

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
  final fileManagerModule = _$FileManagerModule();
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
  gh.lazySingleton<_i9.AreAllCardImagesCachedUseCase>(
      () => _i9.AreAllCardImagesCachedUseCaseImpl(get<_i10.DataManager>()));
  gh.lazySingleton<_i11.AssetBundle>(() => flutterModule.provideAssetBundle);
  await gh.lazySingletonAsync<_i12.Box<_i13.DbYugiohCard>>(
      () => storageModule.provideYugiohCardBox(),
      preResolve: true);
  gh.lazySingleton<_i14.CacheCardImagesUseCase>(
      () => _i14.CacheCardImagesUseCaseImpl(get<_i10.DataManager>()));
  gh.lazySingleton<_i15.CanCardAttackZoneUseCase>(
      () => _i15.CanCardAttackZoneUseCase());
  gh.lazySingleton<_i16.CardEventAnimationHandler>(
      () => _i16.CardEventAnimationHandler(
          get<_i4.DelayProvider>(), get<_i17.Logger>()),
      dispose: (i) => i.dispose());
  gh.lazySingleton<_i18.ClipboardProvider>(() => _i18.ClipboardProviderImpl());
  gh.lazySingleton<_i19.CodegenLoader>(
      () => localizationModule.provideCodegenLoader);
  gh.lazySingleton<_i20.Connectivity>(
      () => connectivityModule.provideConnectivity());
  gh.singleton<_i21.ConnectivityProvider>(
      _i21.ConnectivityProviderImpl(get<_i20.Connectivity>()));
  gh.lazySingleton<_i22.CrashlyticsProvider>(
      () => _i23.WebCrashlyticsProvider(),
      registerFor: {_web});
  gh.lazySingleton<_i24.CreatePlayCardDialogActionsUseCase>(
      () => _i24.CreatePlayCardDialogActionsUseCase());
  gh.lazySingleton<_i25.CreatePlayCardUseCase>(() => _i25.CreatePlayCardUseCase(
      get<_i10.DataManager>(), get<_i26.EnumHelper>()));
  gh.lazySingleton<_i27.CreatePlayerStateUseCase>(() =>
      _i27.CreatePlayerStateUseCase(
          get<_i10.DataManager>(), get<_i25.CreatePlayCardUseCase>()));
  gh.lazySingleton<_i28.DataManager>(() => _i28.DataManagerImpl(
      get<_i10.NewsDataManager>(),
      get<_i10.YugiohCardsDataManager>(),
      get<_i10.DeckDataManager>(),
      get<_i10.DuelDataManager>(),
      get<_i10.SettingsDataManager>(),
      get<_i10.CardImageDataManager>()));
  gh.lazySingleton<_i29.DateFormatter>(() => _i29.DateFormatter());
  gh.lazySingleton<_i30.DateTimeProvider>(() => _i30.DateTimeProviderImpl());
  gh.factoryParam<_i31.DeckBuilderViewModel, _i10.PreBuiltDeck?, dynamic>(
      (_preBuiltDeck, _) => _i31.DeckBuilderViewModel(
          _preBuiltDeck,
          get<_i5.AppRouter>(),
          get<_i10.DataManager>(),
          get<_i32.StringProvider>(),
          get<_i17.Logger>()));
  gh.lazySingleton<_i33.DeckDataManager>(
      () => _i33.DeckDataManagerImpl(get<_i34.CloudDatabaseProvider>()));
  gh.factory<_i35.DeckViewModel>(() => _i35.DeckViewModel(
      get<_i5.AppRouter>(),
      get<_i10.DataManager>(),
      get<_i36.SnackBarService>(),
      get<_i32.StringProvider>(),
      get<_i17.Logger>()));
  gh.lazySingleton<_i37.DelayProvider>(() => _i37.DelayProviderImpl());
  gh.lazySingleton<_i38.DialogService>(
      () => _i38.DialogServiceImpl(get<_i5.AutoRouteRouter>()));
  gh.lazySingleton<_i39.Dio>(
      () => ygoProDeckModule.provideYgoProDeckDio(get<_i4.AppConfig>(),
          get<_i4.DioPluginProvider>(), get<_i17.Logger>()),
      instanceName: 'YgoProDeckDio');
  gh.lazySingleton<_i39.Dio>(
      () => fileManagerModule.provideFileManagerDio(get<_i4.AppConfig>(),
          get<_i4.DioPluginProvider>(), get<_i17.Logger>()),
      instanceName: 'FileManagerDio');
  gh.lazySingleton<_i40.DioPluginProvider>(() => _i40.DioPluginProviderImpl());
  gh.lazySingleton<_i41.DoesCardFitInZoneUseCase>(
      () => _i41.DoesCardFitInZoneUseCase());
  gh.lazySingleton<_i42.DuelDataManager>(() => _i42.DuelDataManagerImpl(
      get<_i4.AppConfig>(), get<_i13.DuelStorageProvider>()));
  gh.lazySingleton<_i43.DuelDialogProvider>(() => _i43.DuelDialogProvider());
  gh.lazySingleton<_i44.DuelFormValidators>(
      () => _i44.DuelFormValidators(get<_i32.StringProvider>()));
  gh.factoryParam<_i45.DuelRoomViewModel, _i10.PreBuiltDeck?, dynamic>(
      (_preBuiltDeck, _) => _i45.DuelRoomViewModel(
          _preBuiltDeck,
          get<_i5.AppRouter>(),
          get<_i46.SmartDuelServer>(),
          get<_i10.DataManager>(),
          get<_i36.SnackBarService>(),
          get<_i47.ClipboardProvider>(),
          get<_i17.Logger>()));
  gh.lazySingleton<_i48.DuelStorageProvider>(() =>
      _i48.DuelStorageProviderImpl(get<_i49.SharedPreferencesProvider>()));
  gh.factory<_i50.DuelViewModel>(() => _i50.DuelViewModel(
      get<_i44.DuelFormValidators>(),
      get<_i5.AppRouter>(),
      get<_i10.DataManager>(),
      get<_i17.Logger>()));
  gh.lazySingleton<_i51.EnumHelper>(() => _i51.EnumHelperImpl());
  gh.lazySingleton<_i52.FileManager>(() =>
      _i52.FileManagerImpl(get<_i39.Dio>(instanceName: 'FileManagerDio')));
  gh.lazySingleton<_i53.FirebaseCrashlytics>(
      () => crashlyticsModule.provideFirebaseCrashlytics());
  gh.lazySingleton<_i54.FirebaseFirestore>(
      () => cloudDatabaseModule.provideFirebaseFirestore());
  gh.lazySingleton<_i55.GetHomeTabsUseCase>(() => _i55.GetHomeTabsUseCase());
  gh.factory<_i56.HomeViewModel>(() => _i56.HomeViewModel(get<_i5.AppRouter>(),
      get<_i55.GetHomeTabsUseCase>(), get<_i17.Logger>()));
  gh.lazySingleton<_i57.HtmlUnescapeProvider>(
      () => _i57.HtmlUnescapeProviderImpl());
  gh.lazySingleton<_i58.Logger>(() =>
      _i59.LoggerImpl(get<_i60.CrashlyticsProvider>(), get<_i4.AppConfig>()));
  gh.lazySingleton<_i61.MoveCardUseCase>(() => _i61.MoveCardUseCase());
  gh.lazySingleton<_i62.NewsDataManager>(() => _i62.NewsDataManagerImpl(
      get<_i4.AppConfig>(),
      get<_i63.TwitterProvider>(),
      get<_i64.HtmlUnescapeProvider>()));
  gh.factory<_i65.NewsViewModel>(() => _i65.NewsViewModel(get<_i5.AppRouter>(),
      get<_i10.DataManager>(), get<_i66.DateFormatter>(), get<_i17.Logger>()));
  gh.factory<_i67.OnboardingViewModel>(() => _i67.OnboardingViewModel(
      get<_i5.AppRouter>(),
      get<_i10.DataManager>(),
      get<_i10.AreAllCardImagesCachedUseCase>(),
      get<_i10.CacheCardImagesUseCase>(),
      get<_i32.StringProvider>(),
      get<_i68.ConnectivityProvider>(),
      get<_i17.Logger>()));
  gh.lazySingleton<_i69.PathProviderWrapper>(
      () => _i69.PathProviderWrapperImpl());
  gh.factory<_i70.PrivacyPolicyViewModel>(() => _i70.PrivacyPolicyViewModel(
      get<_i11.AssetBundle>(), get<_i5.AppRouter>(), get<_i17.Logger>()));
  gh.lazySingleton<_i71.RemoteConfig>(
      () => remoteConfigModule.provideRemoteConfig());
  gh.lazySingleton<_i72.RemoteConfigProvider>(
      () => _i73.FirebaseRemoteConfigProvider(get<_i71.RemoteConfig>()),
      registerFor: {_mobile});
  gh.lazySingleton<_i74.RemoteConfigProvider>(
      () => _i75.WebRemoteConfigProvider(),
      registerFor: {_web});
  gh.factory<_i76.SelectDeckDialogViewModel>(() =>
      _i76.SelectDeckDialogViewModel(
          get<_i5.AppRouter>(),
          get<_i10.DataManager>(),
          get<_i5.DialogService>(),
          get<_i17.Logger>()));
  gh.lazySingleton<_i77.SettingsDataManager>(
      () => _i77.SettingsDataManagerImpl(get<_i13.SettingsStorageProvider>()));
  gh.lazySingleton<_i78.SettingsStorageProvider>(() =>
      _i78.SettingsStorageProviderImpl(get<_i49.SharedPreferencesProvider>()));
  await gh.lazySingletonAsync<_i79.SharedPreferences>(
      () => sharedPreferencesModule.provideSharedPreferences(),
      preResolve: true);
  gh.lazySingleton<_i80.SharedPreferencesProvider>(
      () => _i80.SharedPreferencesProviderImpl(get<_i79.SharedPreferences>()));
  gh.lazySingleton<_i81.SmartDuelServer>(() => _i81.SmartDuelServerImpl(
      get<_i82.WebSocketFactory>(), get<_i17.Logger>()));
  gh.lazySingleton<_i83.SnackBarService>(() => _i83.SnackBarServiceImpl());
  gh.factory<_i84.Socket>(
      () => socketIoModule.provideSocket(get<_i10.DataManager>()));
  gh.lazySingleton<_i85.SpeedDuelDialogProvider>(
      () => _i85.SpeedDuelDialogProvider());
  gh.lazySingleton<_i86.SpeedDuelEventEmitter>(() => _i86.SpeedDuelEventEmitter(
      get<_i46.SmartDuelServer>(), get<_i26.EnumHelper>(), get<_i17.Logger>()));
  gh.factoryParam<_i87.SpeedDuelViewModel, _i46.DuelRoom?, dynamic>(
      (_duelRoom, _) => _i87.SpeedDuelViewModel(
          _duelRoom,
          get<_i5.AppRouter>(),
          get<_i46.SmartDuelServer>(),
          get<_i27.CreatePlayerStateUseCase>(),
          get<_i25.CreatePlayCardUseCase>(),
          get<_i41.DoesCardFitInZoneUseCase>(),
          get<_i15.CanCardAttackZoneUseCase>(),
          get<_i61.MoveCardUseCase>(),
          get<_i86.SpeedDuelEventEmitter>(),
          get<_i16.CardEventAnimationHandler>(),
          get<_i10.DataManager>(),
          get<_i60.CrashlyticsProvider>(),
          get<_i36.SnackBarService>(),
          get<_i88.DisplayConfigService>(),
          get<_i17.Logger>()));
  gh.lazySingleton<_i89.StringProvider>(() => _i89.StringProviderImpl());
  gh.lazySingleton<_i90.SystemChromeProvider>(
      () => _i90.SystemChromeProviderImpl());
  gh.lazySingleton<_i91.TwitterApi>(
      () => twitterModule.provideTwitterApi(get<_i4.AppConfig>()));
  gh.lazySingleton<_i92.TwitterProvider>(
      () => _i92.TwitterProviderImpl(get<_i91.TwitterApi>()));
  gh.lazySingleton<_i93.UrlLauncherProvider>(
      () => _i93.UrlLauncherProviderImpl());
  gh.factory<_i94.UserSettingsViewModel>(() => _i94.UserSettingsViewModel(
      get<_i10.DataManager>(),
      get<_i36.SnackBarService>(),
      get<_i32.StringProvider>(),
      get<_i58.Logger>()));
  gh.lazySingleton<_i95.WebSocketFactory>(() => _i95.WebSocketFactoryImpl());
  gh.factory<_i96.WebSocketProvider>(
      () => _i96.WebSocketProviderImpl(get<_i84.Socket>(), get<_i17.Logger>()));
  gh.lazySingleton<_i97.YgoProDeckRestClient>(() =>
      _i97.YgoProDeckRestClient(get<_i39.Dio>(instanceName: 'YgoProDeckDio')));
  gh.factoryParam<_i98.YugiohCardDetailViewModel, _i10.CardCopy?, String?>(
      (_cardCopy, _tag) =>
          _i98.YugiohCardDetailViewModel(_cardCopy, _tag, get<_i17.Logger>()));
  gh.lazySingleton<_i99.YugiohCardsDataManager>(() =>
      _i99.YugiohCardsDataManagerImpl(
          get<_i100.YgoProDeckApiProvider>(),
          get<_i13.YugiohCardsStorageProvider>(),
          get<_i26.EnumHelper>(),
          get<_i17.Logger>()));
  gh.lazySingleton<_i101.YugiohCardsStorageProvider>(() =>
      _i101.YugiohCardsStorageProviderImpl(
          get<_i12.Box<_i13.DbYugiohCard>>(),
          get<_i49.SharedPreferencesProvider>(),
          get<_i74.RemoteConfigProvider>(),
          get<_i4.DateTimeProvider>(),
          get<_i17.Logger>()));
  gh.lazySingleton<_i102.CardImageDataManager>(() =>
      _i102.CardImageDataManagerImpl(
          get<_i52.FileManager>(), get<_i69.PathProviderWrapper>()));
  gh.lazySingleton<_i103.CloudDatabaseProvider>(
      () => _i104.FirebaseCloudDatabaseProvider(get<_i54.FirebaseFirestore>()));
  gh.lazySingleton<_i22.CrashlyticsProvider>(
      () => _i105.FirebaseCrashlyticsProvider(get<_i53.FirebaseCrashlytics>()),
      registerFor: {_mobile});
  gh.lazySingleton<_i106.DisplayConfigService>(
      () => _i106.DisplayConfigServiceImpl(get<_i90.SystemChromeProvider>()));
  gh.lazySingleton<_i107.YgoProDeckApiProvider>(() =>
      _i107.YgoProDeckApiProviderImpl(
          get<_i97.YgoProDeckRestClient>(), get<_i17.Logger>()));
  return get;
}

class _$FlutterModule extends _i108.FlutterModule {}

class _$StorageModule extends _i109.StorageModule {}

class _$LocalizationModule extends _i110.LocalizationModule {}

class _$ConnectivityModule extends _i111.ConnectivityModule {}

class _$YgoProDeckModule extends _i112.YgoProDeckModule {}

class _$FileManagerModule extends _i113.FileManagerModule {}

class _$CrashlyticsModule extends _i114.CrashlyticsModule {}

class _$CloudDatabaseModule extends _i115.CloudDatabaseModule {}

class _$RemoteConfigModule extends _i116.RemoteConfigModule {}

class _$SharedPreferencesModule extends _i117.SharedPreferencesModule {}

class _$SocketIoModule extends _i118.SocketIoModule {}

class _$TwitterModule extends _i119.TwitterModule {}
