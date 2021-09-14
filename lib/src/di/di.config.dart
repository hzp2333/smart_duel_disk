// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart' as _i49;
import 'package:dart_twitter_api/twitter_api.dart' as _i79;
import 'package:dio/dio.dart' as _i34;
import 'package:firebase_crashlytics/firebase_crashlytics.dart' as _i48;
import 'package:flutter/services.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i69;
import 'package:socket_io_client/socket_io_client.dart' as _i74;

import '../../generated/codegen_loader.g.dart' as _i15;
import '../../packages/core/core_config/lib/core_config.dart' as _i4;
import '../../packages/core/core_config/lib/src/providers/delay_provider.dart'
    as _i32;
import '../../packages/core/core_config/lib/src/providers/dio_plugin_provider/dio_plugin_provider.dart'
    as _i35;
import '../../packages/core/core_data_manager/lib/core_data_manager_interface.dart'
    as _i23;
import '../../packages/core/core_data_manager/lib/src/data_manager.dart'
    as _i24;
import '../../packages/core/core_data_manager/lib/src/deck/deck_data_manager.dart'
    as _i28;
import '../../packages/core/core_data_manager/lib/src/duel/duel_data_manager.dart'
    as _i37;
import '../../packages/core/core_data_manager/lib/src/news/news_data_manager.dart'
    as _i57;
import '../../packages/core/core_data_manager/lib/src/settings/settings_data_manager.dart'
    as _i67;
import '../../packages/core/core_data_manager/lib/src/yugioh_cards/yugioh_cards_data_manager.dart'
    as _i87;
import '../../packages/core/core_general/lib/core_general.dart' as _i61;
import '../../packages/core/core_general/lib/src/formatters/date_formatter.dart'
    as _i25;
import '../../packages/core/core_localization/lib/core_localization.dart'
    as _i27;
import '../../packages/core/core_localization/lib/src/di/localization_module.dart'
    as _i95;
import '../../packages/core/core_localization/lib/src/string_provider.dart'
    as _i78;
import '../../packages/core/core_logger/lib/core_logger.dart' as _i13;
import '../../packages/core/core_logger/lib/src/logger.dart' as _i53;
import '../../packages/core/core_logger/lib/src/logger_impl.dart' as _i54;
import '../../packages/core/core_messaging/lib/core_messaging.dart' as _i31;
import '../../packages/core/core_messaging/lib/src/snack_bar/snack_bar_service.dart'
    as _i73;
import '../../packages/core/core_navigation/lib/core_navigation.dart' as _i5;
import '../../packages/core/core_navigation/lib/src/app_router.dart' as _i3;
import '../../packages/core/core_navigation/lib/src/dialogs/dialog_service.dart'
    as _i33;
import '../../packages/core/core_smart_duel_server/lib/core_smart_duel_server.dart'
    as _i42;
import '../../packages/core/core_smart_duel_server/lib/src/smart_duel_server.dart'
    as _i71;
import '../../packages/core/core_storage/lib/core_storage.dart' as _i38;
import '../../packages/core/core_storage/lib/src/duel/duel_storage_provider.dart'
    as _i44;
import '../../packages/core/core_storage/lib/src/settings/settings_storage_provider.dart'
    as _i68;
import '../../packages/core/core_storage/lib/src/yugioh_cards/yugioh_cards_storage_provider.dart'
    as _i89;
import '../../packages/core/core_ygoprodeck/lib/core_ygoprodeck.dart' as _i88;
import '../../packages/core/core_ygoprodeck/lib/src/api/ygoprodeck_api.dart'
    as _i85;
import '../../packages/core/core_ygoprodeck/lib/src/di/ygoprodeck_module.dart'
    as _i96;
import '../../packages/core/core_ygoprodeck/lib/src/ygoprodeck_api_provider.dart'
    as _i93;
import '../../packages/features/feature_deck_builder/lib/src/deck_builder/deck_builder_viewmodel.dart'
    as _i26;
