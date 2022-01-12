// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:audioplayers/audioplayers.dart' as _i12;
import 'package:cloud_firestore/cloud_firestore.dart' as _i55;
import 'package:connectivity_plus/connectivity_plus.dart' as _i20;
import 'package:dart_twitter_api/twitter_api.dart' as _i93;
import 'package:dio/dio.dart' as _i40;
import 'package:firebase_crashlytics/firebase_crashlytics.dart' as _i54;
import 'package:firebase_remote_config/firebase_remote_config.dart' as _i72;
import 'package:flutter/services.dart' as _i11;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive/hive.dart' as _i14;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i79;
import 'package:socket_io_client/socket_io_client.dart' as _i84;

import '../../generated/codegen_loader.g.dart' as _i19;
import '../../packages/core/core_config/lib/core_config.dart' as _i4;
import '../../packages/core/core_config/lib/src/providers/date_time_provider.dart'
    as _i30;
import '../../packages/core/core_config/lib/src/providers/delay_provider.dart'
    as _i38;
import '../../packages/core/core_config/lib/src/providers/dio_plugin_provider/dio_plugin_provider.dart'
    as _i41;
import '../../packages/core/core_data_manager/lib/core_data_manager_interface.dart'
    as _i10;
import '../../packages/core/core_data_manager/lib/src/card_images/card_image_data_manager.dart'
    as _i104;
import '../../packages/core/core_data_manager/lib/src/card_images/usecases/are_all_card_images_cached_use_case.dart'
    as _i9;
import '../../packages/core/core_data_manager/lib/src/card_images/usecases/cache_card_images_use_case.dart'
    as _i16;
import '../../packages/core/core_data_manager/lib/src/data_manager.dart'
    as _i28;
import '../../packages/core/core_data_manager/lib/src/deck/deck_data_manager.dart'
    as _i34;
import '../../packages/core/core_data_manager/lib/src/duel/duel_data_manager.dart'
    as _i43;
import '../../packages/core/core_data_manager/lib/src/news/news_data_manager.dart'
    as _i63;
import '../../packages/core/core_data_manager/lib/src/settings/settings_data_manager.dart'
    as _i77;
import '../../packages/core/core_data_manager/lib/src/yugioh_cards/yugioh_cards_data_manager.dart'
    as _i101;
import '../../packages/core/core_display_config/lib/core_display_config.dart'
    as _i90;
import '../../packages/core/core_display_config/lib/src/display_config_service.dart'
    as _i108;
import '../../packages/core/core_file_manager/lib/src/file_manager.dart'
    as _i53;
import '../../packages/core/core_general/lib/core_general.dart' as _i67;
import '../../packages/core/core_general/lib/src/formatters/date_formatter.dart'
    as _i29;
import '../../packages/core/core_localization/lib/core_localization.dart'
    as _i32;
import '../../packages/core/core_localization/lib/src/di/localization_module.dart'
    as _i113;
import '../../packages/core/core_localization/lib/src/string_provider.dart'
    as _i91;
import '../../packages/core/core_logger/lib/core_logger.dart' as _i33;
import '../../packages/core/core_logger/lib/src/logger.dart' as _i59;
import '../../packages/core/core_logger/lib/src/logger_impl.dart' as _i60;
import '../../packages/core/core_messaging/lib/core_messaging.dart' as _i37;
import '../../packages/core/core_messaging/lib/src/snack_bar/snack_bar_service.dart'
    as _i83;
import '../../packages/core/core_navigation/lib/core_navigation.dart' as _i5;
import '../../packages/core/core_navigation/lib/src/app_router.dart' as _i3;
import '../../packages/core/core_navigation/lib/src/dialogs/dialog_service.dart'
    as _i39;
import '../../packages/core/core_smart_duel_server/lib/core_smart_duel_server.dart'
    as _i47;
import '../../packages/core/core_smart_duel_server/lib/src/smart_duel_server.dart'
    as _i81;
import '../../packages/core/core_storage/lib/core_storage.dart' as _i15;
import '../../packages/core/core_storage/lib/src/di/storage_module.dart'
    as _i112;
import '../../packages/core/core_storage/lib/src/duel/duel_storage_provider.dart'
    as _i49;
import '../../packages/core/core_storage/lib/src/settings/settings_storage_provider.dart'
    as _i78;
