// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart' as _i53;
import 'package:connectivity_plus/connectivity_plus.dart' as _i18;
import 'package:dart_twitter_api/twitter_api.dart' as _i90;
import 'package:dio/dio.dart' as _i38;
import 'package:firebase_crashlytics/firebase_crashlytics.dart' as _i52;
import 'package:firebase_remote_config/firebase_remote_config.dart' as _i70;
import 'package:flutter/services.dart' as _i11;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive/hive.dart' as _i12;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i77;
import 'package:socket_io_client/socket_io_client.dart' as _i82;

import '../../generated/codegen_loader.g.dart' as _i17;
import '../../packages/core/core_config/lib/core_config.dart' as _i4;
import '../../packages/core/core_config/lib/src/providers/date_time_provider.dart'
    as _i28;
import '../../packages/core/core_config/lib/src/providers/delay_provider.dart'
    as _i36;
import '../../packages/core/core_config/lib/src/providers/dio_plugin_provider/dio_plugin_provider.dart'
    as _i39;
import '../../packages/core/core_data_manager/lib/core_data_manager_interface.dart'
    as _i10;
import '../../packages/core/core_data_manager/lib/src/card_images/card_image_data_manager.dart'
    as _i101;
import '../../packages/core/core_data_manager/lib/src/card_images/usecases/are_all_card_images_cached_use_case.dart'
    as _i9;
import '../../packages/core/core_data_manager/lib/src/card_images/usecases/cache_card_images_use_case.dart'
    as _i14;
import '../../packages/core/core_data_manager/lib/src/data_manager.dart'
    as _i26;
import '../../packages/core/core_data_manager/lib/src/deck/deck_data_manager.dart'
    as _i32;
import '../../packages/core/core_data_manager/lib/src/duel/duel_data_manager.dart'
    as _i41;
import '../../packages/core/core_data_manager/lib/src/news/news_data_manager.dart'
    as _i61;
import '../../packages/core/core_data_manager/lib/src/settings/settings_data_manager.dart'
    as _i75;
import '../../packages/core/core_data_manager/lib/src/yugioh_cards/yugioh_cards_data_manager.dart'
    as _i98;
import '../../packages/core/core_display_config/lib/core_display_config.dart'
    as _i87;
import '../../packages/core/core_display_config/lib/src/display_config_service.dart'
    as _i105;
import '../../packages/core/core_file_manager/lib/src/di/file_manager_module.dart'
    as _i111;
import '../../packages/core/core_file_manager/lib/src/file_manager.dart'
    as _i51;
import '../../packages/core/core_general/lib/core_general.dart' as _i65;
import '../../packages/core/core_general/lib/src/formatters/date_formatter.dart'
    as _i27;
import '../../packages/core/core_localization/lib/core_localization.dart'
    as _i30;
import '../../packages/core/core_localization/lib/src/di/localization_module.dart'
    as _i109;
import '../../packages/core/core_localization/lib/src/string_provider.dart'
    as _i88;
import '../../packages/core/core_logger/lib/core_logger.dart' as _i31;
import '../../packages/core/core_logger/lib/src/logger.dart' as _i57;
import '../../packages/core/core_logger/lib/src/logger_impl.dart' as _i58;
import '../../packages/core/core_messaging/lib/core_messaging.dart' as _i35;
import '../../packages/core/core_messaging/lib/src/snack_bar/snack_bar_service.dart'
    as _i81;
import '../../packages/core/core_navigation/lib/core_navigation.dart' as _i5;
import '../../packages/core/core_navigation/lib/src/app_router.dart' as _i3;
import '../../packages/core/core_navigation/lib/src/dialogs/dialog_service.dart'
    as _i37;
import '../../packages/core/core_smart_duel_server/lib/core_smart_duel_server.dart'
    as _i45;
import '../../packages/core/core_smart_duel_server/lib/src/smart_duel_server.dart'
    as _i79;
import '../../packages/core/core_storage/lib/core_storage.dart' as _i13;
import '../../packages/core/core_storage/lib/src/di/storage_module.dart'
    as _i108;
