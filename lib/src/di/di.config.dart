// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:audioplayers/audioplayers.dart' as _i12;
import 'package:cloud_firestore/cloud_firestore.dart' as _i59;
import 'package:connectivity_plus/connectivity_plus.dart' as _i23;
import 'package:dart_twitter_api/twitter_api.dart' as _i98;
import 'package:dio/dio.dart' as _i42;
import 'package:firebase_auth/firebase_auth.dart' as _i57;
import 'package:firebase_crashlytics/firebase_crashlytics.dart' as _i58;
import 'package:firebase_remote_config/firebase_remote_config.dart' as _i76;
import 'package:flutter/services.dart' as _i11;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive/hive.dart' as _i17;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i83;
import 'package:socket_io_client/socket_io_client.dart' as _i89;
import 'package:universal_io/io.dart' as _i44;

import '../../generated/codegen_loader.g.dart' as _i22;
import '../../packages/core/authentication/authentication.dart' as _i73;
import '../../packages/core/authentication/src/authentication_service.dart'
    as _i14;
import '../../packages/core/core_config/lib/core_config.dart' as _i4;
import '../../packages/core/core_config/lib/src/providers/date_time_provider.dart'
    as _i33;
import '../../packages/core/core_config/lib/src/providers/delay_provider.dart'
    as _i40;
import '../../packages/core/core_config/lib/src/providers/dio_plugin_provider/dio_plugin_provider.dart'
    as _i43;
import '../../packages/core/core_data_manager/lib/core_data_manager_interface.dart'
    as _i10;
import '../../packages/core/core_data_manager/lib/src/card_images/card_image_data_manager.dart'
    as _i111;
import '../../packages/core/core_data_manager/lib/src/card_images/usecases/are_all_card_images_cached_use_case.dart'
    as _i9;
import '../../packages/core/core_data_manager/lib/src/card_images/usecases/cache_card_images_use_case.dart'
    as _i19;
import '../../packages/core/core_data_manager/lib/src/data_manager.dart'
    as _i31;
import '../../packages/core/core_data_manager/lib/src/deck/deck_data_manager.dart'
    as _i36;
import '../../packages/core/core_data_manager/lib/src/duel/duel_data_manager.dart'
    as _i46;
import '../../packages/core/core_data_manager/lib/src/news/news_data_manager.dart'
    as _i67;
import '../../packages/core/core_data_manager/lib/src/settings/settings_data_manager.dart'
    as _i81;
import '../../packages/core/core_data_manager/lib/src/yugioh_cards/yugioh_cards_data_manager.dart'
    as _i106;
import '../../packages/core/core_display_config/lib/core_display_config.dart'
    as _i95;
import '../../packages/core/core_display_config/lib/src/display_config_service.dart'
    as _i115;
import '../../packages/core/core_file_manager/lib/src/file_manager.dart'
    as _i56;
import '../../packages/core/core_general/lib/core_general.dart' as _i71;
import '../../packages/core/core_general/lib/src/formatters/date_formatter.dart'
    as _i32;
import '../../packages/core/core_localization/lib/core_localization.dart'
    as _i35;
import '../../packages/core/core_localization/lib/src/di/localization_module.dart'
    as _i120;
import '../../packages/core/core_localization/lib/src/string_provider.dart'
    as _i96;
import '../../packages/core/core_logger/lib/core_logger.dart' as _i16;
import '../../packages/core/core_logger/lib/src/logger.dart' as _i63;
import '../../packages/core/core_logger/lib/src/logger_impl.dart' as _i64;
import '../../packages/core/core_messaging/lib/core_messaging.dart' as _i39;
import '../../packages/core/core_messaging/lib/src/snack_bar/snack_bar_service.dart'
    as _i88;
import '../../packages/core/core_navigation/lib/core_navigation.dart' as _i5;
import '../../packages/core/core_navigation/lib/src/app_router.dart' as _i3;
import '../../packages/core/core_navigation/lib/src/dialogs/dialog_service.dart'
    as _i41;
