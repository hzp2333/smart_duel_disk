// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart' as _i47;
import 'package:dart_twitter_api/twitter_api.dart' as _i77;
import 'package:dio/dio.dart' as _i32;
import 'package:firebase_crashlytics/firebase_crashlytics.dart' as _i46;
import 'package:flutter/services.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i67;
import 'package:socket_io_client/socket_io_client.dart' as _i72;

import '../../generated/codegen_loader.g.dart' as _i14;
import '../../packages/core/core_config/lib/core_config.dart' as _i4;
import '../../packages/core/core_config/lib/src/providers/delay_provider.dart'
    as _i30;
import '../../packages/core/core_config/lib/src/providers/dio_plugin_provider/dio_plugin_provider.dart'
    as _i33;
import '../../packages/core/core_data_manager/lib/core_data_manager_interface.dart'
    as _i21;
import '../../packages/core/core_data_manager/lib/src/data_manager.dart'
    as _i22;
import '../../packages/core/core_data_manager/lib/src/deck/deck_data_manager.dart'
    as _i26;
import '../../packages/core/core_data_manager/lib/src/duel/duel_data_manager.dart'
    as _i35;
import '../../packages/core/core_data_manager/lib/src/news/news_data_manager.dart'
    as _i55;
import '../../packages/core/core_data_manager/lib/src/settings/settings_data_manager.dart'
    as _i65;
import '../../packages/core/core_data_manager/lib/src/yugioh_cards/yugioh_cards_data_manager.dart'
    as _i85;
import '../../packages/core/core_general/lib/core_general.dart' as _i59;
import '../../packages/core/core_general/lib/src/formatters/date_formatter.dart'
    as _i23;
import '../../packages/core/core_localization/lib/core_localization.dart'
    as _i25;
import '../../packages/core/core_localization/lib/src/di/localization_module.dart'
    as _i93;
import '../../packages/core/core_localization/lib/src/string_provider.dart'
    as _i76;
import '../../packages/core/core_logger/lib/core_logger.dart' as _i12;
import '../../packages/core/core_logger/lib/src/logger.dart' as _i51;
import '../../packages/core/core_logger/lib/src/logger_impl.dart' as _i52;
import '../../packages/core/core_messaging/lib/core_messaging.dart' as _i29;
import '../../packages/core/core_messaging/lib/src/snack_bar/snack_bar_service.dart'
    as _i71;
import '../../packages/core/core_navigation/lib/core_navigation.dart' as _i5;
import '../../packages/core/core_navigation/lib/src/app_router.dart' as _i3;
import '../../packages/core/core_navigation/lib/src/dialogs/dialog_service.dart'
    as _i31;
import '../../packages/core/core_smart_duel_server/lib/core_smart_duel_server.dart'
    as _i40;
import '../../packages/core/core_smart_duel_server/lib/src/smart_duel_server.dart'
    as _i69;
import '../../packages/core/core_storage/lib/core_storage.dart' as _i36;
import '../../packages/core/core_storage/lib/src/duel/duel_storage_provider.dart'
    as _i42;
import '../../packages/core/core_storage/lib/src/settings/settings_storage_provider.dart'
    as _i66;
import '../../packages/core/core_storage/lib/src/yugioh_cards/yugioh_cards_storage_provider.dart'
    as _i87;
import '../../packages/core/core_ygoprodeck/lib/core_ygoprodeck.dart' as _i86;
import '../../packages/core/core_ygoprodeck/lib/src/api/ygoprodeck_api.dart'
    as _i83;
import '../../packages/core/core_ygoprodeck/lib/src/di/ygoprodeck_module.dart'
    as _i94;
import '../../packages/core/core_ygoprodeck/lib/src/ygoprodeck_api_provider.dart'
    as _i91;
import '../../packages/features/feature_deck_builder/lib/src/deck_builder/deck_builder_viewmodel.dart'
    as _i24;