import '../../packages/features/feature_duel_room/lib/src/duel_room_viewmodel.dart'
    as _i41;
import '../../packages/features/feature_home/lib/feature_home.dart' as _i7;
import '../../packages/features/feature_home/lib/src/deck/deck_viewmodel.dart'
    as _i30;
import '../../packages/features/feature_home/lib/src/duel/dialogs/duel_dialog_provider.dart'
    as _i39;
import '../../packages/features/feature_home/lib/src/duel/dialogs/select_deck/select_deck_dialog_viewmodel.dart'
    as _i66;
import '../../packages/features/feature_home/lib/src/duel/duel_viewmodel.dart'
    as _i46;
import '../../packages/features/feature_home/lib/src/duel/mixins/duel_form_validators.dart'
    as _i40;
import '../../packages/features/feature_home/lib/src/home/home_viewmodel.dart'
    as _i51;
import '../../packages/features/feature_home/lib/src/home/usecases/get_home_tabs_use_case.dart'
    as _i50;
import '../../packages/features/feature_home/lib/src/news/news_viewmodel.dart'
    as _i60;
import '../../packages/features/feature_onboarding/lib/src/onboarding/onboarding_viewmodel.dart'
    as _i62;
import '../../packages/features/feature_privacy_policy/lib/src/privacy_policy_viewmodel.dart'
    as _i65;
import '../../packages/features/feature_speed_duel/lib/feature_speed_duel.dart'
    as _i8;
import '../../packages/features/feature_speed_duel/lib/src/dialogs/play_card_dialog/models/play_card_dialog_parameters.dart'
    as _i64;
import '../../packages/features/feature_speed_duel/lib/src/dialogs/play_card_dialog/play_card_dialog_viewmodel.dart'
    as _i63;
import '../../packages/features/feature_speed_duel/lib/src/dialogs/play_card_dialog/use_cases/create_play_card_dialog_actions_use_case.dart'
    as _i18;
import '../../packages/features/feature_speed_duel/lib/src/dialogs/speed_duel_dialog_provider.dart'
    as _i75;
import '../../packages/features/feature_speed_duel/lib/src/helpers/card_event_animation_handler.dart'
    as _i12;
import '../../packages/features/feature_speed_duel/lib/src/helpers/speed_duel_event_emitter.dart'
    as _i76;
import '../../packages/features/feature_speed_duel/lib/src/speed_duel_viewmodel.dart'
    as _i77;
import '../../packages/features/feature_speed_duel/lib/src/usecases/can_card_attack_zone_use_case.dart'
    as _i11;
import '../../packages/features/feature_speed_duel/lib/src/usecases/create_play_card_use_case.dart'
    as _i19;
import '../../packages/features/feature_speed_duel/lib/src/usecases/create_player_state_use_case.dart'
    as _i22;
import '../../packages/features/feature_speed_duel/lib/src/usecases/does_card_fit_in_zone_use_case.dart'
    as _i36;
import '../../packages/features/feature_speed_duel/lib/src/usecases/move_card_use_case.dart'
    as _i56;
import '../../packages/features/feature_user_settings/lib/src/user_settings_viewmodel.dart'
    as _i82;
import '../../packages/features/feature_yugioh_card_detail/lib/src/yugioh_card_detail_viewmodel.dart'
    as _i86;
import '../../packages/wrappers/wrapper_assets/lib/src/assets_provider.dart'
    as _i10;
import '../../packages/wrappers/wrapper_assets/lib/wrapper_assets.dart' as _i20;
import '../../packages/wrappers/wrapper_clipboard/lib/src/clipboard_provider.dart'
    as _i14;
import '../../packages/wrappers/wrapper_clipboard/lib/wrapper_clipboard.dart'
    as _i43;
import '../../packages/wrappers/wrapper_cloud_database/lib/src/cloud_database_provider.dart'
    as _i90;
import '../../packages/wrappers/wrapper_cloud_database/lib/src/di/cloud_database_module.dart'
    as _i98;