import '../../packages/core/core_smart_duel_server/lib/core_smart_duel_server.dart'
    as _i50;
import '../../packages/core/core_smart_duel_server/lib/src/smart_duel_server.dart'
    as _i86;
import '../../packages/core/core_storage/lib/core_storage.dart' as _i18;
import '../../packages/core/core_storage/lib/src/di/storage_module.dart'
    as _i119;
import '../../packages/core/core_storage/lib/src/duel/duel_storage_provider.dart'
    as _i52;
import '../../packages/core/core_storage/lib/src/settings/settings_storage_provider.dart'
    as _i82;
import '../../packages/core/core_storage/lib/src/yugioh_cards/yugioh_cards_storage_provider.dart'
    as _i108;
import '../../packages/core/core_ygoprodeck/lib/core_ygoprodeck.dart' as _i107;
import '../../packages/core/core_ygoprodeck/lib/src/api/ygoprodeck_api.dart'
    as _i104;
import '../../packages/core/core_ygoprodeck/lib/src/di/ygoprodeck_module.dart'
    as _i122;
import '../../packages/core/core_ygoprodeck/lib/src/ygoprodeck_api_provider.dart'
    as _i116;
import '../../packages/features/feature_deck_builder/lib/src/deck_builder/deck_builder_viewmodel.dart'
    as _i34;
import '../../packages/features/feature_duel_room/lib/src/duel_room_viewmodel.dart'
    as _i49;
import '../../packages/features/feature_home/lib/feature_home.dart' as _i7;
import '../../packages/features/feature_home/lib/src/deck/deck_viewmodel.dart'
    as _i38;
import '../../packages/features/feature_home/lib/src/duel/dialogs/duel_dialog_provider.dart'
    as _i47;
import '../../packages/features/feature_home/lib/src/duel/dialogs/select_deck/select_deck_dialog_viewmodel.dart'
    as _i80;
import '../../packages/features/feature_home/lib/src/duel/duel_viewmodel.dart'
    as _i54;
import '../../packages/features/feature_home/lib/src/duel/mixins/duel_form_validators.dart'
    as _i48;
import '../../packages/features/feature_home/lib/src/home/home_viewmodel.dart'
    as _i61;
import '../../packages/features/feature_home/lib/src/home/usecases/get_home_tabs_use_case.dart'
    as _i60;
import '../../packages/features/feature_home/lib/src/news/news_viewmodel.dart'
    as _i70;
import '../../packages/features/feature_onboarding/lib/src/onboarding/onboarding_viewmodel.dart'
    as _i72;
import '../../packages/features/feature_onboarding/lib/src/sign_in/sign_in_viewmodel.dart'
    as _i85;
import '../../packages/features/feature_privacy_policy/lib/src/privacy_policy_viewmodel.dart'
    as _i75;
import '../../packages/features/feature_speed_duel/lib/feature_speed_duel.dart'
    as _i8;
import '../../packages/features/feature_speed_duel/lib/src/dialogs/play_card_dialog/usecases/create_play_card_dialog_actions_use_case.dart'
    as _i27;
import '../../packages/features/feature_speed_duel/lib/src/dialogs/speed_duel_dialog_provider.dart'
    as _i90;
import '../../packages/features/feature_speed_duel/lib/src/helpers/speed_duel_event_animation_handler.dart'
    as _i91;
import '../../packages/features/feature_speed_duel/lib/src/helpers/speed_duel_event_audio_handler.dart'
    as _i92;
import '../../packages/features/feature_speed_duel/lib/src/helpers/speed_duel_event_emitter.dart'
    as _i93;
import '../../packages/features/feature_speed_duel/lib/src/speed_duel_viewmodel.dart'
    as _i94;
import '../../packages/features/feature_speed_duel/lib/src/usecases/can_card_attack_zone_use_case.dart'
    as _i20;