import '../../packages/features/feature_duel_room/lib/src/duel_room_viewmodel.dart'
    as _i39;
import '../../packages/features/feature_home/lib/feature_home.dart' as _i7;
import '../../packages/features/feature_home/lib/src/deck/deck_viewmodel.dart'
    as _i28;
import '../../packages/features/feature_home/lib/src/duel/dialogs/duel_dialog_provider.dart'
    as _i37;
import '../../packages/features/feature_home/lib/src/duel/dialogs/select_deck/select_deck_dialog_viewmodel.dart'
    as _i64;
import '../../packages/features/feature_home/lib/src/duel/duel_viewmodel.dart'
    as _i44;
import '../../packages/features/feature_home/lib/src/duel/mixins/duel_form_validators.dart'
    as _i38;
import '../../packages/features/feature_home/lib/src/home/home_viewmodel.dart'
    as _i49;
import '../../packages/features/feature_home/lib/src/home/usecases/get_home_tabs_use_case.dart'
    as _i48;
import '../../packages/features/feature_home/lib/src/news/news_viewmodel.dart'
    as _i58;
import '../../packages/features/feature_onboarding/lib/src/onboarding/onboarding_viewmodel.dart'
    as _i60;
import '../../packages/features/feature_privacy_policy/lib/src/privacy_policy_viewmodel.dart'
    as _i63;
import '../../packages/features/feature_speed_duel/lib/feature_speed_duel.dart'
    as _i8;
import '../../packages/features/feature_speed_duel/lib/src/dialogs/play_card_dialog/models/play_card_dialog_parameters.dart'
    as _i62;
import '../../packages/features/feature_speed_duel/lib/src/dialogs/play_card_dialog/play_card_dialog_viewmodel.dart'
    as _i61;
import '../../packages/features/feature_speed_duel/lib/src/dialogs/play_card_dialog/use_cases/create_play_card_dialog_actions_use_case.dart'
    as _i17;
import '../../packages/features/feature_speed_duel/lib/src/dialogs/speed_duel_dialog_provider.dart'
    as _i73;
import '../../packages/features/feature_speed_duel/lib/src/helpers/card_event_animation_handler.dart'
    as _i11;
import '../../packages/features/feature_speed_duel/lib/src/helpers/speed_duel_event_emitter.dart'
    as _i74;
import '../../packages/features/feature_speed_duel/lib/src/speed_duel_viewmodel.dart'
    as _i75;
import '../../packages/features/feature_speed_duel/lib/src/usecases/can_card_attack_zone_use_case.dart'
    as _i10;
import '../../packages/features/feature_speed_duel/lib/src/usecases/create_play_card_use_case.dart'
    as _i18;
import '../../packages/features/feature_speed_duel/lib/src/usecases/create_player_state_use_case.dart'
    as _i20;
import '../../packages/features/feature_speed_duel/lib/src/usecases/does_card_fit_in_zone_use_case.dart'
    as _i34;
import '../../packages/features/feature_speed_duel/lib/src/usecases/move_card_use_case.dart'
    as _i54;
import '../../packages/features/feature_user_settings/lib/src/user_settings_viewmodel.dart'
    as _i80;
import '../../packages/features/feature_yugioh_card_detail/lib/src/yugioh_card_detail_viewmodel.dart'
    as _i84;
import '../../packages/wrappers/wrapper_clipboard/lib/src/clipboard_provider.dart'
    as _i13;
import '../../packages/wrappers/wrapper_clipboard/lib/wrapper_clipboard.dart'
    as _i41;
import '../../packages/wrappers/wrapper_cloud_database/lib/src/cloud_database_provider.dart'
    as _i88;
import '../../packages/wrappers/wrapper_cloud_database/lib/src/di/cloud_database_module.dart'
    as _i96;
import '../../packages/wrappers/wrapper_cloud_database/lib/src/firebase/firebase_cloud_database_provider.dart'
    as _i89;