import '../../packages/core/core_storage/lib/src/duel/duel_storage_provider.dart'
    as _i47;
import '../../packages/core/core_storage/lib/src/settings/settings_storage_provider.dart'
    as _i76;
import '../../packages/core/core_storage/lib/src/yugioh_cards/yugioh_cards_storage_provider.dart'
    as _i100;
import '../../packages/core/core_ygoprodeck/lib/core_ygoprodeck.dart' as _i99;
import '../../packages/core/core_ygoprodeck/lib/src/api/ygoprodeck_api.dart'
    as _i96;
import '../../packages/core/core_ygoprodeck/lib/src/di/ygoprodeck_module.dart'
    as _i112;
import '../../packages/core/core_ygoprodeck/lib/src/ygoprodeck_api_provider.dart'
    as _i106;
import '../../packages/features/feature_deck_builder/lib/src/deck_builder/deck_builder_viewmodel.dart'
    as _i29;
import '../../packages/features/feature_duel_room/lib/src/duel_room_viewmodel.dart'
    as _i44;
import '../../packages/features/feature_home/lib/feature_home.dart' as _i7;
import '../../packages/features/feature_home/lib/src/deck/deck_viewmodel.dart'
    as _i34;
import '../../packages/features/feature_home/lib/src/duel/dialogs/duel_dialog_provider.dart'
    as _i42;
import '../../packages/features/feature_home/lib/src/duel/dialogs/select_deck/select_deck_dialog_viewmodel.dart'
    as _i74;
import '../../packages/features/feature_home/lib/src/duel/duel_viewmodel.dart'
    as _i49;
import '../../packages/features/feature_home/lib/src/duel/mixins/duel_form_validators.dart'
    as _i43;
import '../../packages/features/feature_home/lib/src/home/home_viewmodel.dart'
    as _i55;
import '../../packages/features/feature_home/lib/src/home/usecases/get_home_tabs_use_case.dart'
    as _i54;
import '../../packages/features/feature_home/lib/src/news/news_viewmodel.dart'
    as _i64;
import '../../packages/features/feature_onboarding/lib/src/onboarding/onboarding_viewmodel.dart'
    as _i66;
import '../../packages/features/feature_privacy_policy/lib/src/privacy_policy_viewmodel.dart'
    as _i69;
import '../../packages/features/feature_speed_duel/lib/feature_speed_duel.dart'
    as _i8;
import '../../packages/features/feature_speed_duel/lib/src/dialogs/play_card_dialog/use_cases/create_play_card_dialog_actions_use_case.dart'
    as _i22;
import '../../packages/features/feature_speed_duel/lib/src/dialogs/speed_duel_dialog_provider.dart'
    as _i83;
import '../../packages/features/feature_speed_duel/lib/src/helpers/speed_duel_event_animation_handler.dart'
    as _i84;
import '../../packages/features/feature_speed_duel/lib/src/helpers/speed_duel_event_emitter.dart'
    as _i85;
import '../../packages/features/feature_speed_duel/lib/src/speed_duel_viewmodel.dart'
    as _i86;
import '../../packages/features/feature_speed_duel/lib/src/usecases/can_card_attack_zone_use_case.dart'
    as _i15;
import '../../packages/features/feature_speed_duel/lib/src/usecases/create_play_card_use_case.dart'
    as _i23;
import '../../packages/features/feature_speed_duel/lib/src/usecases/create_player_state_use_case.dart'
    as _i25;
import '../../packages/features/feature_speed_duel/lib/src/usecases/does_card_fit_in_zone_use_case.dart'
    as _i40;
import '../../packages/features/feature_speed_duel/lib/src/usecases/move_card_use_case.dart'
    as _i60;
import '../../packages/features/feature_user_settings/lib/src/user_settings_viewmodel.dart'
    as _i93;
import '../../packages/features/feature_yugioh_card_detail/lib/src/yugioh_card_detail_viewmodel.dart'
    as _i97;
