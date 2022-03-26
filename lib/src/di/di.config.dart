// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:audioplayers/audioplayers.dart' as _i12;
import 'package:cloud_firestore/cloud_firestore.dart' as _i66;
import 'package:connectivity_plus/connectivity_plus.dart' as _i28;
import 'package:dart_twitter_api/twitter_api.dart' as _i107;
import 'package:dio/dio.dart' as _i46;
import 'package:file_picker/file_picker.dart' as _i62;
import 'package:firebase_auth/firebase_auth.dart' as _i64;
import 'package:firebase_crashlytics/firebase_crashlytics.dart' as _i65;
import 'package:firebase_remote_config/firebase_remote_config.dart' as _i85;
import 'package:flutter/services.dart' as _i11;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive/hive.dart' as _i22;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i92;
import 'package:socket_io_client/socket_io_client.dart' as _i97;
import 'package:universal_io/io.dart' as _i48;

import '../../generated/codegen_loader.g.dart' as _i27;
import '../../packages/core/audio/audio.dart' as _i101;
import '../../packages/core/audio/src/audio_service.dart' as _i14;
import '../../packages/core/authentication/authentication.dart' as _i17;
import '../../packages/core/authentication/src/authentication_service.dart'
    as _i18;
import '../../packages/core/core_config/lib/core_config.dart' as _i4;
import '../../packages/core/core_config/lib/src/providers/date_time_provider.dart'
    as _i38;
import '../../packages/core/core_config/lib/src/providers/delay_provider.dart'
    as _i44;
import '../../packages/core/core_config/lib/src/providers/dio_plugin_provider/dio_plugin_provider.dart'
    as _i47;
import '../../packages/core/core_data_manager/lib/core_data_manager_interface.dart'
    as _i10;
import '../../packages/core/core_data_manager/lib/src/card_images/card_image_data_manager.dart'
    as _i120;
import '../../packages/core/core_data_manager/lib/src/card_images/usecases/are_all_card_images_cached_use_case.dart'
    as _i9;
import '../../packages/core/core_data_manager/lib/src/card_images/usecases/cache_card_images_use_case.dart'
    as _i24;
import '../../packages/core/core_data_manager/lib/src/data_manager.dart'
    as _i36;
import '../../packages/core/core_data_manager/lib/src/deck/deck_data_manager.dart'
    as _i42;
import '../../packages/core/core_data_manager/lib/src/duel/duel_data_manager.dart'
    as _i50;
import '../../packages/core/core_data_manager/lib/src/news/news_data_manager.dart'
    as _i76;
import '../../packages/core/core_data_manager/lib/src/settings/settings_data_manager.dart'
    as _i90;
import '../../packages/core/core_data_manager/lib/src/yugioh_cards/yugioh_cards_data_manager.dart'
    as _i115;
import '../../packages/core/core_display_config/lib/core_display_config.dart'
    as _i104;
import '../../packages/core/core_display_config/lib/src/display_config_service.dart'
    as _i125;
import '../../packages/core/core_file_manager/lib/core_file_manager.dart'
    as _i68;
import '../../packages/core/core_file_manager/lib/src/file_manager.dart'
    as _i60;
import '../../packages/core/core_general/lib/core_general.dart' as _i80;
import '../../packages/core/core_general/lib/src/formatters/date_formatter.dart'
    as _i37;
import '../../packages/core/core_localization/lib/core_localization.dart'
    as _i40;
import '../../packages/core/core_localization/lib/src/di/localization_module.dart'
    as _i132;
import '../../packages/core/core_localization/lib/src/string_provider.dart'
    as _i105;
import '../../packages/core/core_logger/lib/core_logger.dart' as _i20;
import '../../packages/core/core_logger/lib/src/logger.dart' as _i72;
import '../../packages/core/core_logger/lib/src/logger_impl.dart' as _i73;
import '../../packages/core/core_messaging/lib/core_messaging.dart' as _i41;
import '../../packages/core/core_messaging/lib/src/snack_bar/snack_bar_service.dart'
    as _i96;
import '../../packages/core/core_navigation/lib/core_navigation.dart' as _i5;
import '../../packages/core/core_navigation/lib/src/app_router.dart' as _i3;
import '../../packages/core/core_navigation/lib/src/auto_route_router.gr.dart'
    as _i21;