import '../../packages/core/core_storage/lib/src/yugioh_cards/yugioh_cards_storage_provider.dart'
    as _i103;
import '../../packages/core/core_ygoprodeck/lib/core_ygoprodeck.dart' as _i102;
import '../../packages/core/core_ygoprodeck/lib/src/api/ygoprodeck_api.dart'
    as _i99;
import '../../packages/core/core_ygoprodeck/lib/src/di/ygoprodeck_module.dart'
    as _i115;
import '../../packages/core/core_ygoprodeck/lib/src/ygoprodeck_api_provider.dart'
    as _i109;
import '../../packages/features/feature_deck_builder/lib/src/deck_builder/deck_builder_viewmodel.dart'
    as _i31;
import '../../packages/features/feature_duel_room/lib/src/duel_room_viewmodel.dart'
    as _i46;
import '../../packages/features/feature_home/lib/feature_home.dart' as _i7;
import '../../packages/features/feature_home/lib/src/deck/deck_viewmodel.dart'
    as _i36;
import '../../packages/features/feature_home/lib/src/duel/dialogs/duel_dialog_provider.dart'
    as _i44;
import '../../packages/features/feature_home/lib/src/duel/dialogs/select_deck/select_deck_dialog_viewmodel.dart'
    as _i76;
import '../../packages/features/feature_home/lib/src/duel/duel_viewmodel.dart'
    as _i51;
import '../../packages/features/feature_home/lib/src/duel/mixins/duel_form_validators.dart'
    as _i45;
import '../../packages/features/feature_home/lib/src/home/home_viewmodel.dart'
    as _i57;
import '../../packages/features/feature_home/lib/src/home/usecases/get_home_tabs_use_case.dart'
    as _i56;
import '../../packages/features/feature_home/lib/src/news/news_viewmodel.dart'
    as _i66;
import '../../packages/features/feature_onboarding/lib/src/onboarding/onboarding_viewmodel.dart'
    as _i68;
import '../../packages/features/feature_privacy_policy/lib/src/privacy_policy_viewmodel.dart'
    as _i71;
import '../../packages/features/feature_speed_duel/lib/feature_speed_duel.dart'
    as _i8;
import '../../packages/features/feature_speed_duel/lib/src/dialogs/play_card_dialog/usecases/create_play_card_dialog_actions_use_case.dart'
    as _i24;
import '../../packages/features/feature_speed_duel/lib/src/dialogs/speed_duel_dialog_provider.dart'
    as _i85;
import '../../packages/features/feature_speed_duel/lib/src/helpers/speed_duel_event_animation_handler.dart'
    as _i86;
import '../../packages/features/feature_speed_duel/lib/src/helpers/speed_duel_event_audio_handler.dart'
    as _i87;
import '../../packages/features/feature_speed_duel/lib/src/helpers/speed_duel_event_emitter.dart'
    as _i88;
import '../../packages/features/feature_speed_duel/lib/src/speed_duel_viewmodel.dart'
    as _i89;
import '../../packages/features/feature_speed_duel/lib/src/usecases/can_card_attack_zone_use_case.dart'
    as _i17;
import '../../packages/features/feature_speed_duel/lib/src/usecases/create_play_card_use_case.dart'
    as _i25;
import '../../packages/features/feature_speed_duel/lib/src/usecases/create_player_state_use_case.dart'
    as _i27;
import '../../packages/features/feature_speed_duel/lib/src/usecases/does_card_fit_in_zone_use_case.dart'
    as _i42;
import '../../packages/features/feature_speed_duel/lib/src/usecases/move_card_use_case.dart'
    as _i62;
import '../../packages/features/feature_user_settings/lib/src/user_settings_viewmodel.dart'
    as _i96;
import '../../packages/features/feature_yugioh_card_detail/lib/src/yugioh_card_detail_viewmodel.dart'
    as _i100;
import '../../packages/wrappers/audio_player/src/audio_player_provider.dart'
    as _i13;
import '../../packages/wrappers/audio_player/src/di/audio_player_module.dart'
    as _i111;
import '../../packages/wrappers/wrapper_clipboard/lib/src/clipboard_provider.dart'
    as _i18;
import '../../packages/wrappers/wrapper_clipboard/lib/wrapper_clipboard.dart'
    as _i48;
import '../../packages/wrappers/wrapper_cloud_database/lib/src/cloud_database_provider.dart'
    as _i105;