import '../../packages/wrappers/wrapper_cloud_database/lib/src/firebase/firebase_cloud_database_provider.dart'
    as _i91;
import '../../packages/wrappers/wrapper_cloud_database/lib/wrapper_cloud_database.dart'
    as _i29;
import '../../packages/wrappers/wrapper_crashlytics/lib/src/crashlytics_provider.dart'
    as _i16;
import '../../packages/wrappers/wrapper_crashlytics/lib/src/di/crashlytics_module.dart'
    as _i97;
import '../../packages/wrappers/wrapper_crashlytics/lib/src/firebase/firebase_crashlytics_provider.dart'
    as _i92;
import '../../packages/wrappers/wrapper_crashlytics/lib/src/web/web_crashlytics_provider.dart'
    as _i17;
import '../../packages/wrappers/wrapper_crashlytics/lib/wrapper_crashlytics.dart'
    as _i55;
import '../../packages/wrappers/wrapper_enum_helper/lib/src/enum_helper.dart'
    as _i47;
import '../../packages/wrappers/wrapper_enum_helper/lib/wrapper_enum_helper.dart'
    as _i21;
import '../../packages/wrappers/wrapper_html_unescape/lib/src/html_unescape_provider.dart'
    as _i52;
import '../../packages/wrappers/wrapper_html_unescape/lib/wrapper_html_unescape.dart'
    as _i59;
import '../../packages/wrappers/wrapper_shared_preferences/lib/src/di/shared_preferences_module.dart'
    as _i99;
import '../../packages/wrappers/wrapper_shared_preferences/lib/src/shared_preferences_provider.dart'
    as _i70;
import '../../packages/wrappers/wrapper_shared_preferences/lib/wrapper_shared_preferences.dart'
    as _i45;
import '../../packages/wrappers/wrapper_twitter/lib/src/di/twitter_module.dart'
    as _i101;
import '../../packages/wrappers/wrapper_twitter/lib/src/twitter_provider.dart'
    as _i80;
import '../../packages/wrappers/wrapper_twitter/lib/wrapper_twitter.dart'
    as _i58;
import '../../packages/wrappers/wrapper_url_launcher/lib/src/url_launcher_provider.dart'
    as _i81;
import '../../packages/wrappers/wrapper_url_launcher/lib/wrapper_url_launcher.dart'
    as _i6;
import '../../packages/wrappers/wrapper_web_socket/lib/src/di/web_socket_module.dart'
    as _i100;
import '../../packages/wrappers/wrapper_web_socket/lib/src/web_socket_factory.dart'
    as _i83;
import '../../packages/wrappers/wrapper_web_socket/lib/src/web_socket_provider.dart'
    as _i84;
import '../../packages/wrappers/wrapper_web_socket/lib/wrapper_web_socket.dart'
    as _i72;
import 'modules/flutter_module.dart' as _i94;