import '../../packages/features/feature_speed_duel/lib/src/usecases/create_play_card_use_case.dart'
    as _i28;
import '../../packages/features/feature_speed_duel/lib/src/usecases/create_player_state_use_case.dart'
    as _i30;
import '../../packages/features/feature_speed_duel/lib/src/usecases/does_card_fit_in_zone_use_case.dart'
    as _i45;
import '../../packages/features/feature_speed_duel/lib/src/usecases/move_card_use_case.dart'
    as _i66;
import '../../packages/features/feature_user_settings/lib/src/user_settings_viewmodel.dart'
    as _i101;
import '../../packages/features/feature_yugioh_card_detail/lib/src/yugioh_card_detail_viewmodel.dart'
    as _i105;
import '../../packages/wrappers/audio_player/src/audio_player_provider.dart'
    as _i13;
import '../../packages/wrappers/audio_player/src/di/audio_player_module.dart'
    as _i118;
import '../../packages/wrappers/wrapper_auth/src/auth_provider.dart' as _i109;
import '../../packages/wrappers/wrapper_auth/src/di/auth_module.dart' as _i124;
import '../../packages/wrappers/wrapper_auth/src/firebase/firebase_auth_provider.dart'
    as _i110;
import '../../packages/wrappers/wrapper_auth/wrapper_auth.dart' as _i15;
import '../../packages/wrappers/wrapper_clipboard/lib/src/clipboard_provider.dart'
    as _i21;
import '../../packages/wrappers/wrapper_clipboard/lib/wrapper_clipboard.dart'
    as _i51;
import '../../packages/wrappers/wrapper_cloud_database/lib/src/cloud_database_provider.dart'
    as _i112;
import '../../packages/wrappers/wrapper_cloud_database/lib/src/di/cloud_database_module.dart'
    as _i126;
import '../../packages/wrappers/wrapper_cloud_database/lib/src/firebase/firebase_cloud_database_provider.dart'
    as _i113;
import '../../packages/wrappers/wrapper_cloud_database/lib/wrapper_cloud_database.dart'
    as _i37;
import '../../packages/wrappers/wrapper_connectivity/lib/src/connectivity_provider.dart'
    as _i24;
import '../../packages/wrappers/wrapper_connectivity/lib/src/di/connectivity_module.dart'
    as _i121;
import '../../packages/wrappers/wrapper_connectivity/lib/wrapper_connectivity.dart'
    as _i74;
import '../../packages/wrappers/wrapper_crashlytics/lib/src/crashlytics_provider.dart'
    as _i25;
import '../../packages/wrappers/wrapper_crashlytics/lib/src/di/crashlytics_module.dart'
    as _i125;
import '../../packages/wrappers/wrapper_crashlytics/lib/src/firebase/firebase_crashlytics_provider.dart'
    as _i114;
import '../../packages/wrappers/wrapper_crashlytics/lib/src/web/web_crashlytics_provider.dart'
    as _i26;
import '../../packages/wrappers/wrapper_crashlytics/lib/wrapper_crashlytics.dart'
    as _i65;
import '../../packages/wrappers/wrapper_enum_helper/lib/src/enum_helper.dart'
    as _i55;
import '../../packages/wrappers/wrapper_enum_helper/lib/wrapper_enum_helper.dart'
    as _i29;
import '../../packages/wrappers/wrapper_html_unescape/lib/src/html_unescape_provider.dart'
    as _i62;
import '../../packages/wrappers/wrapper_html_unescape/lib/wrapper_html_unescape.dart'
    as _i69;
import '../../packages/wrappers/wrapper_path_provider/lib/src/di/path_provider_module.dart'
    as _i123;
import '../../packages/wrappers/wrapper_remote_config/lib/src/di/remote_config_module.dart'
    as _i127;
import '../../packages/wrappers/wrapper_remote_config/lib/src/firebase/firebase_remote_config_provider.dart'
    as _i78;
import '../../packages/wrappers/wrapper_remote_config/lib/src/web/web_remote_config_provider.dart'
    as _i79;
