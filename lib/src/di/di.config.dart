// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart' as _i45;
import 'package:dart_twitter_api/twitter_api.dart' as _i72;
import 'package:dio/dio.dart' as _i30;
import 'package:firebase_crashlytics/firebase_crashlytics.dart' as _i44;
import 'package:flutter/services.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i64;
import 'package:socket_io_client/socket_io_client.dart' as _i69;

import '../../packages/core/core_config/lib/core_config.dart' as _i4;
import '../../packages/core/core_config/lib/src/providers/dio_plugin_provider/dio_plugin_provider.dart'
    as _i31;
import '../../packages/core/core_data_manager/lib/core_data_manager_interface.dart'
    as _i21;
import '../../packages/core/core_data_manager/lib/src/data_manager.dart'
    as _i22;
import '../../packages/core/core_data_manager/lib/src/deck/deck_data_manager.dart'
    as _i25;
import '../../packages/core/core_data_manager/lib/src/duel/duel_data_manager.dart'
    as _i33;
import '../../packages/core/core_data_manager/lib/src/news/news_data_manager.dart'
    as _i52;
import '../../packages/core/core_data_manager/lib/src/settings/settings_data_manager.dart'
    as _i62;
import '../../packages/core/core_data_manager/lib/src/yugioh_cards/yugioh_cards_data_manager.dart'
    as _i80;
import '../../packages/core/core_general/lib/core_general.dart' as _i56;
import '../../packages/core/core_general/lib/src/formatters/date_formatter.dart'
    as _i23;
import '../../packages/core/core_logger/lib/core_logger.dart' as _i16;
import '../../packages/core/core_logger/lib/src/logger.dart' as _i48;
import '../../packages/core/core_logger/lib/src/logger_impl.dart' as _i49;
import '../../packages/core/core_messaging/lib/core_messaging.dart' as _i28;
import '../../packages/core/core_messaging/lib/src/snack_bar/snack_bar_service.dart'
    as _i68;
import '../../packages/core/core_navigation/lib/core_navigation.dart' as _i5;
import '../../packages/core/core_navigation/lib/src/app_router.dart' as _i3;
import '../../packages/core/core_navigation/lib/src/dialogs/dialog_service.dart'
    as _i29;
import '../../packages/core/core_smart_duel_server/lib/core_smart_duel_server.dart'
    as _i38;
import '../../packages/core/core_smart_duel_server/lib/src/smart_duel_server.dart'
    as _i66;
import '../../packages/core/core_storage/lib/core_storage.dart' as _i34;
import '../../packages/core/core_storage/lib/src/duel/duel_storage_provider.dart'
    as _i40;
import '../../packages/core/core_storage/lib/src/settings/settings_storage_provider.dart'
    as _i63;
import '../../packages/core/core_storage/lib/src/yugioh_cards/yugioh_cards_storage_provider.dart'
    as _i82;
import '../../packages/core/core_ygoprodeck/lib/core_ygoprodeck.dart' as _i81;
import '../../packages/core/core_ygoprodeck/lib/src/api/ygoprodeck_api.dart'
    as _i78;
import '../../packages/core/core_ygoprodeck/lib/src/di/ygoprodeck_module.dart'
    as _i88;
import '../../packages/core/core_ygoprodeck/lib/src/ygoprodeck_api_provider.dart'
    as _i86;
import '../../packages/features/feature_deck_builder/lib/src/deck_builder/deck_builder_viewmodel.dart'
    as _i24;
import '../../packages/features/feature_duel_room/lib/src/duel_room_viewmodel.dart'
    as _i37;
import '../../packages/features/feature_home/lib/feature_home.dart' as _i7;
import '../../packages/features/feature_home/lib/src/deck/deck_viewmodel.dart'
    as _i27;
import '../../packages/features/feature_home/lib/src/duel/dialogs/duel_dialog_provider.dart'
    as _i35;
import '../../packages/features/feature_home/lib/src/duel/dialogs/select_deck/select_deck_dialog_viewmodel.dart'
    as _i61;
import '../../packages/features/feature_home/lib/src/duel/duel_viewmodel.dart'
    as _i42;
import '../../packages/features/feature_home/lib/src/duel/mixins/duel_form_validators.dart'
    as _i36;
import '../../packages/features/feature_home/lib/src/home/home_viewmodel.dart'
    as _i46;
import '../../packages/features/feature_home/lib/src/news/news_viewmodel.dart'
    as _i55;