import '../../packages/wrappers/wrapper_cloud_database/lib/wrapper_cloud_database.dart'
    as _i27;
import '../../packages/wrappers/wrapper_crashlytics/lib/src/crashlytics_provider.dart'
    as _i15;
import '../../packages/wrappers/wrapper_crashlytics/lib/src/di/crashlytics_module.dart'
    as _i95;
import '../../packages/wrappers/wrapper_crashlytics/lib/src/firebase/firebase_crashlytics_provider.dart'
    as _i90;
import '../../packages/wrappers/wrapper_crashlytics/lib/src/web/web_crashlytics_provider.dart'
    as _i16;
import '../../packages/wrappers/wrapper_crashlytics/lib/wrapper_crashlytics.dart'
    as _i53;
import '../../packages/wrappers/wrapper_enum_helper/lib/src/enum_helper.dart'
    as _i45;
import '../../packages/wrappers/wrapper_enum_helper/lib/wrapper_enum_helper.dart'
    as _i19;
import '../../packages/wrappers/wrapper_html_unescape/lib/src/html_unescape_provider.dart'
    as _i50;
import '../../packages/wrappers/wrapper_html_unescape/lib/wrapper_html_unescape.dart'
    as _i57;
import '../../packages/wrappers/wrapper_shared_preferences/lib/src/di/shared_preferences_module.dart'
    as _i97;
import '../../packages/wrappers/wrapper_shared_preferences/lib/src/shared_preferences_provider.dart'
    as _i68;
import '../../packages/wrappers/wrapper_shared_preferences/lib/wrapper_shared_preferences.dart'
    as _i43;
import '../../packages/wrappers/wrapper_twitter/lib/src/di/twitter_module.dart'
    as _i99;
import '../../packages/wrappers/wrapper_twitter/lib/src/twitter_provider.dart'
    as _i78;
import '../../packages/wrappers/wrapper_twitter/lib/wrapper_twitter.dart'
    as _i56;
import '../../packages/wrappers/wrapper_url_launcher/lib/src/url_launcher_provider.dart'
    as _i79;
import '../../packages/wrappers/wrapper_url_launcher/lib/wrapper_url_launcher.dart'
    as _i6;
import '../../packages/wrappers/wrapper_web_socket/lib/src/di/web_socket_module.dart'
    as _i98;
import '../../packages/wrappers/wrapper_web_socket/lib/src/web_socket_factory.dart'
    as _i81;
import '../../packages/wrappers/wrapper_web_socket/lib/src/web_socket_provider.dart'
    as _i82;
import '../../packages/wrappers/wrapper_web_socket/lib/wrapper_web_socket.dart'
    as _i70;