import '../../packages/wrappers/wrapper_remote_config/lib/wrapper_remote_config.dart'
    as _i77;
import '../../packages/wrappers/wrapper_shared_preferences/lib/src/di/shared_preferences_module.dart'
    as _i128;
import '../../packages/wrappers/wrapper_shared_preferences/lib/src/shared_preferences_provider.dart'
    as _i84;
import '../../packages/wrappers/wrapper_shared_preferences/lib/wrapper_shared_preferences.dart'
    as _i53;
import '../../packages/wrappers/wrapper_system_chrome/lib/src/system_chrome_provider.dart'
    as _i97;
import '../../packages/wrappers/wrapper_twitter/lib/src/di/twitter_module.dart'
    as _i130;
import '../../packages/wrappers/wrapper_twitter/lib/src/twitter_provider.dart'
    as _i99;
import '../../packages/wrappers/wrapper_twitter/lib/wrapper_twitter.dart'
    as _i68;
import '../../packages/wrappers/wrapper_url_launcher/lib/src/url_launcher_provider.dart'
    as _i100;
import '../../packages/wrappers/wrapper_url_launcher/lib/wrapper_url_launcher.dart'
    as _i6;
import '../../packages/wrappers/wrapper_web_socket/lib/src/di/web_socket_module.dart'
    as _i129;
import '../../packages/wrappers/wrapper_web_socket/lib/src/web_socket_factory.dart'
    as _i102;
import '../../packages/wrappers/wrapper_web_socket/lib/src/web_socket_provider.dart'
    as _i103;
import '../../packages/wrappers/wrapper_web_socket/lib/wrapper_web_socket.dart'
    as _i87;
import 'modules/flutter_module.dart' as _i117;