import '../../packages/features/feature_onboarding/lib/src/onboarding/onboarding_viewmodel.dart'
    as _i57;
import '../../packages/features/feature_privacy_policy/lib/src/privacy_policy_viewmodel.dart'
    as _i60;
import '../../packages/features/feature_speed_duel/lib/feature_speed_duel.dart'
    as _i8;
import '../../packages/features/feature_speed_duel/lib/src/dialogs/play_card_dialog/models/play_card_dialog_parameters.dart'
    as _i59;
import '../../packages/features/feature_speed_duel/lib/src/dialogs/play_card_dialog/play_card_dialog_viewmodel.dart'
    as _i58;
import '../../packages/features/feature_speed_duel/lib/src/dialogs/play_card_dialog/use_cases/create_play_card_dialog_actions_use_case.dart'
    as _i15;
import '../../packages/features/feature_speed_duel/lib/src/dialogs/speed_duel_dialog_provider.dart'
    as _i70;
import '../../packages/features/feature_speed_duel/lib/src/speed_duel_viewmodel.dart'
    as _i71;
import '../../packages/features/feature_speed_duel/lib/src/usecases/can_card_attack_zone_use_case.dart'
    as _i11;
import '../../packages/features/feature_speed_duel/lib/src/usecases/create_play_card_use_case.dart'
    as _i17;
import '../../packages/features/feature_speed_duel/lib/src/usecases/create_player_state_use_case.dart'
    as _i20;
import '../../packages/features/feature_speed_duel/lib/src/usecases/does_card_fit_in_zone_use_case.dart'
    as _i32;
import '../../packages/features/feature_speed_duel/lib/src/usecases/move_card_use_case.dart'
    as _i51;
import '../../packages/features/feature_user_settings/lib/src/user_settings_viewmodel.dart'
    as _i75;
import '../../packages/features/feature_yugioh_card_detail/lib/src/yugioh_card_detail_viewmodel.dart'
    as _i79;
import '../../packages/wrappers/wrapper_assets/lib/src/assets_provider.dart'
    as _i10;
import '../../packages/wrappers/wrapper_assets/lib/wrapper_assets.dart' as _i18;
import '../../packages/wrappers/wrapper_clipboard/lib/src/clipboard_provider.dart'
    as _i12;
import '../../packages/wrappers/wrapper_clipboard/lib/wrapper_clipboard.dart'
    as _i39;
import '../../packages/wrappers/wrapper_cloud_database/lib/src/cloud_database_provider.dart'
    as _i83;
import '../../packages/wrappers/wrapper_cloud_database/lib/src/di/cloud_database_module.dart'
    as _i90;
import '../../packages/wrappers/wrapper_cloud_database/lib/src/firebase/firebase_cloud_database_provider.dart'
    as _i84;
import '../../packages/wrappers/wrapper_cloud_database/lib/wrapper_cloud_database.dart'
    as _i26;
import '../../packages/wrappers/wrapper_crashlytics/lib/src/crashlytics_provider.dart'
    as _i13;
import '../../packages/wrappers/wrapper_crashlytics/lib/src/di/crashlytics_module.dart'
    as _i89;
import '../../packages/wrappers/wrapper_crashlytics/lib/src/firebase/firebase_crashlytics_provider.dart'
    as _i85;
import '../../packages/wrappers/wrapper_crashlytics/lib/src/web/web_crashlytics_provider.dart'
    as _i14;
import '../../packages/wrappers/wrapper_crashlytics/lib/wrapper_crashlytics.dart'
    as _i50;
import '../../packages/wrappers/wrapper_enum_helper/lib/src/enum_helper.dart'
    as _i43;
import '../../packages/wrappers/wrapper_enum_helper/lib/wrapper_enum_helper.dart'
    as _i19;
import '../../packages/wrappers/wrapper_html_unescape/lib/src/html_unescape_provider.dart'
    as _i47;
import '../../packages/wrappers/wrapper_html_unescape/lib/wrapper_html_unescape.dart'
    as _i54;
import '../../packages/wrappers/wrapper_shared_preferences/lib/src/di/shared_preferences_module.dart'
    as _i91;
import '../../packages/wrappers/wrapper_shared_preferences/lib/src/shared_preferences_provider.dart'
    as _i65;
import '../../packages/wrappers/wrapper_shared_preferences/lib/wrapper_shared_preferences.dart'
    as _i41;