import '../../packages/wrappers/wrapper_clipboard/lib/src/clipboard_provider.dart'
    as _i16;
import '../../packages/wrappers/wrapper_clipboard/lib/wrapper_clipboard.dart'
    as _i46;
import '../../packages/wrappers/wrapper_cloud_database/lib/src/cloud_database_provider.dart'
    as _i102;
import '../../packages/wrappers/wrapper_cloud_database/lib/src/di/cloud_database_module.dart'
    as _i114;
import '../../packages/wrappers/wrapper_cloud_database/lib/src/firebase/firebase_cloud_database_provider.dart'
    as _i103;
import '../../packages/wrappers/wrapper_cloud_database/lib/wrapper_cloud_database.dart'
    as _i33;
import '../../packages/wrappers/wrapper_connectivity/lib/src/connectivity_provider.dart'
    as _i19;
import '../../packages/wrappers/wrapper_connectivity/lib/src/di/connectivity_module.dart'
    as _i110;
import '../../packages/wrappers/wrapper_connectivity/lib/wrapper_connectivity.dart'
    as _i67;
import '../../packages/wrappers/wrapper_crashlytics/lib/src/crashlytics_provider.dart'
    as _i20;
import '../../packages/wrappers/wrapper_crashlytics/lib/src/di/crashlytics_module.dart'
    as _i113;
import '../../packages/wrappers/wrapper_crashlytics/lib/src/firebase/firebase_crashlytics_provider.dart'
    as _i104;
import '../../packages/wrappers/wrapper_crashlytics/lib/src/web/web_crashlytics_provider.dart'
    as _i21;
import '../../packages/wrappers/wrapper_crashlytics/lib/wrapper_crashlytics.dart'
    as _i59;
import '../../packages/wrappers/wrapper_enum_helper/lib/src/enum_helper.dart'
    as _i50;
import '../../packages/wrappers/wrapper_enum_helper/lib/wrapper_enum_helper.dart'
    as _i24;
import '../../packages/wrappers/wrapper_html_unescape/lib/src/html_unescape_provider.dart'
    as _i56;
import '../../packages/wrappers/wrapper_html_unescape/lib/wrapper_html_unescape.dart'
    as _i63;
import '../../packages/wrappers/wrapper_path_provider/lib/src/path_provider_wrapper.dart'
    as _i68;
import '../../packages/wrappers/wrapper_remote_config/lib/src/di/remote_config_module.dart'
    as _i115;
import '../../packages/wrappers/wrapper_remote_config/lib/src/firebase/firebase_remote_config_provider.dart'
    as _i72;
import '../../packages/wrappers/wrapper_remote_config/lib/src/web/web_remote_config_provider.dart'
    as _i73;
import '../../packages/wrappers/wrapper_remote_config/lib/wrapper_remote_config.dart'
    as _i71;
import '../../packages/wrappers/wrapper_shared_preferences/lib/src/di/shared_preferences_module.dart'
    as _i116;
import '../../packages/wrappers/wrapper_shared_preferences/lib/src/shared_preferences_provider.dart'
    as _i78;
import '../../packages/wrappers/wrapper_shared_preferences/lib/wrapper_shared_preferences.dart'
    as _i48;
import '../../packages/wrappers/wrapper_system_chrome/lib/src/system_chrome_provider.dart'
    as _i89;
import '../../packages/wrappers/wrapper_twitter/lib/src/di/twitter_module.dart'
    as _i118;
import '../../packages/wrappers/wrapper_twitter/lib/src/twitter_provider.dart'
    as _i91;
import '../../packages/wrappers/wrapper_twitter/lib/wrapper_twitter.dart'
    as _i62;
import '../../packages/wrappers/wrapper_url_launcher/lib/src/url_launcher_provider.dart'
    as _i92;
import '../../packages/wrappers/wrapper_url_launcher/lib/wrapper_url_launcher.dart'
    as _i6;
import '../../packages/wrappers/wrapper_web_socket/lib/src/di/web_socket_module.dart'
    as _i117;
import '../../packages/wrappers/wrapper_web_socket/lib/src/web_socket_factory.dart'
    as _i94;