import '../../packages/core/core_navigation/lib/src/di/navigation_module.dart'
    as _i130;
import '../../packages/core/core_navigation/lib/src/dialogs/dialog_service.dart'
    as _i45;
import '../../packages/core/core_navigation/lib/src/guards/auth_guard.dart'
    as _i16;
import '../../packages/core/core_smart_duel_server/lib/core_smart_duel_server.dart'
    as _i54;
import '../../packages/core/core_smart_duel_server/lib/src/smart_duel_server.dart'
    as _i94;
import '../../packages/core/core_storage/lib/core_storage.dart' as _i23;
import '../../packages/core/core_storage/lib/src/di/storage_module.dart'
    as _i131;
import '../../packages/core/core_storage/lib/src/duel/duel_storage_provider.dart'
    as _i56;
import '../../packages/core/core_storage/lib/src/settings/settings_storage_provider.dart'
    as _i91;
import '../../packages/core/core_storage/lib/src/yugioh_cards/yugioh_cards_storage_provider.dart'
    as _i117;
import '../../packages/core/core_ygoprodeck/lib/core_ygoprodeck.dart' as _i116;
import '../../packages/core/core_ygoprodeck/lib/src/api/ygoprodeck_api.dart'
    as _i113;
import '../../packages/core/core_ygoprodeck/lib/src/di/ygoprodeck_module.dart'
    as _i134;
import '../../packages/core/core_ygoprodeck/lib/src/ygoprodeck_api_provider.dart'
    as _i127;
import '../../packages/features/feature_deck_builder/lib/src/deck_builder/deck_builder_viewmodel.dart'
    as _i39;
import '../../packages/features/feature_duel_room/lib/src/duel_room_viewmodel.dart'
    as _i53;
import '../../packages/features/feature_home/lib/feature_home.dart' as _i7;
import '../../packages/features/feature_home/lib/src/deck/deck_viewmodel.dart'
    as _i124;
import '../../packages/features/feature_home/lib/src/deck/usecases/get_card_ids_from_deck_file_use_case.dart'
    as _i67;
import '../../packages/features/feature_home/lib/src/duel/dialogs/duel_dialog_provider.dart'
    as _i51;
import '../../packages/features/feature_home/lib/src/duel/dialogs/select_deck/select_deck_dialog_viewmodel.dart'
    as _i89;
import '../../packages/features/feature_home/lib/src/duel/duel_viewmodel.dart'
    as _i58;
import '../../packages/features/feature_home/lib/src/duel/mixins/duel_form_validators.dart'
    as _i52;
import '../../packages/features/feature_home/lib/src/home/home_viewmodel.dart'
    as _i70;
import '../../packages/features/feature_home/lib/src/home/usecases/get_home_tabs_use_case.dart'
    as _i69;
import '../../packages/features/feature_home/lib/src/news/news_viewmodel.dart'
    as _i79;
import '../../packages/features/feature_onboarding/lib/src/onboarding/onboarding_viewmodel.dart'
    as _i81;
import '../../packages/features/feature_privacy_policy/lib/src/privacy_policy_viewmodel.dart'
    as _i83;
import '../../packages/features/feature_speed_duel/lib/feature_speed_duel.dart'
    as _i8;
import '../../packages/features/feature_speed_duel/lib/src/dialogs/play_card_dialog/usecases/create_play_card_dialog_actions_use_case.dart'
    as _i32;
import '../../packages/features/feature_speed_duel/lib/src/dialogs/speed_duel_dialog_provider.dart'
    as _i98;
import '../../packages/features/feature_speed_duel/lib/src/helpers/speed_duel_event_animation_handler.dart'
    as _i99;
import '../../packages/features/feature_speed_duel/lib/src/helpers/speed_duel_event_audio_handler.dart'
    as _i100;
import '../../packages/features/feature_speed_duel/lib/src/helpers/speed_duel_event_emitter.dart'
    as _i102;
import '../../packages/features/feature_speed_duel/lib/src/speed_duel_viewmodel.dart'
    as _i103;
import '../../packages/features/feature_speed_duel/lib/src/usecases/can_card_attack_zone_use_case.dart'
    as _i25;
import '../../packages/features/feature_speed_duel/lib/src/usecases/create_play_card_use_case.dart'
    as _i33;