import '../../packages/wrappers/wrapper_cloud_database/lib/src/di/cloud_database_module.dart'
    as _i117;
import '../../packages/wrappers/wrapper_cloud_database/lib/src/firebase/firebase_cloud_database_provider.dart'
    as _i106;
import '../../packages/wrappers/wrapper_cloud_database/lib/wrapper_cloud_database.dart'
    as _i35;
import '../../packages/wrappers/wrapper_connectivity/lib/src/connectivity_provider.dart'
    as _i21;
import '../../packages/wrappers/wrapper_connectivity/lib/src/di/connectivity_module.dart'
    as _i114;
import '../../packages/wrappers/wrapper_connectivity/lib/wrapper_connectivity.dart'
    as _i69;
import '../../packages/wrappers/wrapper_crashlytics/lib/src/crashlytics_provider.dart'
    as _i22;
import '../../packages/wrappers/wrapper_crashlytics/lib/src/di/crashlytics_module.dart'
    as _i116;
import '../../packages/wrappers/wrapper_crashlytics/lib/src/firebase/firebase_crashlytics_provider.dart'
    as _i107;
import '../../packages/wrappers/wrapper_crashlytics/lib/src/web/web_crashlytics_provider.dart'
    as _i23;
import '../../packages/wrappers/wrapper_crashlytics/lib/wrapper_crashlytics.dart'
    as _i61;
import '../../packages/wrappers/wrapper_enum_helper/lib/src/enum_helper.dart'
    as _i52;
import '../../packages/wrappers/wrapper_enum_helper/lib/wrapper_enum_helper.dart'
    as _i26;
import '../../packages/wrappers/wrapper_html_unescape/lib/src/html_unescape_provider.dart'
    as _i58;
import '../../packages/wrappers/wrapper_html_unescape/lib/wrapper_html_unescape.dart'
    as _i65;
import '../../packages/wrappers/wrapper_path_provider/lib/src/path_provider_wrapper.dart'
    as _i70;
import '../../packages/wrappers/wrapper_remote_config/lib/src/di/remote_config_module.dart'
    as _i118;
import '../../packages/wrappers/wrapper_remote_config/lib/src/firebase/firebase_remote_config_provider.dart'
    as _i74;
import '../../packages/wrappers/wrapper_remote_config/lib/src/web/web_remote_config_provider.dart'
    as _i75;
import '../../packages/wrappers/wrapper_remote_config/lib/wrapper_remote_config.dart'
    as _i73;
import '../../packages/wrappers/wrapper_shared_preferences/lib/src/di/shared_preferences_module.dart'
    as _i119;
import '../../packages/wrappers/wrapper_shared_preferences/lib/src/shared_preferences_provider.dart'
    as _i80;
import '../../packages/wrappers/wrapper_shared_preferences/lib/wrapper_shared_preferences.dart'
    as _i50;
import '../../packages/wrappers/wrapper_system_chrome/lib/src/system_chrome_provider.dart'
    as _i92;
import '../../packages/wrappers/wrapper_twitter/lib/src/di/twitter_module.dart'
    as _i121;
import '../../packages/wrappers/wrapper_twitter/lib/src/twitter_provider.dart'
    as _i94;
import '../../packages/wrappers/wrapper_twitter/lib/wrapper_twitter.dart'
    as _i64;
import '../../packages/wrappers/wrapper_url_launcher/lib/src/url_launcher_provider.dart'
    as _i95;
import '../../packages/wrappers/wrapper_url_launcher/lib/wrapper_url_launcher.dart'
    as _i6;
import '../../packages/wrappers/wrapper_web_socket/lib/src/di/web_socket_module.dart'
    as _i120;
import '../../packages/wrappers/wrapper_web_socket/lib/src/web_socket_factory.dart'
    as _i97;
import '../../packages/wrappers/wrapper_web_socket/lib/src/web_socket_provider.dart'
    as _i98;
import '../../packages/wrappers/wrapper_web_socket/lib/wrapper_web_socket.dart'
    as _i82;