import 'modules/flutter_module.dart' as _i92;

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
  gh.lazySingleton<_i10.CanCardAttackZoneUseCase>(
      () => _i10.CanCardAttackZoneUseCase());
  gh.lazySingleton<_i11.CardEventAnimationHandler>(
      () => _i11.CardEventAnimationHandler(
          get<_i4.DelayProvider>(), get<_i12.Logger>()),
      dispose: (i) => i.dispose());
  gh.lazySingleton<_i13.ClipboardProvider>(() => _i13.ClipboardProviderImpl());
  gh.lazySingleton<_i14.CodegenLoader>(
      () => localizationModule.provideCodegenLoader);
  gh.lazySingleton<_i15.CrashlyticsProvider>(
      () => _i16.WebCrashlyticsProvider(),
      registerFor: {_web});
  gh.lazySingleton<_i17.CreatePlayCardDialogActionsUseCase>(
      () => _i17.CreatePlayCardDialogActionsUseCase(get<_i12.Logger>()));
  gh.lazySingleton<_i18.CreatePlayCardUseCase>(
      () => _i18.CreatePlayCardUseCase(get<_i19.EnumHelper>()));
  gh.lazySingleton<_i20.CreatePlayerStateUseCase>(() =>
      _i20.CreatePlayerStateUseCase(
          get<_i21.DataManager>(), get<_i18.CreatePlayCardUseCase>()));
  gh.lazySingleton<_i22.DataManager>(() => _i22.DataManagerImpl(
      get<_i21.NewsDataManager>(),
      get<_i21.YugiohCardsDataManager>(),
      get<_i21.DeckDataManager>(),
      get<_i21.DuelDataManager>(),
      get<_i21.SettingsDataManager>()));
  gh.lazySingleton<_i23.DateFormatter>(() => _i23.DateFormatter());
  gh.factoryParam<_i24.DeckBuilderViewModel, _i21.PreBuiltDeck?, dynamic>(
      (_preBuiltDeck, _) => _i24.DeckBuilderViewModel(
          _preBuiltDeck,
          get<_i5.AppRouter>(),
          get<_i21.DataManager>(),
          get<_i25.StringProvider>(),
          get<_i12.Logger>()));
  gh.lazySingleton<_i26.DeckDataManager>(
      () => _i26.DeckDataManagerImpl(get<_i27.CloudDatabaseProvider>()));
  gh.factory<_i28.DeckViewModel>(() => _i28.DeckViewModel(
      get<_i5.AppRouter>(),
      get<_i21.DataManager>(),
      get<_i29.SnackBarService>(),
      get<_i25.StringProvider>(),
      get<_i12.Logger>()));
  gh.lazySingleton<_i30.DelayProvider>(() => _i30.DelayProviderImpl());
  gh.lazySingleton<_i31.DialogService>(
      () => _i31.DialogServiceImpl(get<_i5.AutoRouteRouter>()));
  gh.lazySingleton<_i32.Dio>(() => ygoProDeckModule.provideYgoProDeckDio(
      get<_i4.AppConfig>(), get<_i4.DioPluginProvider>(), get<_i12.Logger>()));
  gh.lazySingleton<_i33.DioPluginProvider>(() => _i33.DioPluginProviderImpl());
  gh.lazySingleton<_i34.DoesCardFitInZoneUseCase>(
      () => _i34.DoesCardFitInZoneUseCase());
  gh.lazySingleton<_i35.DuelDataManager>(() => _i35.DuelDataManagerImpl(
      get<_i4.AppConfig>(), get<_i36.DuelStorageProvider>()));
  gh.lazySingleton<_i37.DuelDialogProvider>(() => _i37.DuelDialogProvider());
  gh.lazySingleton<_i38.DuelFormValidators>(
      () => _i38.DuelFormValidators(get<_i25.StringProvider>()));
  gh.factoryParam<_i39.DuelRoomViewModel, _i21.PreBuiltDeck?, dynamic>(
      (_preBuiltDeck, _) => _i39.DuelRoomViewModel(
          _preBuiltDeck,
          get<_i5.AppRouter>(),
          get<_i40.SmartDuelServer>(),
          get<_i21.DataManager>(),
          get<_i29.SnackBarService>(),
          get<_i41.ClipboardProvider>(),
          get<_i12.Logger>()));
  gh.lazySingleton<_i42.DuelStorageProvider>(() =>
      _i42.DuelStorageProviderImpl(get<_i43.SharedPreferencesProvider>()));
  gh.factory<_i44.DuelViewModel>(() => _i44.DuelViewModel(
      get<_i38.DuelFormValidators>(),
      get<_i5.AppRouter>(),
      get<_i21.DataManager>(),
      get<_i12.Logger>()));
  gh.lazySingleton<_i45.EnumHelper>(() => _i45.EnumHelperImpl());
  gh.lazySingleton<_i46.FirebaseCrashlytics>(
      () => crashlyticsModule.provideFirebaseCrashlytics());
  gh.lazySingleton<_i47.FirebaseFirestore>(
      () => cloudDatabaseModule.provideFirebaseFirestore());
  gh.lazySingleton<_i48.GetHomeTabsUseCase>(() => _i48.GetHomeTabsUseCase());
  gh.factory<_i49.HomeViewModel>(() => _i49.HomeViewModel(get<_i5.AppRouter>(),
      get<_i48.GetHomeTabsUseCase>(), get<_i12.Logger>()));
  gh.lazySingleton<_i50.HtmlUnescapeProvider>(
      () => _i50.HtmlUnescapeProviderImpl());
  gh.lazySingleton<_i51.Logger>(() =>
      _i52.LoggerImpl(get<_i53.CrashlyticsProvider>(), get<_i4.AppConfig>()));
  gh.lazySingleton<_i54.MoveCardUseCase>(() => _i54.MoveCardUseCase());
  gh.lazySingleton<_i55.NewsDataManager>(() => _i55.NewsDataManagerImpl(
      get<_i4.AppConfig>(),
      get<_i56.TwitterProvider>(),
      get<_i57.HtmlUnescapeProvider>()));
  gh.factory<_i58.NewsViewModel>(() => _i58.NewsViewModel(get<_i5.AppRouter>(),
      get<_i21.DataManager>(), get<_i59.DateFormatter>(), get<_i12.Logger>()));
  gh.factory<_i60.OnboardingViewModel>(() => _i60.OnboardingViewModel(
      get<_i5.AppRouter>(), get<_i21.DataManager>(), get<_i12.Logger>()));
  gh.factoryParam<_i61.PlayCardDialogViewModel, _i62.PlayCardDialogParameters?,
          dynamic>(
      (_parameters, _) => _i61.PlayCardDialogViewModel(
          _parameters,
          get<_i17.CreatePlayCardDialogActionsUseCase>(),
          get<_i5.DialogService>(),
          get<_i12.Logger>()));
  gh.factory<_i63.PrivacyPolicyViewModel>(() => _i63.PrivacyPolicyViewModel(
      get<_i9.AssetBundle>(), get<_i5.AppRouter>(), get<_i12.Logger>()));
  gh.factory<_i64.SelectDeckDialogViewModel>(() =>
      _i64.SelectDeckDialogViewModel(
          get<_i5.AppRouter>(),
          get<_i21.DataManager>(),
          get<_i5.DialogService>(),
          get<_i12.Logger>()));
  gh.lazySingleton<_i65.SettingsDataManager>(
      () => _i65.SettingsDataManagerImpl(get<_i36.SettingsStorageProvider>()));
  gh.lazySingleton<_i66.SettingsStorageProvider>(() =>
      _i66.SettingsStorageProviderImpl(get<_i43.SharedPreferencesProvider>()));
  await gh.lazySingletonAsync<_i67.SharedPreferences>(
      () => sharedPreferencesModule.provideSharedPreferences(),
      preResolve: true);
  gh.lazySingleton<_i68.SharedPreferencesProvider>(
      () => _i68.SharedPreferencesProviderImpl(get<_i67.SharedPreferences>()));
  gh.lazySingleton<_i69.SmartDuelServer>(() => _i69.SmartDuelServerImpl(
      get<_i70.WebSocketFactory>(), get<_i12.Logger>()));
  gh.lazySingleton<_i71.SnackBarService>(() => _i71.SnackBarServiceImpl());
  gh.factory<_i72.Socket>(
      () => socketIoModule.provideSocket(get<_i21.DataManager>()));
  gh.lazySingleton<_i73.SpeedDuelDialogProvider>(
      () => _i73.SpeedDuelDialogProvider());
  gh.lazySingleton<_i74.SpeedDuelEventEmitter>(() => _i74.SpeedDuelEventEmitter(
      get<_i40.SmartDuelServer>(), get<_i19.EnumHelper>(), get<_i12.Logger>()));
  gh.factoryParam<_i75.SpeedDuelViewModel, _i40.DuelRoom?, dynamic>(
      (_duelRoom, _) => _i75.SpeedDuelViewModel(
          _duelRoom,
          get<_i5.AppRouter>(),
          get<_i40.SmartDuelServer>(),
          get<_i20.CreatePlayerStateUseCase>(),
          get<_i18.CreatePlayCardUseCase>(),
          get<_i34.DoesCardFitInZoneUseCase>(),
          get<_i10.CanCardAttackZoneUseCase>(),
          get<_i54.MoveCardUseCase>(),
          get<_i74.SpeedDuelEventEmitter>(),
          get<_i11.CardEventAnimationHandler>(),
          get<_i21.DataManager>(),
          get<_i53.CrashlyticsProvider>(),
          get<_i29.SnackBarService>(),
          get<_i12.Logger>()));
  gh.lazySingleton<_i76.StringProvider>(() => _i76.StringProviderImpl());
  gh.lazySingleton<_i77.TwitterApi>(
      () => twitterModule.provideTwitterApi(get<_i4.AppConfig>()));
  gh.lazySingleton<_i78.TwitterProvider>(
      () => _i78.TwitterProviderImpl(get<_i77.TwitterApi>()));
  gh.lazySingleton<_i79.UrlLauncherProvider>(
      () => _i79.UrlLauncherProviderImpl());
  gh.factory<_i80.UserSettingsViewModel>(() => _i80.UserSettingsViewModel(
      get<_i21.DataManager>(),
      get<_i29.SnackBarService>(),
      get<_i25.StringProvider>(),
      get<_i51.Logger>()));
  gh.lazySingleton<_i81.WebSocketFactory>(() => _i81.WebSocketFactoryImpl());
  gh.factory<_i82.WebSocketProvider>(
      () => _i82.WebSocketProviderImpl(get<_i72.Socket>(), get<_i12.Logger>()));
  gh.lazySingleton<_i83.YgoProDeckRestClient>(
      () => _i83.YgoProDeckRestClient(get<_i32.Dio>()));
  gh.factoryParam<_i84.YugiohCardDetailViewModel, _i21.YugiohCard?, int?>(
      (_yugiohCard, _index) => _i84.YugiohCardDetailViewModel(
          _yugiohCard, _index, get<_i12.Logger>()));
  gh.lazySingleton<_i85.YugiohCardsDataManager>(() =>
      _i85.YugiohCardsDataManagerImpl(get<_i86.YgoProDeckApiProvider>(),
          get<_i36.YugiohCardsStorageProvider>()));
  gh.lazySingleton<_i87.YugiohCardsStorageProvider>(
      () => _i87.YugiohCardsStorageProviderImpl());
  gh.lazySingleton<_i88.CloudDatabaseProvider>(
      () => _i89.FirebaseCloudDatabaseProvider(get<_i47.FirebaseFirestore>()));
  gh.lazySingleton<_i15.CrashlyticsProvider>(
      () => _i90.FirebaseCrashlyticsProvider(get<_i46.FirebaseCrashlytics>()),
      registerFor: {_mobile});
  gh.lazySingleton<_i91.YgoProDeckApiProvider>(
      () => _i91.YgoProDeckApiProviderImpl(get<_i83.YgoProDeckRestClient>()));
  return get;
}

class _$FlutterModule extends _i92.FlutterModule {}

class _$LocalizationModule extends _i93.LocalizationModule {}

class _$YgoProDeckModule extends _i94.YgoProDeckModule {}

class _$CrashlyticsModule extends _i95.CrashlyticsModule {}

class _$CloudDatabaseModule extends _i96.CloudDatabaseModule {}

class _$SharedPreferencesModule extends _i97.SharedPreferencesModule {}

class _$SocketIoModule extends _i98.SocketIoModule {}

class _$TwitterModule extends _i99.TwitterModule {}