const String _web = 'web';
const String _mobile = 'mobile';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final flutterModule = _$FlutterModule();
  final localizationModule = _$LocalizationModule();
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
  gh.lazySingleton<_i12.CardEventAnimationHandler>(
      () => _i12.CardEventAnimationHandler(
          get<_i4.DelayProvider>(), get<_i13.Logger>()),
      dispose: (i) => i.dispose());
  gh.lazySingleton<_i14.ClipboardProvider>(() => _i14.ClipboardProviderImpl());
  gh.lazySingleton<_i15.CodegenLoader>(
      () => localizationModule.provideCodegenLoader);
  gh.lazySingleton<_i16.CrashlyticsProvider>(
      () => _i17.WebCrashlyticsProvider(),
      registerFor: {_web});
  gh.lazySingleton<_i18.CreatePlayCardDialogActionsUseCase>(
      () => _i18.CreatePlayCardDialogActionsUseCase(get<_i13.Logger>()));
  gh.lazySingleton<_i19.CreatePlayCardUseCase>(() => _i19.CreatePlayCardUseCase(
      get<_i20.AssetsProvider>(), get<_i21.EnumHelper>()));
  gh.lazySingleton<_i22.CreatePlayerStateUseCase>(() =>
      _i22.CreatePlayerStateUseCase(
          get<_i23.DataManager>(), get<_i19.CreatePlayCardUseCase>()));
  gh.lazySingleton<_i24.DataManager>(() => _i24.DataManagerImpl(
      get<_i23.NewsDataManager>(),
      get<_i23.YugiohCardsDataManager>(),
      get<_i23.DeckDataManager>(),
      get<_i23.DuelDataManager>(),
      get<_i23.SettingsDataManager>()));
  gh.lazySingleton<_i25.DateFormatter>(() => _i25.DateFormatter());
  gh.factoryParam<_i26.DeckBuilderViewModel, _i23.PreBuiltDeck?, dynamic>(
      (_preBuiltDeck, _) => _i26.DeckBuilderViewModel(
          _preBuiltDeck,
          get<_i5.AppRouter>(),
          get<_i23.DataManager>(),
          get<_i27.StringProvider>(),
          get<_i13.Logger>()));
  gh.lazySingleton<_i28.DeckDataManager>(
      () => _i28.DeckDataManagerImpl(get<_i29.CloudDatabaseProvider>()));
  gh.factory<_i30.DeckViewModel>(() => _i30.DeckViewModel(
      get<_i5.AppRouter>(),
      get<_i23.DataManager>(),
      get<_i31.SnackBarService>(),
      get<_i27.StringProvider>(),
      get<_i13.Logger>()));
  gh.lazySingleton<_i32.DelayProvider>(() => _i32.DelayProviderImpl());
  gh.lazySingleton<_i33.DialogService>(
      () => _i33.DialogServiceImpl(get<_i5.AutoRouteRouter>()));
  gh.lazySingleton<_i34.Dio>(() => ygoProDeckModule.provideYgoProDeckDio(
      get<_i4.AppConfig>(), get<_i4.DioPluginProvider>(), get<_i13.Logger>()));
  gh.lazySingleton<_i35.DioPluginProvider>(() => _i35.DioPluginProviderImpl());
  gh.lazySingleton<_i36.DoesCardFitInZoneUseCase>(
      () => _i36.DoesCardFitInZoneUseCase());
  gh.lazySingleton<_i37.DuelDataManager>(() => _i37.DuelDataManagerImpl(
      get<_i4.AppConfig>(), get<_i38.DuelStorageProvider>()));
  gh.lazySingleton<_i39.DuelDialogProvider>(() => _i39.DuelDialogProvider());
  gh.lazySingleton<_i40.DuelFormValidators>(() => _i40.DuelFormValidators());
  gh.factoryParam<_i41.DuelRoomViewModel, _i23.PreBuiltDeck?, dynamic>(
      (_preBuiltDeck, _) => _i41.DuelRoomViewModel(
          _preBuiltDeck,
          get<_i5.AppRouter>(),
          get<_i42.SmartDuelServer>(),
          get<_i23.DataManager>(),
          get<_i31.SnackBarService>(),
          get<_i43.ClipboardProvider>(),
          get<_i13.Logger>()));
  gh.lazySingleton<_i44.DuelStorageProvider>(() =>
      _i44.DuelStorageProviderImpl(get<_i45.SharedPreferencesProvider>()));
  gh.factory<_i46.DuelViewModel>(() => _i46.DuelViewModel(
      get<_i40.DuelFormValidators>(),
      get<_i5.AppRouter>(),
      get<_i23.DataManager>(),
      get<_i13.Logger>()));
  gh.lazySingleton<_i47.EnumHelper>(() => _i47.EnumHelperImpl());
  gh.lazySingleton<_i48.FirebaseCrashlytics>(
      () => crashlyticsModule.provideFirebaseCrashlytics());
  gh.lazySingleton<_i49.FirebaseFirestore>(
      () => cloudDatabaseModule.provideFirebaseFirestore());
  gh.lazySingleton<_i50.GetHomeTabsUseCase>(() => _i50.GetHomeTabsUseCase());
  gh.factory<_i51.HomeViewModel>(() => _i51.HomeViewModel(get<_i5.AppRouter>(),
      get<_i50.GetHomeTabsUseCase>(), get<_i13.Logger>()));
  gh.lazySingleton<_i52.HtmlUnescapeProvider>(
      () => _i52.HtmlUnescapeProviderImpl());
  gh.lazySingleton<_i53.Logger>(() =>
      _i54.LoggerImpl(get<_i55.CrashlyticsProvider>(), get<_i4.AppConfig>()));
  gh.lazySingleton<_i56.MoveCardUseCase>(() => _i56.MoveCardUseCase());
  gh.lazySingleton<_i57.NewsDataManager>(() => _i57.NewsDataManagerImpl(
      get<_i4.AppConfig>(),
      get<_i58.TwitterProvider>(),
      get<_i59.HtmlUnescapeProvider>()));
  gh.factory<_i60.NewsViewModel>(() => _i60.NewsViewModel(
      get<_i13.Logger>(),
      get<_i5.AppRouter>(),
      get<_i23.DataManager>(),
      get<_i61.DateFormatter>(),
      get<_i55.CrashlyticsProvider>()));
  gh.factory<_i62.OnboardingViewModel>(() => _i62.OnboardingViewModel(
      get<_i5.AppRouter>(), get<_i23.DataManager>(), get<_i13.Logger>()));
  gh.factoryParam<_i63.PlayCardDialogViewModel, _i64.PlayCardDialogParameters?,
          dynamic>(
      (_parameters, _) => _i63.PlayCardDialogViewModel(
          _parameters,
          get<_i18.CreatePlayCardDialogActionsUseCase>(),
          get<_i5.DialogService>(),
          get<_i13.Logger>()));
  gh.factory<_i65.PrivacyPolicyViewModel>(() => _i65.PrivacyPolicyViewModel(
      get<_i20.AssetsProvider>(),
      get<_i9.AssetBundle>(),
      get<_i5.AppRouter>(),
      get<_i13.Logger>()));
  gh.factory<_i66.SelectDeckDialogViewModel>(() =>
      _i66.SelectDeckDialogViewModel(
          get<_i5.AppRouter>(),
          get<_i23.DataManager>(),
          get<_i5.DialogService>(),
          get<_i13.Logger>()));
  gh.lazySingleton<_i67.SettingsDataManager>(
      () => _i67.SettingsDataManagerImpl(get<_i38.SettingsStorageProvider>()));
  gh.lazySingleton<_i68.SettingsStorageProvider>(() =>
      _i68.SettingsStorageProviderImpl(get<_i45.SharedPreferencesProvider>()));
  await gh.lazySingletonAsync<_i69.SharedPreferences>(
      () => sharedPreferencesModule.provideSharedPreferences(),
      preResolve: true);
  gh.lazySingleton<_i70.SharedPreferencesProvider>(
      () => _i70.SharedPreferencesProviderImpl(get<_i69.SharedPreferences>()));
  gh.lazySingleton<_i71.SmartDuelServer>(() => _i71.SmartDuelServerImpl(
      get<_i72.WebSocketFactory>(), get<_i13.Logger>()));
  gh.lazySingleton<_i73.SnackBarService>(() => _i73.SnackBarServiceImpl());
  gh.factory<_i74.Socket>(
      () => socketIoModule.provideSocket(get<_i23.DataManager>()));
  gh.lazySingleton<_i75.SpeedDuelDialogProvider>(
      () => _i75.SpeedDuelDialogProvider());
  gh.lazySingleton<_i76.SpeedDuelEventEmitter>(() => _i76.SpeedDuelEventEmitter(
      get<_i42.SmartDuelServer>(), get<_i21.EnumHelper>(), get<_i13.Logger>()));
  gh.factoryParam<_i77.SpeedDuelViewModel, _i42.DuelRoom?, dynamic>(
      (_duelRoom, _) => _i77.SpeedDuelViewModel(
          _duelRoom,
          get<_i5.AppRouter>(),
          get<_i42.SmartDuelServer>(),
          get<_i22.CreatePlayerStateUseCase>(),
          get<_i19.CreatePlayCardUseCase>(),
          get<_i36.DoesCardFitInZoneUseCase>(),
          get<_i11.CanCardAttackZoneUseCase>(),
          get<_i56.MoveCardUseCase>(),
          get<_i76.SpeedDuelEventEmitter>(),
          get<_i12.CardEventAnimationHandler>(),
          get<_i23.DataManager>(),
          get<_i55.CrashlyticsProvider>(),
          get<_i31.SnackBarService>(),
          get<_i13.Logger>()));
  gh.lazySingleton<_i78.StringProvider>(() => _i78.StringProviderImpl());
  gh.lazySingleton<_i79.TwitterApi>(
      () => twitterModule.provideTwitterApi(get<_i4.AppConfig>()));
  gh.lazySingleton<_i80.TwitterProvider>(
      () => _i80.TwitterProviderImpl(get<_i79.TwitterApi>()));
  gh.lazySingleton<_i81.UrlLauncherProvider>(
      () => _i81.UrlLauncherProviderImpl());
  gh.factory<_i82.UserSettingsViewModel>(() => _i82.UserSettingsViewModel(
      get<_i23.DataManager>(),
      get<_i31.SnackBarService>(),
      get<_i53.Logger>()));
  gh.lazySingleton<_i83.WebSocketFactory>(() => _i83.WebSocketFactoryImpl());
  gh.factory<_i84.WebSocketProvider>(
      () => _i84.WebSocketProviderImpl(get<_i74.Socket>(), get<_i13.Logger>()));
  gh.lazySingleton<_i85.YgoProDeckRestClient>(
      () => _i85.YgoProDeckRestClient(get<_i34.Dio>()));
  gh.factoryParam<_i86.YugiohCardDetailViewModel, _i23.YugiohCard?, int?>(
      (_yugiohCard, _index) => _i86.YugiohCardDetailViewModel(
          get<_i13.Logger>(), _yugiohCard, _index));
  gh.lazySingleton<_i87.YugiohCardsDataManager>(() =>
      _i87.YugiohCardsDataManagerImpl(get<_i88.YgoProDeckApiProvider>(),
          get<_i38.YugiohCardsStorageProvider>()));
  gh.lazySingleton<_i89.YugiohCardsStorageProvider>(
      () => _i89.YugiohCardsStorageProviderImpl());
  gh.lazySingleton<_i90.CloudDatabaseProvider>(
      () => _i91.FirebaseCloudDatabaseProvider(get<_i49.FirebaseFirestore>()));
  gh.lazySingleton<_i16.CrashlyticsProvider>(
      () => _i92.FirebaseCrashlyticsProvider(get<_i48.FirebaseCrashlytics>()),
      registerFor: {_mobile});
  gh.lazySingleton<_i93.YgoProDeckApiProvider>(
      () => _i93.YgoProDeckApiProviderImpl(get<_i85.YgoProDeckRestClient>()));
  return get;
}

class _$FlutterModule extends _i94.FlutterModule {}

class _$LocalizationModule extends _i95.LocalizationModule {}

class _$YgoProDeckModule extends _i96.YgoProDeckModule {}

class _$CrashlyticsModule extends _i97.CrashlyticsModule {}

class _$CloudDatabaseModule extends _i98.CloudDatabaseModule {}

class _$SharedPreferencesModule extends _i99.SharedPreferencesModule {}

class _$SocketIoModule extends _i100.SocketIoModule {}

class _$TwitterModule extends _i101.TwitterModule {}