import 'modules/flutter_module.dart' as _i110;

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
  await gh.lazySingletonAsync<_i14.Box<_i15.DbYugiohCard>>(
      () => storageModule.provideYugiohCardBox(),
      preResolve: true);
  gh.lazySingleton<_i16.CacheCardImagesUseCase>(
      () => _i16.CacheCardImagesUseCaseImpl(get<_i10.DataManager>()));
  gh.lazySingleton<_i17.CanCardAttackZoneUseCase>(
      () => _i17.CanCardAttackZoneUseCase());
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
          get<_i33.Logger>()));
  gh.lazySingleton<_i34.DeckDataManager>(
      () => _i34.DeckDataManagerImpl(get<_i35.CloudDatabaseProvider>()));
  gh.factory<_i36.DeckViewModel>(() => _i36.DeckViewModel(
      get<_i5.AppRouter>(),
      get<_i10.DataManager>(),
      get<_i37.SnackBarService>(),
      get<_i32.StringProvider>(),
      get<_i33.Logger>()));
  gh.lazySingleton<_i38.DelayProvider>(() => _i38.DelayProviderImpl());
  gh.lazySingleton<_i39.DialogService>(
      () => _i39.DialogServiceImpl(get<_i5.AutoRouteRouter>()));
  gh.lazySingleton<_i40.Dio>(
      () => ygoProDeckModule.provideYgoProDeckDio(get<_i4.AppConfig>(),
          get<_i4.DioPluginProvider>(), get<_i33.Logger>()),
      instanceName: 'YgoProDeckDio');
  gh.lazySingleton<_i41.DioPluginProvider>(() => _i41.DioPluginProviderImpl());
  gh.lazySingleton<_i42.DoesCardFitInZoneUseCase>(
      () => _i42.DoesCardFitInZoneUseCase());
  gh.lazySingleton<_i43.DuelDataManager>(() => _i43.DuelDataManagerImpl(
      get<_i4.AppConfig>(), get<_i15.DuelStorageProvider>()));
  gh.lazySingleton<_i44.DuelDialogProvider>(() => _i44.DuelDialogProvider());
  gh.lazySingleton<_i45.DuelFormValidators>(
      () => _i45.DuelFormValidators(get<_i32.StringProvider>()));
  gh.factoryParam<_i46.DuelRoomViewModel, _i10.PreBuiltDeck?, dynamic>(
      (_preBuiltDeck, _) => _i46.DuelRoomViewModel(
          _preBuiltDeck,
          get<_i5.AppRouter>(),
          get<_i47.SmartDuelServer>(),
          get<_i10.DataManager>(),
          get<_i37.SnackBarService>(),
          get<_i48.ClipboardProvider>(),
          get<_i33.Logger>()));
  gh.lazySingleton<_i49.DuelStorageProvider>(() =>
      _i49.DuelStorageProviderImpl(get<_i50.SharedPreferencesProvider>()));
  gh.factory<_i51.DuelViewModel>(() => _i51.DuelViewModel(
      get<_i45.DuelFormValidators>(),
      get<_i5.AppRouter>(),
      get<_i10.DataManager>(),
      get<_i33.Logger>()));
  gh.lazySingleton<_i52.EnumHelper>(() => _i52.EnumHelperImpl());
  gh.lazySingleton<_i53.FileManager>(() => _i53.FileManagerImpl());
  gh.lazySingleton<_i54.FirebaseCrashlytics>(
      () => crashlyticsModule.provideFirebaseCrashlytics());
  gh.lazySingleton<_i55.FirebaseFirestore>(
      () => cloudDatabaseModule.provideFirebaseFirestore());
  gh.lazySingleton<_i56.GetHomeTabsUseCase>(() => _i56.GetHomeTabsUseCase());
  gh.factory<_i57.HomeViewModel>(() => _i57.HomeViewModel(get<_i5.AppRouter>(),
      get<_i56.GetHomeTabsUseCase>(), get<_i33.Logger>()));
  gh.lazySingleton<_i58.HtmlUnescapeProvider>(
      () => _i58.HtmlUnescapeProviderImpl());
  gh.lazySingleton<_i59.Logger>(() =>
      _i60.LoggerImpl(get<_i61.CrashlyticsProvider>(), get<_i4.AppConfig>()));
  gh.lazySingleton<_i62.MoveCardUseCase>(() => _i62.MoveCardUseCase());
  gh.lazySingleton<_i63.NewsDataManager>(() => _i63.NewsDataManagerImpl(
      get<_i4.AppConfig>(),
      get<_i64.TwitterProvider>(),
      get<_i65.HtmlUnescapeProvider>()));
  gh.factory<_i66.NewsViewModel>(() => _i66.NewsViewModel(get<_i5.AppRouter>(),
      get<_i10.DataManager>(), get<_i67.DateFormatter>(), get<_i33.Logger>()));
  gh.factory<_i68.OnboardingViewModel>(() => _i68.OnboardingViewModel(
      get<_i5.AppRouter>(),
      get<_i10.DataManager>(),
      get<_i10.AreAllCardImagesCachedUseCase>(),
      get<_i10.CacheCardImagesUseCase>(),
      get<_i32.StringProvider>(),
      get<_i69.ConnectivityProvider>(),
      get<_i33.Logger>()));
  gh.lazySingleton<_i70.PathProviderWrapper>(
      () => _i70.PathProviderWrapperImpl());
  gh.factory<_i71.PrivacyPolicyViewModel>(() => _i71.PrivacyPolicyViewModel(
      get<_i11.AssetBundle>(), get<_i5.AppRouter>(), get<_i33.Logger>()));
  gh.lazySingleton<_i72.RemoteConfig>(
      () => remoteConfigModule.provideRemoteConfig());
  gh.lazySingleton<_i73.RemoteConfigProvider>(
      () => _i74.FirebaseRemoteConfigProvider(get<_i72.RemoteConfig>()),
      registerFor: {_mobile});
  gh.lazySingleton<_i73.RemoteConfigProvider>(
      () => _i75.WebRemoteConfigProvider(),
      registerFor: {_web});
  gh.factory<_i76.SelectDeckDialogViewModel>(() =>
      _i76.SelectDeckDialogViewModel(
          get<_i5.AppRouter>(),
          get<_i10.DataManager>(),
          get<_i5.DialogService>(),
          get<_i33.Logger>()));
  gh.lazySingleton<_i77.SettingsDataManager>(
      () => _i77.SettingsDataManagerImpl(get<_i15.SettingsStorageProvider>()));
  gh.lazySingleton<_i78.SettingsStorageProvider>(() =>
      _i78.SettingsStorageProviderImpl(get<_i50.SharedPreferencesProvider>()));
  await gh.lazySingletonAsync<_i79.SharedPreferences>(
      () => sharedPreferencesModule.provideSharedPreferences(),
      preResolve: true);
  gh.lazySingleton<_i80.SharedPreferencesProvider>(
      () => _i80.SharedPreferencesProviderImpl(get<_i79.SharedPreferences>()));
  gh.lazySingleton<_i81.SmartDuelServer>(() => _i81.SmartDuelServerImpl(
      get<_i82.WebSocketFactory>(), get<_i33.Logger>()));
  gh.lazySingleton<_i83.SnackBarService>(() => _i83.SnackBarServiceImpl());
  gh.factory<_i84.Socket>(
      () => socketIoModule.provideSocket(get<_i10.DataManager>()));
  gh.lazySingleton<_i85.SpeedDuelDialogProvider>(
      () => _i85.SpeedDuelDialogProvider());
  gh.lazySingleton<_i86.SpeedDuelEventAnimationHandler>(
      () => _i86.SpeedDuelEventAnimationHandler(
          get<_i4.DelayProvider>(), get<_i33.Logger>()),
      dispose: (i) => i.dispose());
  gh.lazySingleton<_i87.SpeedDuelEventAudioHandler>(
      () => _i87.SpeedDuelEventAudioHandler(get<_i13.AudioPlayerProvider>()));
  gh.lazySingleton<_i88.SpeedDuelEventEmitter>(() => _i88.SpeedDuelEventEmitter(
      get<_i47.SmartDuelServer>(), get<_i26.EnumHelper>(), get<_i33.Logger>()));
  gh.factoryParam<_i89.SpeedDuelViewModel, _i47.DuelRoom?, dynamic>(
      (_duelRoom, _) => _i89.SpeedDuelViewModel(
          _duelRoom,
          get<_i5.AppRouter>(),
          get<_i47.SmartDuelServer>(),
          get<_i27.CreatePlayerStateUseCase>(),
          get<_i25.CreatePlayCardUseCase>(),
          get<_i42.DoesCardFitInZoneUseCase>(),
          get<_i17.CanCardAttackZoneUseCase>(),
          get<_i62.MoveCardUseCase>(),
          get<_i88.SpeedDuelEventEmitter>(),
          get<_i86.SpeedDuelEventAnimationHandler>(),
          get<_i87.SpeedDuelEventAudioHandler>(),
          get<_i10.DataManager>(),
          get<_i61.CrashlyticsProvider>(),
          get<_i37.SnackBarService>(),
          get<_i90.DisplayConfigService>(),
          get<_i33.Logger>()));
  gh.lazySingleton<_i91.StringProvider>(() => _i91.StringProviderImpl());
  gh.lazySingleton<_i92.SystemChromeProvider>(
      () => _i92.SystemChromeProviderImpl());
  gh.lazySingleton<_i93.TwitterApi>(
      () => twitterModule.provideTwitterApi(get<_i4.AppConfig>()));
  gh.lazySingleton<_i94.TwitterProvider>(
      () => _i94.TwitterProviderImpl(get<_i93.TwitterApi>()));
  gh.lazySingleton<_i95.UrlLauncherProvider>(
      () => _i95.UrlLauncherProviderImpl());
  gh.factory<_i96.UserSettingsViewModel>(() => _i96.UserSettingsViewModel(
      get<_i10.DataManager>(),
      get<_i37.SnackBarService>(),
      get<_i32.StringProvider>(),
      get<_i59.Logger>()));
  gh.lazySingleton<_i97.WebSocketFactory>(() => _i97.WebSocketFactoryImpl());
  gh.factory<_i98.WebSocketProvider>(
      () => _i98.WebSocketProviderImpl(get<_i84.Socket>(), get<_i33.Logger>()));
  gh.lazySingleton<_i99.YgoProDeckRestClient>(() =>
      _i99.YgoProDeckRestClient(get<_i40.Dio>(instanceName: 'YgoProDeckDio')));
  gh.factoryParam<_i100.YugiohCardDetailViewModel, _i10.CardCopy?, String?>(
      (_cardCopy, _tag) =>
          _i100.YugiohCardDetailViewModel(_cardCopy, _tag, get<_i33.Logger>()));
  gh.lazySingleton<_i101.YugiohCardsDataManager>(() =>
      _i101.YugiohCardsDataManagerImpl(
          get<_i102.YgoProDeckApiProvider>(),
          get<_i15.YugiohCardsStorageProvider>(),
          get<_i26.EnumHelper>(),
          get<_i33.Logger>()));
  gh.lazySingleton<_i103.YugiohCardsStorageProvider>(() =>
      _i103.YugiohCardsStorageProviderImpl(
          get<_i14.Box<_i15.DbYugiohCard>>(),
          get<_i50.SharedPreferencesProvider>(),
          get<_i73.RemoteConfigProvider>(),
          get<_i4.DateTimeProvider>(),
          get<_i33.Logger>()));
  gh.lazySingleton<_i104.CardImageDataManager>(() =>
      _i104.CardImageDataManagerImpl(
          get<_i53.FileManager>(), get<_i70.PathProviderWrapper>()));
  gh.lazySingleton<_i105.CloudDatabaseProvider>(
      () => _i106.FirebaseCloudDatabaseProvider(get<_i55.FirebaseFirestore>()));
  gh.lazySingleton<_i22.CrashlyticsProvider>(
      () => _i107.FirebaseCrashlyticsProvider(get<_i54.FirebaseCrashlytics>()),
      registerFor: {_mobile});
  gh.lazySingleton<_i108.DisplayConfigService>(
      () => _i108.DisplayConfigServiceImpl(get<_i92.SystemChromeProvider>()));
  gh.lazySingleton<_i109.YgoProDeckApiProvider>(() =>
      _i109.YgoProDeckApiProviderImpl(
          get<_i99.YgoProDeckRestClient>(), get<_i33.Logger>()));
  return get;
}

class _$FlutterModule extends _i110.FlutterModule {}

class _$AudioPlayerModule extends _i111.AudioPlayerModule {}

class _$StorageModule extends _i112.StorageModule {}

class _$LocalizationModule extends _i113.LocalizationModule {}

class _$ConnectivityModule extends _i114.ConnectivityModule {}

class _$YgoProDeckModule extends _i115.YgoProDeckModule {}

class _$CrashlyticsModule extends _i116.CrashlyticsModule {}

class _$CloudDatabaseModule extends _i117.CloudDatabaseModule {}

class _$RemoteConfigModule extends _i118.RemoteConfigModule {}

class _$SharedPreferencesModule extends _i119.SharedPreferencesModule {}

class _$SocketIoModule extends _i120.SocketIoModule {}

class _$TwitterModule extends _i121.TwitterModule {}