const String _web = 'web';
const String _mobile = 'mobile';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final flutterModule = _$FlutterModule();
  final audioPlayerModule = _$AudioPlayerModule();
  final storageModule = _$StorageModule();
  final localizationModule = _$LocalizationModule();
  final connectivityModule = _$ConnectivityModule();
  final ygoProDeckModule = _$YgoProDeckModule();
  final pathProviderModule = _$PathProviderModule();
  final authModule = _$AuthModule();
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
  gh.lazySingleton<_i12.AudioCache>(
      () => audioPlayerModule.provideAudioCache());
  gh.lazySingleton<_i13.AudioPlayerProvider>(
      () => _i13.AudioPlayerProviderImpl(get<_i12.AudioCache>()));
  gh.singleton<_i14.AuthenticationService>(
      _i14.AuthenticationServiceImpl(
          get<_i5.AppRouter>(), get<_i15.AuthProvider>(), get<_i16.Logger>()),
      dispose: (i) => i.dispose());
  await gh.lazySingletonAsync<_i17.Box<_i18.DbYugiohCard>>(
      () => storageModule.provideYugiohCardBox(),
      preResolve: true);
  gh.lazySingleton<_i19.CacheCardImagesUseCase>(
      () => _i19.CacheCardImagesUseCaseImpl(get<_i10.DataManager>()));
  gh.lazySingleton<_i20.CanCardAttackZoneUseCase>(
      () => _i20.CanCardAttackZoneUseCase());
  gh.lazySingleton<_i21.ClipboardProvider>(() => _i21.ClipboardProviderImpl());
  gh.lazySingleton<_i22.CodegenLoader>(
      () => localizationModule.provideCodegenLoader);
  gh.lazySingleton<_i23.Connectivity>(
      () => connectivityModule.provideConnectivity());
  gh.singleton<_i24.ConnectivityProvider>(
      _i24.ConnectivityProviderImpl(get<_i23.Connectivity>()));
  gh.lazySingleton<_i25.CrashlyticsProvider>(
      () => _i26.WebCrashlyticsProvider(),
      registerFor: {_web});
  gh.lazySingleton<_i27.CreatePlayCardDialogActionsUseCase>(
      () => _i27.CreatePlayCardDialogActionsUseCase());
  gh.lazySingleton<_i28.CreatePlayCardUseCase>(() => _i28.CreatePlayCardUseCase(
      get<_i10.DataManager>(), get<_i29.EnumHelper>()));
  gh.lazySingleton<_i30.CreatePlayerStateUseCase>(() =>
      _i30.CreatePlayerStateUseCase(
          get<_i10.DataManager>(), get<_i28.CreatePlayCardUseCase>()));
  gh.lazySingleton<_i31.DataManager>(() => _i31.DataManagerImpl(
      get<_i10.NewsDataManager>(),
      get<_i10.YugiohCardsDataManager>(),
      get<_i10.DeckDataManager>(),
      get<_i10.DuelDataManager>(),
      get<_i10.SettingsDataManager>(),
      get<_i10.CardImageDataManager>()));
  gh.lazySingleton<_i32.DateFormatter>(() => _i32.DateFormatter());
  gh.lazySingleton<_i33.DateTimeProvider>(() => _i33.DateTimeProviderImpl());
  gh.factoryParam<_i34.DeckBuilderViewModel, _i10.PreBuiltDeck?, dynamic>(
      (_preBuiltDeck, _) => _i34.DeckBuilderViewModel(
          _preBuiltDeck,
          get<_i5.AppRouter>(),
          get<_i10.DataManager>(),
          get<_i35.StringProvider>(),
          get<_i16.Logger>()));
  gh.lazySingleton<_i36.DeckDataManager>(
      () => _i36.DeckDataManagerImpl(get<_i37.CloudDatabaseProvider>()));
  gh.factory<_i38.DeckViewModel>(() => _i38.DeckViewModel(
      get<_i5.AppRouter>(),
      get<_i10.DataManager>(),
      get<_i39.SnackBarService>(),
      get<_i35.StringProvider>(),
      get<_i16.Logger>()));
  gh.lazySingleton<_i40.DelayProvider>(() => _i40.DelayProviderImpl());
  gh.lazySingleton<_i41.DialogService>(
      () => _i41.DialogServiceImpl(get<_i5.AutoRouteRouter>()));
  gh.lazySingleton<_i42.Dio>(
      () => ygoProDeckModule.provideYgoProDeckDio(get<_i4.AppConfig>(),
          get<_i4.DioPluginProvider>(), get<_i16.Logger>()),
      instanceName: 'YgoProDeckDio');
  gh.lazySingleton<_i43.DioPluginProvider>(() => _i43.DioPluginProviderImpl());
  await gh.lazySingletonAsync<_i44.Directory>(
      () => pathProviderModule.provideWebTempDirectory(),
      instanceName: 'TempDirectoryName',
      registerFor: {_web},
      preResolve: true);
  await gh.lazySingletonAsync<_i44.Directory>(
      () => pathProviderModule.provideWebAppDirectory(),
      instanceName: 'AppDirectory',
      registerFor: {_web},
      preResolve: true);
  await gh.lazySingletonAsync<_i44.Directory>(
      () => pathProviderModule.provideMobileAppDirectory(),
      instanceName: 'AppDirectory',
      registerFor: {_mobile},
      preResolve: true);
  await gh.lazySingletonAsync<_i44.Directory>(
      () => pathProviderModule.provideMobileTempDirectory(),
      instanceName: 'TempDirectoryName',
      registerFor: {_mobile},
      preResolve: true);
  gh.lazySingleton<_i45.DoesCardFitInZoneUseCase>(
      () => _i45.DoesCardFitInZoneUseCase());
  gh.lazySingleton<_i46.DuelDataManager>(() => _i46.DuelDataManagerImpl(
      get<_i4.AppConfig>(), get<_i18.DuelStorageProvider>()));
  gh.lazySingleton<_i47.DuelDialogProvider>(() => _i47.DuelDialogProvider());
  gh.lazySingleton<_i48.DuelFormValidators>(
      () => _i48.DuelFormValidators(get<_i35.StringProvider>()));
  gh.factoryParam<_i49.DuelRoomViewModel, _i10.PreBuiltDeck?, dynamic>(
      (_preBuiltDeck, _) => _i49.DuelRoomViewModel(
          _preBuiltDeck,
          get<_i5.AppRouter>(),
          get<_i50.SmartDuelServer>(),
          get<_i10.DataManager>(),
          get<_i39.SnackBarService>(),
          get<_i51.ClipboardProvider>(),
          get<_i16.Logger>()));
  gh.lazySingleton<_i52.DuelStorageProvider>(() =>
      _i52.DuelStorageProviderImpl(get<_i53.SharedPreferencesProvider>()));
  gh.factory<_i54.DuelViewModel>(() => _i54.DuelViewModel(
      get<_i48.DuelFormValidators>(),
      get<_i5.AppRouter>(),
      get<_i10.DataManager>(),
      get<_i16.Logger>()));
  gh.lazySingleton<_i55.EnumHelper>(() => _i55.EnumHelperImpl());
  gh.lazySingleton<_i56.FileManager>(() => _i56.FileManagerImpl());
  gh.lazySingleton<_i57.FirebaseAuth>(() => authModule.provideFirebaseAuth());
  gh.lazySingleton<_i58.FirebaseCrashlytics>(
      () => crashlyticsModule.provideFirebaseCrashlytics());
  gh.lazySingleton<_i59.FirebaseFirestore>(
      () => cloudDatabaseModule.provideFirebaseFirestore());
  gh.lazySingleton<_i60.GetHomeTabsUseCase>(() => _i60.GetHomeTabsUseCase());
  gh.factory<_i61.HomeViewModel>(() => _i61.HomeViewModel(get<_i5.AppRouter>(),
      get<_i60.GetHomeTabsUseCase>(), get<_i16.Logger>()));
  gh.lazySingleton<_i62.HtmlUnescapeProvider>(
      () => _i62.HtmlUnescapeProviderImpl());
  gh.lazySingleton<_i63.Logger>(() =>
      _i64.LoggerImpl(get<_i65.CrashlyticsProvider>(), get<_i4.AppConfig>()));
  gh.lazySingleton<_i66.MoveCardUseCase>(() => _i66.MoveCardUseCase());
  gh.lazySingleton<_i67.NewsDataManager>(() => _i67.NewsDataManagerImpl(
      get<_i4.AppConfig>(),
      get<_i68.TwitterProvider>(),
      get<_i69.HtmlUnescapeProvider>()));
  gh.factory<_i70.NewsViewModel>(() => _i70.NewsViewModel(get<_i5.AppRouter>(),
      get<_i10.DataManager>(), get<_i71.DateFormatter>(), get<_i16.Logger>()));
  gh.factory<_i72.OnboardingViewModel>(() => _i72.OnboardingViewModel(
      get<_i5.AppRouter>(),
      get<_i73.AuthenticationService>(),
      get<_i10.DataManager>(),
      get<_i10.AreAllCardImagesCachedUseCase>(),
      get<_i10.CacheCardImagesUseCase>(),
      get<_i35.StringProvider>(),
      get<_i74.ConnectivityProvider>(),
      get<_i16.Logger>()));
  gh.factory<_i75.PrivacyPolicyViewModel>(() => _i75.PrivacyPolicyViewModel(
      get<_i11.AssetBundle>(), get<_i5.AppRouter>(), get<_i16.Logger>()));
  gh.lazySingleton<_i76.RemoteConfig>(
      () => remoteConfigModule.provideRemoteConfig());
  gh.lazySingleton<_i77.RemoteConfigProvider>(
      () => _i78.FirebaseRemoteConfigProvider(get<_i76.RemoteConfig>()),
      registerFor: {_mobile});
  gh.lazySingleton<_i77.RemoteConfigProvider>(
      () => _i79.WebRemoteConfigProvider(),
      registerFor: {_web});
  gh.factory<_i80.SelectDeckDialogViewModel>(() =>
      _i80.SelectDeckDialogViewModel(
          get<_i5.AppRouter>(),
          get<_i10.DataManager>(),
          get<_i5.DialogService>(),
          get<_i16.Logger>()));
  gh.lazySingleton<_i81.SettingsDataManager>(
      () => _i81.SettingsDataManagerImpl(get<_i18.SettingsStorageProvider>()));
  gh.lazySingleton<_i82.SettingsStorageProvider>(() =>
      _i82.SettingsStorageProviderImpl(get<_i53.SharedPreferencesProvider>()));
  await gh.lazySingletonAsync<_i83.SharedPreferences>(
      () => sharedPreferencesModule.provideSharedPreferences(),
      preResolve: true);
  gh.lazySingleton<_i84.SharedPreferencesProvider>(
      () => _i84.SharedPreferencesProviderImpl(get<_i83.SharedPreferences>()));
  gh.factory<_i85.SignInViewModel>(
      () => _i85.SignInViewModel(get<_i63.Logger>()));
  gh.lazySingleton<_i86.SmartDuelServer>(() => _i86.SmartDuelServerImpl(
      get<_i87.WebSocketFactory>(), get<_i16.Logger>()));
  gh.lazySingleton<_i88.SnackBarService>(() => _i88.SnackBarServiceImpl());
  gh.factory<_i89.Socket>(
      () => socketIoModule.provideSocket(get<_i10.DataManager>()));
  gh.lazySingleton<_i90.SpeedDuelDialogProvider>(
      () => _i90.SpeedDuelDialogProvider());
  gh.lazySingleton<_i91.SpeedDuelEventAnimationHandler>(
      () => _i91.SpeedDuelEventAnimationHandler(
          get<_i4.DelayProvider>(), get<_i16.Logger>()),
      dispose: (i) => i.dispose());
  gh.lazySingleton<_i92.SpeedDuelEventAudioHandler>(
      () => _i92.SpeedDuelEventAudioHandler(get<_i13.AudioPlayerProvider>()));
  gh.lazySingleton<_i93.SpeedDuelEventEmitter>(() => _i93.SpeedDuelEventEmitter(
      get<_i50.SmartDuelServer>(), get<_i29.EnumHelper>(), get<_i16.Logger>()));
  gh.factoryParam<_i94.SpeedDuelViewModel, _i50.DuelRoom?, dynamic>(
      (_duelRoom, _) => _i94.SpeedDuelViewModel(
          _duelRoom,
          get<_i5.AppRouter>(),
          get<_i50.SmartDuelServer>(),
          get<_i30.CreatePlayerStateUseCase>(),
          get<_i28.CreatePlayCardUseCase>(),
          get<_i45.DoesCardFitInZoneUseCase>(),
          get<_i20.CanCardAttackZoneUseCase>(),
          get<_i66.MoveCardUseCase>(),
          get<_i93.SpeedDuelEventEmitter>(),
          get<_i91.SpeedDuelEventAnimationHandler>(),
          get<_i92.SpeedDuelEventAudioHandler>(),
          get<_i10.DataManager>(),
          get<_i65.CrashlyticsProvider>(),
          get<_i39.SnackBarService>(),
          get<_i95.DisplayConfigService>(),
          get<_i16.Logger>()));
  gh.lazySingleton<_i96.StringProvider>(() => _i96.StringProviderImpl());
  gh.lazySingleton<_i97.SystemChromeProvider>(
      () => _i97.SystemChromeProviderImpl());
  gh.lazySingleton<_i98.TwitterApi>(
      () => twitterModule.provideTwitterApi(get<_i4.AppConfig>()));
  gh.lazySingleton<_i99.TwitterProvider>(
      () => _i99.TwitterProviderImpl(get<_i98.TwitterApi>()));
  gh.lazySingleton<_i100.UrlLauncherProvider>(
      () => _i100.UrlLauncherProviderImpl());
  gh.factory<_i101.UserSettingsViewModel>(() => _i101.UserSettingsViewModel(
      get<_i10.DataManager>(),
      get<_i39.SnackBarService>(),
      get<_i35.StringProvider>(),
      get<_i63.Logger>()));
  gh.lazySingleton<_i102.WebSocketFactory>(() => _i102.WebSocketFactoryImpl());
  gh.factory<_i103.WebSocketProvider>(() =>
      _i103.WebSocketProviderImpl(get<_i89.Socket>(), get<_i16.Logger>()));
  gh.lazySingleton<_i104.YgoProDeckRestClient>(() =>
      _i104.YgoProDeckRestClient(get<_i42.Dio>(instanceName: 'YgoProDeckDio')));
  gh.factoryParam<_i105.YugiohCardDetailViewModel, _i10.CardCopy?, String?>(
      (_cardCopy, _tag) =>
          _i105.YugiohCardDetailViewModel(_cardCopy, _tag, get<_i16.Logger>()));
  gh.lazySingleton<_i106.YugiohCardsDataManager>(() =>
      _i106.YugiohCardsDataManagerImpl(
          get<_i107.YgoProDeckApiProvider>(),
          get<_i18.YugiohCardsStorageProvider>(),
          get<_i29.EnumHelper>(),
          get<_i16.Logger>()));
  gh.lazySingleton<_i108.YugiohCardsStorageProvider>(() =>
      _i108.YugiohCardsStorageProviderImpl(
          get<_i17.Box<_i18.DbYugiohCard>>(),
          get<_i53.SharedPreferencesProvider>(),
          get<_i77.RemoteConfigProvider>(),
          get<_i4.DateTimeProvider>(),
          get<_i16.Logger>()));
  gh.lazySingleton<_i109.AuthProvider>(
      () => _i110.FirebaseAuthProvider(get<_i57.FirebaseAuth>()));
  gh.lazySingleton<_i111.CardImageDataManager>(() =>
      _i111.CardImageDataManagerImpl(get<_i56.FileManager>(),
          get<_i44.Directory>(instanceName: 'AppDirectory')));
  gh.lazySingleton<_i112.CloudDatabaseProvider>(
      () => _i113.FirebaseCloudDatabaseProvider(get<_i59.FirebaseFirestore>()));
  gh.lazySingleton<_i25.CrashlyticsProvider>(
      () => _i114.FirebaseCrashlyticsProvider(get<_i58.FirebaseCrashlytics>()),
      registerFor: {_mobile});
  gh.lazySingleton<_i115.DisplayConfigService>(
      () => _i115.DisplayConfigServiceImpl(get<_i97.SystemChromeProvider>()));
  gh.lazySingleton<_i116.YgoProDeckApiProvider>(() =>
      _i116.YgoProDeckApiProviderImpl(
          get<_i104.YgoProDeckRestClient>(), get<_i16.Logger>()));
  return get;
}

class _$FlutterModule extends _i117.FlutterModule {}

class _$AudioPlayerModule extends _i118.AudioPlayerModule {}

class _$StorageModule extends _i119.StorageModule {}

class _$LocalizationModule extends _i120.LocalizationModule {}

class _$ConnectivityModule extends _i121.ConnectivityModule {}

class _$YgoProDeckModule extends _i122.YgoProDeckModule {}

class _$PathProviderModule extends _i123.PathProviderModule {}

class _$AuthModule extends _i124.AuthModule {}

class _$CrashlyticsModule extends _i125.CrashlyticsModule {}

class _$CloudDatabaseModule extends _i126.CloudDatabaseModule {}

class _$RemoteConfigModule extends _i127.RemoteConfigModule {}

class _$SharedPreferencesModule extends _i128.SharedPreferencesModule {}

class _$SocketIoModule extends _i129.SocketIoModule {}

class _$TwitterModule extends _i130.TwitterModule {}