import '../../packages/features/feature_speed_duel/lib/src/usecases/create_player_state_use_case.dart'
    as _i35;
import '../../packages/features/feature_speed_duel/lib/src/usecases/does_card_fit_in_zone_use_case.dart'
    as _i49;
import '../../packages/features/feature_speed_duel/lib/src/usecases/move_card_use_case.dart'
    as _i75;
import '../../packages/features/feature_user_settings/lib/src/game_settings/game_settings_viewmodel.dart'
    as _i126;
import '../../packages/features/feature_user_settings/lib/src/user_settings_viewmodel.dart'
    as _i110;
import '../../packages/features/feature_yugioh_card_detail/lib/src/yugioh_card_detail_viewmodel.dart'
    as _i114;
import '../../packages/features/profile/src/profile_viewmodel.dart' as _i84;
import '../../packages/wrappers/audio_player/audio_player.dart' as _i15;
import '../../packages/wrappers/audio_player/src/audio_player_provider.dart'
    as _i13;
import '../../packages/wrappers/audio_player/src/di/audio_player_module.dart'
    as _i129;
import '../../packages/wrappers/file_picker/file_picker.dart' as _i61;
import '../../packages/wrappers/file_picker/src/di/file_picker_module.dart'
    as _i136;
import '../../packages/wrappers/file_picker/src/file_picker_provider.dart'
    as _i63;
import '../../packages/wrappers/wrapper_auth/src/auth_provider.dart' as _i118;
import '../../packages/wrappers/wrapper_auth/src/di/auth_module.dart' as _i137;
import '../../packages/wrappers/wrapper_auth/src/firebase/firebase_auth_provider.dart'
    as _i119;
import '../../packages/wrappers/wrapper_auth/wrapper_auth.dart' as _i19;
import '../../packages/wrappers/wrapper_clipboard/lib/src/clipboard_provider.dart'
    as _i26;
import '../../packages/wrappers/wrapper_clipboard/lib/wrapper_clipboard.dart'
    as _i55;
import '../../packages/wrappers/wrapper_cloud_database/lib/src/cloud_database_provider.dart'
    as _i121;
import '../../packages/wrappers/wrapper_cloud_database/lib/src/di/cloud_database_module.dart'
    as _i139;
import '../../packages/wrappers/wrapper_cloud_database/lib/src/firebase/firebase_cloud_database_provider.dart'
    as _i122;
import '../../packages/wrappers/wrapper_cloud_database/lib/wrapper_cloud_database.dart'
    as _i43;
import '../../packages/wrappers/wrapper_connectivity/lib/src/connectivity_provider.dart'
    as _i29;
import '../../packages/wrappers/wrapper_connectivity/lib/src/di/connectivity_module.dart'
    as _i133;
import '../../packages/wrappers/wrapper_connectivity/lib/wrapper_connectivity.dart'
    as _i82;
import '../../packages/wrappers/wrapper_crashlytics/lib/src/crashlytics_provider.dart'
    as _i30;
import '../../packages/wrappers/wrapper_crashlytics/lib/src/di/crashlytics_module.dart'
    as _i138;
import '../../packages/wrappers/wrapper_crashlytics/lib/src/firebase/firebase_crashlytics_provider.dart'
    as _i123;
import '../../packages/wrappers/wrapper_crashlytics/lib/src/web/web_crashlytics_provider.dart'
    as _i31;
import '../../packages/wrappers/wrapper_crashlytics/lib/wrapper_crashlytics.dart'
    as _i74;
import '../../packages/wrappers/wrapper_enum_helper/lib/src/enum_helper.dart'
    as _i59;
import '../../packages/wrappers/wrapper_enum_helper/lib/wrapper_enum_helper.dart'
    as _i34;
import '../../packages/wrappers/wrapper_html_unescape/lib/src/html_unescape_provider.dart'
    as _i71;
import '../../packages/wrappers/wrapper_html_unescape/lib/wrapper_html_unescape.dart'
    as _i78;
import '../../packages/wrappers/wrapper_path_provider/lib/src/di/path_provider_module.dart'
    as _i135;
import '../../packages/wrappers/wrapper_remote_config/lib/src/di/remote_config_module.dart'
    as _i140;