import '../../packages/wrappers/wrapper_twitter/lib/src/di/twitter_module.dart'
    as _i93;
import '../../packages/wrappers/wrapper_twitter/lib/src/twitter_provider.dart'
    as _i73;
import '../../packages/wrappers/wrapper_twitter/lib/wrapper_twitter.dart'
    as _i53;
import '../../packages/wrappers/wrapper_url_launcher/lib/src/url_launcher_provider.dart'
    as _i74;
import '../../packages/wrappers/wrapper_url_launcher/lib/wrapper_url_launcher.dart'
    as _i6;
import '../../packages/wrappers/wrapper_web_socket/lib/src/di/web_socket_module.dart'
    as _i92;
import '../../packages/wrappers/wrapper_web_socket/lib/src/web_socket_factory.dart'
    as _i76;
import '../../packages/wrappers/wrapper_web_socket/lib/src/web_socket_provider.dart'
    as _i77;
import '../../packages/wrappers/wrapper_web_socket/lib/wrapper_web_socket.dart'
    as _i67;
import 'modules/flutter_module.dart' as _i87;

const String _web = 'web';
const String _mobile = 'mobile';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String environment, _i2.EnvironmentFilter environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final flutterModule = _$FlutterModule();
  final ygoProDeckModule = _$YgoProDeckModule();
  final crashlyticsModule = _$CrashlyticsModule();
  final cloudDatabaseModule = _$CloudDatabaseModule();
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
  gh.lazySingleton<_i10.AssetsProvider>(() => _i10.AssetsProviderImpl());
  gh.lazySingleton<_i11.CanCardAttackZoneUseCase>(
      () => _i11.CanCardAttackZoneUseCase());
  gh.lazySingleton<_i12.ClipboardProvider>(() => _i12.ClipboardProviderImpl());
  gh.lazySingleton<_i13.CrashlyticsProvider>(
      () => _i14.WebCrashlyticsProvider(),
      registerFor: {_web});
  gh.lazySingleton<_i15.CreatePlayCardDialogActionsUseCase>(
      () => _i15.CreatePlayCardDialogActionsUseCase(get<_i16.Logger>()));
  gh.lazySingleton<_i17.CreatePlayCardUseCase>(() => _i17.CreatePlayCardUseCase(
      get<_i18.AssetsProvider>(), get<_i19.EnumHelper>()));
  gh.lazySingleton<_i20.CreatePlayerStateUseCase>(() =>
      _i20.CreatePlayerStateUseCase(
          get<_i21.DataManager>(), get<_i17.CreatePlayCardUseCase>()));
  gh.lazySingleton<_i22.DataManager>(() => _i22.DataManagerImpl(
      get<_i21.NewsDataManager>(),
      get<_i21.YugiohCardsDataManager>(),
      get<_i21.DeckDataManager>(),
      get<_i21.DuelDataManager>(),
      get<_i21.SettingsDataManager>()));
  gh.lazySingleton<_i23.DateFormatter>(() => _i23.DateFormatter());
  gh.factoryParam<_i24.DeckBuilderViewModel, _i21.PreBuiltDeck, dynamic>(
      (_preBuiltDeck, _) => _i24.DeckBuilderViewModel(get<_i16.Logger>(),
          _preBuiltDeck, get<_i5.AppRouter>(), get<_i21.DataManager>()));
  gh.lazySingleton<_i25.DeckDataManager>(
      () => _i25.DeckDataManagerImpl(get<_i26.CloudDatabaseProvider>()));
  gh.factory<_i27.DeckViewModel>(() => _i27.DeckViewModel(
      get<_i16.Logger>(),
      get<_i5.AppRouter>(),
      get<_i21.DataManager>(),
      get<_i28.SnackBarService>()));
  gh.lazySingleton<_i29.DialogService>(
      () => _i29.DialogServiceImpl(get<_i5.AutoRouteRouter>()));
  gh.lazySingleton<_i30.Dio>(() => ygoProDeckModule.provideYgoProDeckDio(
      get<_i4.AppConfig>(), get<_i4.DioPluginProvider>(), get<_i16.Logger>()));
  gh.lazySingleton<_i31.DioPluginProvider>(() => _i31.DioPluginProviderImpl());
  gh.lazySingleton<_i32.DoesCardFitInZoneUseCase>(
      () => _i32.DoesCardFitInZoneUseCase());
  gh.lazySingleton<_i33.DuelDataManager>(() => _i33.DuelDataManagerImpl(
      get<_i4.AppConfig>(), get<_i34.DuelStorageProvider>()));
  gh.lazySingleton<_i35.DuelDialogProvider>(() => _i35.DuelDialogProvider());
  gh.lazySingleton<_i36.DuelFormValidators>(() => _i36.DuelFormValidators());
  gh.factoryParam<_i37.DuelRoomViewModel, _i21.PreBuiltDeck, dynamic>(
      (_preBuiltDeck, _) => _i37.DuelRoomViewModel(
          get<_i16.Logger>(),
          _preBuiltDeck,
          get<_i5.AppRouter>(),
          get<_i38.SmartDuelServer>(),
          get<_i21.DataManager>(),
          get<_i28.SnackBarService>(),
          get<_i39.ClipboardProvider>()));
  gh.lazySingleton<_i40.DuelStorageProvider>(() =>
      _i40.DuelStorageProviderImpl(get<_i41.SharedPreferencesProvider>()));
  gh.factory<_i42.DuelViewModel>(() => _i42.DuelViewModel(
      get<_i36.DuelFormValidators>(),
      get<_i5.AppRouter>(),
      get<_i21.DataManager>(),
      get<_i16.Logger>()));
  gh.lazySingleton<_i43.EnumHelper>(() => _i43.EnumHelperImpl());
  gh.lazySingleton<_i44.FirebaseCrashlytics>(
      () => crashlyticsModule.provideFirebaseCrashlytics());
  gh.lazySingleton<_i45.FirebaseFirestore>(
      () => cloudDatabaseModule.provideFirebaseFirestore());
  gh.factory<_i46.HomeViewModel>(
      () => _i46.HomeViewModel(get<_i5.AppRouter>(), get<_i16.Logger>()));
  gh.lazySingleton<_i47.HtmlUnescapeProvider>(
      () => _i47.HtmlUnescapeProviderImpl());
  gh.lazySingleton<_i48.Logger>(() =>
      _i49.LoggerImpl(get<_i50.CrashlyticsProvider>(), get<_i4.AppConfig>()));
  gh.lazySingleton<_i51.MoveCardUseCase>(() => _i51.MoveCardUseCase());
  gh.lazySingleton<_i52.NewsDataManager>(() => _i52.NewsDataManagerImpl(
      get<_i4.AppConfig>(),
      get<_i53.TwitterProvider>(),
      get<_i54.HtmlUnescapeProvider>()));
  gh.factory<_i55.NewsViewModel>(() => _i55.NewsViewModel(
      get<_i16.Logger>(),
      get<_i5.AppRouter>(),
      get<_i21.DataManager>(),
      get<_i56.DateFormatter>(),
      get<_i50.CrashlyticsProvider>()));
  gh.factory<_i57.OnboardingViewModel>(() => _i57.OnboardingViewModel(
      get<_i16.Logger>(), get<_i5.AppRouter>(), get<_i21.DataManager>()));
  gh.factoryParam<_i58.PlayCardDialogViewModel, _i59.PlayCardDialogParameters,
          dynamic>(
      (_parameters, _) => _i58.PlayCardDialogViewModel(
          _parameters,
          get<_i15.CreatePlayCardDialogActionsUseCase>(),
          get<_i5.DialogService>(),
          get<_i16.Logger>()));
  gh.factory<_i60.PrivacyPolicyViewModel>(() => _i60.PrivacyPolicyViewModel(
      get<_i18.AssetsProvider>(),
      get<_i9.AssetBundle>(),
      get<_i5.AppRouter>(),
      get<_i16.Logger>()));
  gh.factory<_i61.SelectDeckDialogViewModel>(() =>
      _i61.SelectDeckDialogViewModel(get<_i16.Logger>(), get<_i5.AppRouter>(),
          get<_i21.DataManager>(), get<_i5.DialogService>()));
  gh.lazySingleton<_i62.SettingsDataManager>(
      () => _i62.SettingsDataManagerImpl(get<_i34.SettingsStorageProvider>()));
  gh.lazySingleton<_i63.SettingsStorageProvider>(() =>
      _i63.SettingsStorageProviderImpl(get<_i41.SharedPreferencesProvider>()));
  await gh.lazySingletonAsync<_i64.SharedPreferences>(
      () => sharedPreferencesModule.provideSharedPreferences(),
      preResolve: true);
  gh.lazySingleton<_i65.SharedPreferencesProvider>(
      () => _i65.SharedPreferencesProviderImpl(get<_i64.SharedPreferences>()));
  gh.lazySingleton<_i66.SmartDuelServer>(() => _i66.SmartDuelServerImpl(
      get<_i67.WebSocketFactory>(), get<_i16.Logger>()));
  gh.lazySingleton<_i68.SnackBarService>(() => _i68.SnackBarServiceImpl());
  gh.factory<_i69.Socket>(
      () => socketIoModule.provideSocket(get<_i21.DataManager>()));
  gh.lazySingleton<_i70.SpeedDuelDialogProvider>(
      () => _i70.SpeedDuelDialogProvider());
  gh.factoryParam<_i71.SpeedDuelViewModel, _i38.DuelRoom, dynamic>(
      (_duelRoom, _) => _i71.SpeedDuelViewModel(
          get<_i16.Logger>(),
          _duelRoom,
          get<_i5.AppRouter>(),
          get<_i38.SmartDuelServer>(),
          get<_i20.CreatePlayerStateUseCase>(),
          get<_i17.CreatePlayCardUseCase>(),
          get<_i32.DoesCardFitInZoneUseCase>(),
          get<_i11.CanCardAttackZoneUseCase>(),
          get<_i51.MoveCardUseCase>(),
          get<_i21.DataManager>(),
          get<_i19.EnumHelper>(),
          get<_i50.CrashlyticsProvider>(),
          get<_i28.SnackBarService>()));
  gh.lazySingleton<_i72.TwitterApi>(
      () => twitterModule.provideTwitterApi(get<_i4.AppConfig>()));
  gh.lazySingleton<_i73.TwitterProvider>(
      () => _i73.TwitterProviderImpl(get<_i72.TwitterApi>()));
  gh.lazySingleton<_i74.UrlLauncherProvider>(
      () => _i74.UrlLauncherProviderImpl());
  gh.factory<_i75.UserSettingsViewModel>(() => _i75.UserSettingsViewModel(
      get<_i21.DataManager>(),
      get<_i28.SnackBarService>(),
      get<_i48.Logger>()));
  gh.lazySingleton<_i76.WebSocketFactory>(() => _i76.WebSocketFactoryImpl());
  gh.factory<_i77.WebSocketProvider>(
      () => _i77.WebSocketProviderImpl(get<_i69.Socket>(), get<_i16.Logger>()));
  gh.lazySingleton<_i78.YgoProDeckRestClient>(
      () => _i78.YgoProDeckRestClient(get<_i30.Dio>()));
  gh.factoryParam<_i79.YugiohCardDetailViewModel, _i21.YugiohCard, int>(
      (_yugiohCard, _index) => _i79.YugiohCardDetailViewModel(
          get<_i16.Logger>(), _yugiohCard, _index));
  gh.lazySingleton<_i80.YugiohCardsDataManager>(() =>
      _i80.YugiohCardsDataManagerImpl(get<_i81.YgoProDeckApiProvider>(),
          get<_i34.YugiohCardsStorageProvider>()));
  gh.lazySingleton<_i82.YugiohCardsStorageProvider>(
      () => _i82.YugiohCardsStorageProviderImpl());
  gh.lazySingleton<_i83.CloudDatabaseProvider>(
      () => _i84.FirebaseCloudDatabaseProvider(get<_i45.FirebaseFirestore>()));
  gh.lazySingleton<_i13.CrashlyticsProvider>(
      () => _i85.FirebaseCrashlyticsProvider(get<_i44.FirebaseCrashlytics>()),
      registerFor: {_mobile});
  gh.lazySingleton<_i86.YgoProDeckApiProvider>(
      () => _i86.YgoProDeckApiProviderImpl(get<_i78.YgoProDeckRestClient>()));
  return get;
}

class _$FlutterModule extends _i87.FlutterModule {}

class _$YgoProDeckModule extends _i88.YgoProDeckModule {}

class _$CrashlyticsModule extends _i89.CrashlyticsModule {}

class _$CloudDatabaseModule extends _i90.CloudDatabaseModule {}

class _$SharedPreferencesModule extends _i91.SharedPreferencesModule {}

class _$SocketIoModule extends _i92.SocketIoModule {}

class _$TwitterModule extends _i93.TwitterModule {}