import '../../packages/wrappers/wrapper_web_socket/lib/src/web_socket_provider.dart'
    as _i95;
import '../../packages/wrappers/wrapper_web_socket/lib/wrapper_web_socket.dart'
    as _i80;
import 'modules/flutter_module.dart' as _i107;

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
  final fileManagerModule = _$FileManagerModule();
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
  await gh.lazySingletonAsync<_i12.Box<_i13.DbYugiohCard>>(
      () => storageModule.provideYugiohCardBox(),
      preResolve: true);
  gh.lazySingleton<_i14.CacheCardImagesUseCase>(
      () => _i14.CacheCardImagesUseCaseImpl(get<_i10.DataManager>()));
  gh.lazySingleton<_i15.CanCardAttackZoneUseCase>(
      () => _i15.CanCardAttackZoneUseCase());
  gh.lazySingleton<_i16.ClipboardProvider>(() => _i16.ClipboardProviderImpl());
  gh.lazySingleton<_i17.CodegenLoader>(
      () => localizationModule.provideCodegenLoader);
  gh.lazySingleton<_i18.Connectivity>(
      () => connectivityModule.provideConnectivity());
  gh.singleton<_i19.ConnectivityProvider>(
      _i19.ConnectivityProviderImpl(get<_i18.Connectivity>()));
  gh.lazySingleton<_i20.CrashlyticsProvider>(
      () => _i21.WebCrashlyticsProvider(),
      registerFor: {_web});
  gh.lazySingleton<_i22.CreatePlayCardDialogActionsUseCase>(
      () => _i22.CreatePlayCardDialogActionsUseCase());
  gh.lazySingleton<_i23.CreatePlayCardUseCase>(() => _i23.CreatePlayCardUseCase(
      get<_i10.DataManager>(), get<_i24.EnumHelper>()));
  gh.lazySingleton<_i25.CreatePlayerStateUseCase>(() =>
      _i25.CreatePlayerStateUseCase(
          get<_i10.DataManager>(), get<_i23.CreatePlayCardUseCase>()));
  gh.lazySingleton<_i26.DataManager>(() => _i26.DataManagerImpl(
      get<_i10.NewsDataManager>(),
      get<_i10.YugiohCardsDataManager>(),
      get<_i10.DeckDataManager>(),
      get<_i10.DuelDataManager>(),
      get<_i10.SettingsDataManager>(),
      get<_i10.CardImageDataManager>()));
  gh.lazySingleton<_i27.DateFormatter>(() => _i27.DateFormatter());
  gh.lazySingleton<_i28.DateTimeProvider>(() => _i28.DateTimeProviderImpl());
  gh.factoryParam<_i29.DeckBuilderViewModel, _i10.PreBuiltDeck?, dynamic>(
      (_preBuiltDeck, _) => _i29.DeckBuilderViewModel(
          _preBuiltDeck,
          get<_i5.AppRouter>(),
          get<_i10.DataManager>(),
          get<_i30.StringProvider>(),
          get<_i31.Logger>()));
  gh.lazySingleton<_i32.DeckDataManager>(
      () => _i32.DeckDataManagerImpl(get<_i33.CloudDatabaseProvider>()));
  gh.factory<_i34.DeckViewModel>(() => _i34.DeckViewModel(
      get<_i5.AppRouter>(),
      get<_i10.DataManager>(),
      get<_i35.SnackBarService>(),
      get<_i30.StringProvider>(),
      get<_i31.Logger>()));
  gh.lazySingleton<_i36.DelayProvider>(() => _i36.DelayProviderImpl());
  gh.lazySingleton<_i37.DialogService>(
      () => _i37.DialogServiceImpl(get<_i5.AutoRouteRouter>()));
  gh.lazySingleton<_i38.Dio>(
      () => fileManagerModule.provideFileManagerDio(get<_i4.AppConfig>(),
          get<_i4.DioPluginProvider>(), get<_i31.Logger>()),
      instanceName: 'FileManagerDio');
  gh.lazySingleton<_i38.Dio>(
      () => ygoProDeckModule.provideYgoProDeckDio(get<_i4.AppConfig>(),
          get<_i4.DioPluginProvider>(), get<_i31.Logger>()),
      instanceName: 'YgoProDeckDio');
  gh.lazySingleton<_i39.DioPluginProvider>(() => _i39.DioPluginProviderImpl());
  gh.lazySingleton<_i40.DoesCardFitInZoneUseCase>(
      () => _i40.DoesCardFitInZoneUseCase());
  gh.lazySingleton<_i41.DuelDataManager>(() => _i41.DuelDataManagerImpl(
      get<_i4.AppConfig>(), get<_i13.DuelStorageProvider>()));
  gh.lazySingleton<_i42.DuelDialogProvider>(() => _i42.DuelDialogProvider());
  gh.lazySingleton<_i43.DuelFormValidators>(
      () => _i43.DuelFormValidators(get<_i30.StringProvider>()));
  gh.factoryParam<_i44.DuelRoomViewModel, _i10.PreBuiltDeck?, dynamic>(
      (_preBuiltDeck, _) => _i44.DuelRoomViewModel(
          _preBuiltDeck,
          get<_i5.AppRouter>(),
          get<_i45.SmartDuelServer>(),
          get<_i10.DataManager>(),
          get<_i35.SnackBarService>(),
          get<_i46.ClipboardProvider>(),
          get<_i31.Logger>()));
  gh.lazySingleton<_i47.DuelStorageProvider>(() =>
      _i47.DuelStorageProviderImpl(get<_i48.SharedPreferencesProvider>()));
  gh.factory<_i49.DuelViewModel>(() => _i49.DuelViewModel(
      get<_i43.DuelFormValidators>(),
      get<_i5.AppRouter>(),
      get<_i10.DataManager>(),
      get<_i31.Logger>()));
  gh.lazySingleton<_i50.EnumHelper>(() => _i50.EnumHelperImpl());
  gh.lazySingleton<_i51.FileManager>(() =>
      _i51.FileManagerImpl(get<_i38.Dio>(instanceName: 'FileManagerDio')));
  gh.lazySingleton<_i52.FirebaseCrashlytics>(
      () => crashlyticsModule.provideFirebaseCrashlytics());
  gh.lazySingleton<_i53.FirebaseFirestore>(
      () => cloudDatabaseModule.provideFirebaseFirestore());
  gh.lazySingleton<_i54.GetHomeTabsUseCase>(() => _i54.GetHomeTabsUseCase());
  gh.factory<_i55.HomeViewModel>(() => _i55.HomeViewModel(get<_i5.AppRouter>(),
      get<_i54.GetHomeTabsUseCase>(), get<_i31.Logger>()));
  gh.lazySingleton<_i56.HtmlUnescapeProvider>(
      () => _i56.HtmlUnescapeProviderImpl());
  gh.lazySingleton<_i57.Logger>(() =>
      _i58.LoggerImpl(get<_i59.CrashlyticsProvider>(), get<_i4.AppConfig>()));
  gh.lazySingleton<_i60.MoveCardUseCase>(() => _i60.MoveCardUseCase());
  gh.lazySingleton<_i61.NewsDataManager>(() => _i61.NewsDataManagerImpl(
      get<_i4.AppConfig>(),
      get<_i62.TwitterProvider>(),
      get<_i63.HtmlUnescapeProvider>()));
  gh.factory<_i64.NewsViewModel>(() => _i64.NewsViewModel(get<_i5.AppRouter>(),
      get<_i10.DataManager>(), get<_i65.DateFormatter>(), get<_i31.Logger>()));
  gh.factory<_i66.OnboardingViewModel>(() => _i66.OnboardingViewModel(
      get<_i5.AppRouter>(),
      get<_i10.DataManager>(),
      get<_i10.AreAllCardImagesCachedUseCase>(),
      get<_i10.CacheCardImagesUseCase>(),
      get<_i30.StringProvider>(),
      get<_i67.ConnectivityProvider>(),
      get<_i31.Logger>()));
  gh.lazySingleton<_i68.PathProviderWrapper>(
      () => _i68.PathProviderWrapperImpl());
  gh.factory<_i69.PrivacyPolicyViewModel>(() => _i69.PrivacyPolicyViewModel(
      get<_i11.AssetBundle>(), get<_i5.AppRouter>(), get<_i31.Logger>()));
  gh.lazySingleton<_i70.RemoteConfig>(
      () => remoteConfigModule.provideRemoteConfig());
  gh.lazySingleton<_i71.RemoteConfigProvider>(
      () => _i72.FirebaseRemoteConfigProvider(get<_i70.RemoteConfig>()),
      registerFor: {_mobile});
  gh.lazySingleton<_i71.RemoteConfigProvider>(
      () => _i73.WebRemoteConfigProvider(),
      registerFor: {_web});
  gh.factory<_i74.SelectDeckDialogViewModel>(() =>
      _i74.SelectDeckDialogViewModel(
          get<_i5.AppRouter>(),
          get<_i10.DataManager>(),
          get<_i5.DialogService>(),
          get<_i31.Logger>()));
  gh.lazySingleton<_i75.SettingsDataManager>(
      () => _i75.SettingsDataManagerImpl(get<_i13.SettingsStorageProvider>()));
  gh.lazySingleton<_i76.SettingsStorageProvider>(() =>
      _i76.SettingsStorageProviderImpl(get<_i48.SharedPreferencesProvider>()));
  await gh.lazySingletonAsync<_i77.SharedPreferences>(
      () => sharedPreferencesModule.provideSharedPreferences(),
      preResolve: true);
  gh.lazySingleton<_i78.SharedPreferencesProvider>(
      () => _i78.SharedPreferencesProviderImpl(get<_i77.SharedPreferences>()));
  gh.lazySingleton<_i79.SmartDuelServer>(() => _i79.SmartDuelServerImpl(
      get<_i80.WebSocketFactory>(), get<_i31.Logger>()));
  gh.lazySingleton<_i81.SnackBarService>(() => _i81.SnackBarServiceImpl());
  gh.factory<_i82.Socket>(
      () => socketIoModule.provideSocket(get<_i10.DataManager>()));
  gh.lazySingleton<_i83.SpeedDuelDialogProvider>(
      () => _i83.SpeedDuelDialogProvider());
  gh.lazySingleton<_i84.SpeedDuelEventAnimationHandler>(
      () => _i84.SpeedDuelEventAnimationHandler(
          get<_i4.DelayProvider>(), get<_i31.Logger>()),
      dispose: (i) => i.dispose());
  gh.lazySingleton<_i85.SpeedDuelEventEmitter>(() => _i85.SpeedDuelEventEmitter(
      get<_i45.SmartDuelServer>(), get<_i24.EnumHelper>(), get<_i31.Logger>()));
  gh.factoryParam<_i86.SpeedDuelViewModel, _i45.DuelRoom?, dynamic>(
      (_duelRoom, _) => _i86.SpeedDuelViewModel(
          _duelRoom,
          get<_i5.AppRouter>(),
          get<_i45.SmartDuelServer>(),
          get<_i25.CreatePlayerStateUseCase>(),
          get<_i23.CreatePlayCardUseCase>(),
          get<_i40.DoesCardFitInZoneUseCase>(),
          get<_i15.CanCardAttackZoneUseCase>(),
          get<_i60.MoveCardUseCase>(),
          get<_i85.SpeedDuelEventEmitter>(),
          get<_i84.SpeedDuelEventAnimationHandler>(),
          get<_i10.DataManager>(),
          get<_i59.CrashlyticsProvider>(),
          get<_i35.SnackBarService>(),
          get<_i87.DisplayConfigService>(),
          get<_i31.Logger>()));
  gh.lazySingleton<_i88.StringProvider>(() => _i88.StringProviderImpl());
  gh.lazySingleton<_i89.SystemChromeProvider>(
      () => _i89.SystemChromeProviderImpl());
  gh.lazySingleton<_i90.TwitterApi>(
      () => twitterModule.provideTwitterApi(get<_i4.AppConfig>()));
  gh.lazySingleton<_i91.TwitterProvider>(
      () => _i91.TwitterProviderImpl(get<_i90.TwitterApi>()));
  gh.lazySingleton<_i92.UrlLauncherProvider>(
      () => _i92.UrlLauncherProviderImpl());
  gh.factory<_i93.UserSettingsViewModel>(() => _i93.UserSettingsViewModel(
      get<_i10.DataManager>(),
      get<_i35.SnackBarService>(),
      get<_i30.StringProvider>(),
      get<_i57.Logger>()));
  gh.lazySingleton<_i94.WebSocketFactory>(() => _i94.WebSocketFactoryImpl());
  gh.factory<_i95.WebSocketProvider>(
      () => _i95.WebSocketProviderImpl(get<_i82.Socket>(), get<_i31.Logger>()));
  gh.lazySingleton<_i96.YgoProDeckRestClient>(() =>
      _i96.YgoProDeckRestClient(get<_i38.Dio>(instanceName: 'YgoProDeckDio')));
  gh.factoryParam<_i97.YugiohCardDetailViewModel, _i10.CardCopy?, String?>(
      (_cardCopy, _tag) =>
          _i97.YugiohCardDetailViewModel(_cardCopy, _tag, get<_i31.Logger>()));
  gh.lazySingleton<_i98.YugiohCardsDataManager>(() =>
      _i98.YugiohCardsDataManagerImpl(
          get<_i99.YgoProDeckApiProvider>(),
          get<_i13.YugiohCardsStorageProvider>(),
          get<_i24.EnumHelper>(),
          get<_i31.Logger>()));
  gh.lazySingleton<_i100.YugiohCardsStorageProvider>(() =>
      _i100.YugiohCardsStorageProviderImpl(
          get<_i12.Box<_i13.DbYugiohCard>>(),
          get<_i48.SharedPreferencesProvider>(),
          get<_i71.RemoteConfigProvider>(),
          get<_i4.DateTimeProvider>(),
          get<_i31.Logger>()));
  gh.lazySingleton<_i101.CardImageDataManager>(() =>
      _i101.CardImageDataManagerImpl(
          get<_i51.FileManager>(), get<_i68.PathProviderWrapper>()));
  gh.lazySingleton<_i102.CloudDatabaseProvider>(
      () => _i103.FirebaseCloudDatabaseProvider(get<_i53.FirebaseFirestore>()));
  gh.lazySingleton<_i20.CrashlyticsProvider>(
      () => _i104.FirebaseCrashlyticsProvider(get<_i52.FirebaseCrashlytics>()),
      registerFor: {_mobile});
  gh.lazySingleton<_i105.DisplayConfigService>(
      () => _i105.DisplayConfigServiceImpl(get<_i89.SystemChromeProvider>()));
  gh.lazySingleton<_i106.YgoProDeckApiProvider>(() =>
      _i106.YgoProDeckApiProviderImpl(
          get<_i96.YgoProDeckRestClient>(), get<_i31.Logger>()));
  return get;
}

class _$FlutterModule extends _i107.FlutterModule {}

class _$StorageModule extends _i108.StorageModule {}

class _$LocalizationModule extends _i109.LocalizationModule {}

class _$ConnectivityModule extends _i110.ConnectivityModule {}

class _$FileManagerModule extends _i111.FileManagerModule {}

class _$YgoProDeckModule extends _i112.YgoProDeckModule {}

class _$CrashlyticsModule extends _i113.CrashlyticsModule {}

class _$CloudDatabaseModule extends _i114.CloudDatabaseModule {}

class _$RemoteConfigModule extends _i115.RemoteConfigModule {}

class _$SharedPreferencesModule extends _i116.SharedPreferencesModule {}

class _$SocketIoModule extends _i117.SocketIoModule {}

class _$TwitterModule extends _i118.TwitterModule {}