import '../../packages/wrappers/wrapper_remote_config/lib/src/firebase/firebase_remote_config_provider.dart'
    as _i87;
import '../../packages/wrappers/wrapper_remote_config/lib/src/web/web_remote_config_provider.dart'
    as _i88;
import '../../packages/wrappers/wrapper_remote_config/lib/wrapper_remote_config.dart'
    as _i86;
import '../../packages/wrappers/wrapper_shared_preferences/lib/src/di/shared_preferences_module.dart'
    as _i141;
import '../../packages/wrappers/wrapper_shared_preferences/lib/src/shared_preferences_provider.dart'
    as _i93;
import '../../packages/wrappers/wrapper_shared_preferences/lib/wrapper_shared_preferences.dart'
    as _i57;
import '../../packages/wrappers/wrapper_system_chrome/lib/src/system_chrome_provider.dart'
    as _i106;
import '../../packages/wrappers/wrapper_twitter/lib/src/di/twitter_module.dart'
    as _i143;
import '../../packages/wrappers/wrapper_twitter/lib/src/twitter_provider.dart'
    as _i108;
import '../../packages/wrappers/wrapper_twitter/lib/wrapper_twitter.dart'
    as _i77;
import '../../packages/wrappers/wrapper_url_launcher/lib/src/url_launcher_provider.dart'
    as _i109;
import '../../packages/wrappers/wrapper_url_launcher/lib/wrapper_url_launcher.dart'
    as _i6;
import '../../packages/wrappers/wrapper_web_socket/lib/src/di/web_socket_module.dart'
    as _i142;
import '../../packages/wrappers/wrapper_web_socket/lib/src/web_socket_factory.dart'
    as _i111;
import '../../packages/wrappers/wrapper_web_socket/lib/src/web_socket_provider.dart'
    as _i112;
import '../../packages/wrappers/wrapper_web_socket/lib/wrapper_web_socket.dart'
    as _i95;
import 'modules/flutter_module.dart' as _i128;

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
  final navigationModule = _$NavigationModule();
  final storageModule = _$StorageModule();
  final localizationModule = _$LocalizationModule();
  final connectivityModule = _$ConnectivityModule();
  final ygoProDeckModule = _$YgoProDeckModule();
  final pathProviderModule = _$PathProviderModule();
  final filePickerModule = _$FilePickerModule();
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
  gh.lazySingleton<_i14.AudioService>(() => _i14.AudioServiceImpl(
      get<_i15.AudioPlayerProvider>(), get<_i10.DataManager>()));
  gh.lazySingleton<_i16.AuthGuard>(
      () => _i16.AuthGuard(get<_i17.AuthenticationService>()));
  gh.lazySingleton<_i18.AuthenticationService>(
      () => _i18.AuthenticationServiceImpl(
          get<_i19.AuthProvider>(), get<_i20.Logger>()),
      dispose: (i) => i.dispose());
  gh.lazySingleton<_i21.AutoRouteRouter>(
      () => navigationModule.provideAutoRouteRouter(get<_i16.AuthGuard>()));
  await gh.lazySingletonAsync<_i22.Box<_i23.DbYugiohCard>>(
      () => storageModule.provideYugiohCardBox(),
      preResolve: true);
  gh.lazySingleton<_i24.CacheCardImagesUseCase>(
      () => _i24.CacheCardImagesUseCaseImpl(get<_i10.DataManager>()));
  gh.lazySingleton<_i25.CanCardAttackZoneUseCase>(
      () => _i25.CanCardAttackZoneUseCase());
  gh.lazySingleton<_i26.ClipboardProvider>(() => _i26.ClipboardProviderImpl());
  gh.lazySingleton<_i27.CodegenLoader>(
      () => localizationModule.provideCodegenLoader);
  gh.lazySingleton<_i28.Connectivity>(
      () => connectivityModule.provideConnectivity());
  gh.singleton<_i29.ConnectivityProvider>(
      _i29.ConnectivityProviderImpl(get<_i28.Connectivity>()));
  gh.lazySingleton<_i30.CrashlyticsProvider>(
      () => _i31.WebCrashlyticsProvider(),
      registerFor: {_web});
  gh.lazySingleton<_i32.CreatePlayCardDialogActionsUseCase>(
      () => _i32.CreatePlayCardDialogActionsUseCase());
  gh.lazySingleton<_i33.CreatePlayCardUseCase>(() => _i33.CreatePlayCardUseCase(
      get<_i10.DataManager>(), get<_i34.EnumHelper>()));
  gh.lazySingleton<_i35.CreatePlayerStateUseCase>(() =>
      _i35.CreatePlayerStateUseCase(
          get<_i10.DataManager>(), get<_i33.CreatePlayCardUseCase>()));
  gh.lazySingleton<_i36.DataManager>(() => _i36.DataManagerImpl(
      get<_i10.NewsDataManager>(),
      get<_i10.YugiohCardsDataManager>(),
      get<_i10.DeckDataManager>(),
      get<_i10.DuelDataManager>(),
      get<_i10.SettingsDataManager>(),
      get<_i10.CardImageDataManager>()));
  gh.lazySingleton<_i37.DateFormatter>(() => _i37.DateFormatter());
  gh.lazySingleton<_i38.DateTimeProvider>(() => _i38.DateTimeProviderImpl());
  gh.factoryParam<_i39.DeckBuilderViewModel, _i10.PreBuiltDeck?,
          _i10.UserDeck?>(
      (_preBuiltDeck, _userDeck) => _i39.DeckBuilderViewModel(
          get<_i20.Logger>(),
          _preBuiltDeck,
          _userDeck,
          get<_i5.AppRouter>(),
          get<_i10.DataManager>(),
          get<_i40.StringProvider>(),
          get<_i5.DialogService>(),
          get<_i41.SnackBarService>()));
  gh.lazySingleton<_i42.DeckDataManager>(() => _i42.DeckDataManagerImpl(
      get<_i17.AuthenticationService>(), get<_i43.CloudDatabaseProvider>()));
  gh.lazySingleton<_i44.DelayProvider>(() => _i44.DelayProviderImpl());
  gh.lazySingleton<_i45.DialogService>(
      () => _i45.DialogServiceImpl(get<_i5.AutoRouteRouter>()));
  gh.lazySingleton<_i46.Dio>(
      () => ygoProDeckModule.provideYgoProDeckDio(get<_i4.AppConfig>(),
          get<_i4.DioPluginProvider>(), get<_i20.Logger>()),
      instanceName: 'YgoProDeckDio');
  gh.lazySingleton<_i47.DioPluginProvider>(() => _i47.DioPluginProviderImpl());
  await gh.lazySingletonAsync<_i48.Directory>(
      () => pathProviderModule.provideMobileTempDirectory(),
      instanceName: 'TempDirectoryName',
      registerFor: {_mobile},
      preResolve: true);
  await gh.lazySingletonAsync<_i48.Directory>(
      () => pathProviderModule.provideWebTempDirectory(),
      instanceName: 'TempDirectoryName',
      registerFor: {_web},
      preResolve: true);
  await gh.lazySingletonAsync<_i48.Directory>(
      () => pathProviderModule.provideWebAppDirectory(),
      instanceName: 'AppDirectory',
      registerFor: {_web},
      preResolve: true);
  await gh.lazySingletonAsync<_i48.Directory>(
      () => pathProviderModule.provideMobileAppDirectory(),
      instanceName: 'AppDirectory',
      registerFor: {_mobile},
      preResolve: true);
  gh.lazySingleton<_i49.DoesCardFitInZoneUseCase>(
      () => _i49.DoesCardFitInZoneUseCase());
  gh.lazySingleton<_i50.DuelDataManager>(() => _i50.DuelDataManagerImpl(
      get<_i4.AppConfig>(), get<_i23.DuelStorageProvider>()));
  gh.lazySingleton<_i51.DuelDialogProvider>(() => _i51.DuelDialogProvider());
  gh.lazySingleton<_i52.DuelFormValidators>(
      () => _i52.DuelFormValidators(get<_i40.StringProvider>()));
  gh.factory<_i53.DuelRoomViewModel>(() => _i53.DuelRoomViewModel(
      get<_i20.Logger>(),
      get<_i5.AppRouter>(),
      get<_i54.SmartDuelServer>(),
      get<_i10.DataManager>(),
      get<_i41.SnackBarService>(),
      get<_i55.ClipboardProvider>(),
      get<_i40.StringProvider>()));
  gh.lazySingleton<_i56.DuelStorageProvider>(() =>
      _i56.DuelStorageProviderImpl(get<_i57.SharedPreferencesProvider>()));
  gh.factory<_i58.DuelViewModel>(() => _i58.DuelViewModel(
      get<_i52.DuelFormValidators>(),
      get<_i5.AppRouter>(),
      get<_i10.DataManager>(),
      get<_i20.Logger>()));
  gh.lazySingleton<_i59.EnumHelper>(() => _i59.EnumHelperImpl());
  gh.lazySingleton<_i60.FileManager>(
      () => _i60.FileManagerImpl(get<_i61.FilePickerProvider>()));
  gh.lazySingleton<_i62.FilePicker>(() => filePickerModule.provideFilePicker());
  gh.lazySingleton<_i63.FilePickerProvider>(
      () => _i63.FilePickerProviderImpl(get<_i62.FilePicker>()));
  gh.lazySingleton<_i64.FirebaseAuth>(() => authModule.provideFirebaseAuth());
  gh.lazySingleton<_i65.FirebaseCrashlytics>(
      () => crashlyticsModule.provideFirebaseCrashlytics());
  gh.lazySingleton<_i66.FirebaseFirestore>(
      () => cloudDatabaseModule.provideFirebaseFirestore());
  gh.lazySingleton<_i67.GetCardIdsFromDeckFileUseCase>(() =>
      _i67.GetCardIdsFromDeckFileUseCase(get<_i10.DataManager>(),
          get<_i68.FileManager>(), get<_i40.StringProvider>()));
  gh.lazySingleton<_i69.GetHomeTabsUseCase>(() => _i69.GetHomeTabsUseCase());
  gh.factory<_i70.HomeViewModel>(() => _i70.HomeViewModel(get<_i5.AppRouter>(),
      get<_i69.GetHomeTabsUseCase>(), get<_i20.Logger>()));
  gh.lazySingleton<_i71.HtmlUnescapeProvider>(
      () => _i71.HtmlUnescapeProviderImpl());
  gh.lazySingleton<_i72.Logger>(() =>
      _i73.LoggerImpl(get<_i74.CrashlyticsProvider>(), get<_i4.AppConfig>()));
  gh.lazySingleton<_i75.MoveCardUseCase>(() => _i75.MoveCardUseCase());
  gh.lazySingleton<_i76.NewsDataManager>(() => _i76.NewsDataManagerImpl(
      get<_i4.AppConfig>(),
      get<_i77.TwitterProvider>(),
      get<_i78.HtmlUnescapeProvider>()));
  gh.factory<_i79.NewsViewModel>(() => _i79.NewsViewModel(get<_i5.AppRouter>(),
      get<_i10.DataManager>(), get<_i80.DateFormatter>(), get<_i20.Logger>()));
  gh.factory<_i81.OnboardingViewModel>(() => _i81.OnboardingViewModel(
      get<_i5.AppRouter>(),
      get<_i17.AuthenticationService>(),
      get<_i10.DataManager>(),
      get<_i10.AreAllCardImagesCachedUseCase>(),
      get<_i10.CacheCardImagesUseCase>(),
      get<_i40.StringProvider>(),
      get<_i82.ConnectivityProvider>(),
      get<_i20.Logger>()));
  gh.factory<_i83.PrivacyPolicyViewModel>(() => _i83.PrivacyPolicyViewModel(
      get<_i11.AssetBundle>(), get<_i5.AppRouter>(), get<_i20.Logger>()));
  gh.factory<_i84.ProfileViewModel>(() => _i84.ProfileViewModel(
      get<_i72.Logger>(),
      get<_i17.AuthenticationService>(),
      get<_i41.SnackBarService>(),
      get<_i40.StringProvider>(),
      get<_i4.DelayProvider>()));
  gh.lazySingleton<_i85.RemoteConfig>(
      () => remoteConfigModule.provideRemoteConfig());
  gh.lazySingleton<_i86.RemoteConfigProvider>(
      () => _i87.FirebaseRemoteConfigProvider(get<_i85.RemoteConfig>()),
      registerFor: {_mobile});
  gh.lazySingleton<_i86.RemoteConfigProvider>(
      () => _i88.WebRemoteConfigProvider(),
      registerFor: {_web});
  gh.factory<_i89.SelectDeckDialogViewModel>(() =>
      _i89.SelectDeckDialogViewModel(
          get<_i5.AppRouter>(),
          get<_i10.DataManager>(),
          get<_i5.DialogService>(),
          get<_i20.Logger>()));
  gh.lazySingleton<_i90.SettingsDataManager>(
      () => _i90.SettingsDataManagerImpl(get<_i23.SettingsStorageProvider>()));
  gh.lazySingleton<_i91.SettingsStorageProvider>(() =>
      _i91.SettingsStorageProviderImpl(get<_i57.SharedPreferencesProvider>()));
  await gh.lazySingletonAsync<_i92.SharedPreferences>(
      () => sharedPreferencesModule.provideSharedPreferences(),
      preResolve: true);
  gh.lazySingleton<_i93.SharedPreferencesProvider>(
      () => _i93.SharedPreferencesProviderImpl(get<_i92.SharedPreferences>()));
  gh.lazySingleton<_i94.SmartDuelServer>(() => _i94.SmartDuelServerImpl(
      get<_i95.WebSocketFactory>(), get<_i20.Logger>()));
  gh.lazySingleton<_i96.SnackBarService>(() => _i96.SnackBarServiceImpl());
  gh.factory<_i97.Socket>(
      () => socketIoModule.provideSocket(get<_i10.DataManager>()));
  gh.lazySingleton<_i98.SpeedDuelDialogProvider>(
      () => _i98.SpeedDuelDialogProvider());
  gh.lazySingleton<_i99.SpeedDuelEventAnimationHandler>(
      () => _i99.SpeedDuelEventAnimationHandler(
          get<_i4.DelayProvider>(), get<_i20.Logger>()),
      dispose: (i) => i.dispose());
  gh.lazySingleton<_i100.SpeedDuelEventAudioHandler>(
      () => _i100.SpeedDuelEventAudioHandler(get<_i101.AudioService>()));
  gh.lazySingleton<_i102.SpeedDuelEventEmitter>(() =>
      _i102.SpeedDuelEventEmitter(get<_i54.SmartDuelServer>(),
          get<_i34.EnumHelper>(), get<_i20.Logger>()));
  gh.factoryParam<_i103.SpeedDuelViewModel, _i54.DuelRoom?, dynamic>(
      (_duelRoom, _) => _i103.SpeedDuelViewModel(
          _duelRoom,
          get<_i5.AppRouter>(),
          get<_i54.SmartDuelServer>(),
          get<_i35.CreatePlayerStateUseCase>(),
          get<_i33.CreatePlayCardUseCase>(),
          get<_i49.DoesCardFitInZoneUseCase>(),
          get<_i25.CanCardAttackZoneUseCase>(),
          get<_i75.MoveCardUseCase>(),
          get<_i102.SpeedDuelEventEmitter>(),
          get<_i99.SpeedDuelEventAnimationHandler>(),
          get<_i100.SpeedDuelEventAudioHandler>(),
          get<_i10.DataManager>(),
          get<_i74.CrashlyticsProvider>(),
          get<_i41.SnackBarService>(),
          get<_i104.DisplayConfigService>(),
          get<_i20.Logger>()));
  gh.lazySingleton<_i105.StringProvider>(() => _i105.StringProviderImpl());
  gh.lazySingleton<_i106.SystemChromeProvider>(
      () => _i106.SystemChromeProviderImpl());
  gh.lazySingleton<_i107.TwitterApi>(
      () => twitterModule.provideTwitterApi(get<_i4.AppConfig>()));
  gh.lazySingleton<_i108.TwitterProvider>(
      () => _i108.TwitterProviderImpl(get<_i107.TwitterApi>()));
  gh.lazySingleton<_i109.UrlLauncherProvider>(
      () => _i109.UrlLauncherProviderImpl());
  gh.factory<_i110.UserSettingsViewModel>(() => _i110.UserSettingsViewModel(
      get<_i5.AppRouter>(),
      get<_i17.AuthenticationService>(),
      get<_i10.DataManager>(),
      get<_i41.SnackBarService>(),
      get<_i40.StringProvider>(),
      get<_i72.Logger>()));
  gh.lazySingleton<_i111.WebSocketFactory>(() => _i111.WebSocketFactoryImpl());
  gh.factory<_i112.WebSocketProvider>(() =>
      _i112.WebSocketProviderImpl(get<_i97.Socket>(), get<_i20.Logger>()));
  gh.lazySingleton<_i113.YgoProDeckRestClient>(() =>
      _i113.YgoProDeckRestClient(get<_i46.Dio>(instanceName: 'YgoProDeckDio')));
  gh.factoryParam<_i114.YugiohCardDetailViewModel, _i10.CardCopy?, String?>(
      (_cardCopy, _tag) =>
          _i114.YugiohCardDetailViewModel(_cardCopy, _tag, get<_i20.Logger>()));
  gh.lazySingleton<_i115.YugiohCardsDataManager>(() =>
      _i115.YugiohCardsDataManagerImpl(get<_i116.YgoProDeckApiProvider>(),
          get<_i23.YugiohCardsStorageProvider>(), get<_i20.Logger>()));
  gh.lazySingleton<_i117.YugiohCardsStorageProvider>(() =>
      _i117.YugiohCardsStorageProviderImpl(
          get<_i22.Box<_i23.DbYugiohCard>>(),
          get<_i57.SharedPreferencesProvider>(),
          get<_i86.RemoteConfigProvider>(),
          get<_i4.DateTimeProvider>(),
          get<_i20.Logger>()));
  gh.lazySingleton<_i118.AuthProvider>(
      () => _i119.FirebaseAuthProvider(get<_i64.FirebaseAuth>()));
  gh.lazySingleton<_i120.CardImageDataManager>(() =>
      _i120.CardImageDataManagerImpl(get<_i60.FileManager>(),
          get<_i48.Directory>(instanceName: 'AppDirectory')));
  gh.lazySingleton<_i121.CloudDatabaseProvider>(
      () => _i122.FirebaseCloudDatabaseProvider(get<_i66.FirebaseFirestore>()));
  gh.lazySingleton<_i30.CrashlyticsProvider>(
      () => _i123.FirebaseCrashlyticsProvider(get<_i65.FirebaseCrashlytics>()),
      registerFor: {_mobile});
  gh.factory<_i124.DeckViewModel>(() => _i124.DeckViewModel(
      get<_i20.Logger>(),
      get<_i5.AppRouter>(),
      get<_i10.DataManager>(),
      get<_i41.SnackBarService>(),
      get<_i5.DialogService>(),
      get<_i40.StringProvider>(),
      get<_i67.GetCardIdsFromDeckFileUseCase>()));
  gh.lazySingleton<_i125.DisplayConfigService>(
      () => _i125.DisplayConfigServiceImpl(get<_i106.SystemChromeProvider>()));
  gh.factory<_i126.GameSettingsViewModel>(() => _i126.GameSettingsViewModel(
      get<_i72.Logger>(), get<_i10.DataManager>(), get<_i4.DelayProvider>()));
  gh.lazySingleton<_i127.YgoProDeckApiProvider>(() =>
      _i127.YgoProDeckApiProviderImpl(
          get<_i113.YgoProDeckRestClient>(), get<_i20.Logger>()));
  return get;
}

class _$FlutterModule extends _i128.FlutterModule {}

class _$AudioPlayerModule extends _i129.AudioPlayerModule {}

class _$NavigationModule extends _i130.NavigationModule {}

class _$StorageModule extends _i131.StorageModule {}

class _$LocalizationModule extends _i132.LocalizationModule {}

class _$ConnectivityModule extends _i133.ConnectivityModule {}

class _$YgoProDeckModule extends _i134.YgoProDeckModule {}

class _$PathProviderModule extends _i135.PathProviderModule {}

class _$FilePickerModule extends _i136.FilePickerModule {}

class _$AuthModule extends _i137.AuthModule {}

class _$CrashlyticsModule extends _i138.CrashlyticsModule {}

class _$CloudDatabaseModule extends _i139.CloudDatabaseModule {}

class _$RemoteConfigModule extends _i140.RemoteConfigModule {}

class _$SharedPreferencesModule extends _i141.SharedPreferencesModule {}

class _$SocketIoModule extends _i142.SocketIoModule {}

class _$TwitterModule extends _i143.TwitterModule {}
