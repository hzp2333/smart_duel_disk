// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart' as _i42;
import 'package:dart_twitter_api/twitter_api.dart' as _i67;
import 'package:dio/dio.dart' as _i28;
import 'package:firebase_crashlytics/firebase_crashlytics.dart' as _i41;
import 'package:flutter/services.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i59;
import 'package:socket_io_client/socket_io_client.dart' as _i64;

import '../../packages/core/core_config/lib/core_config.dart' as _i4;
import '../../packages/core/core_config/lib/src/providers/dio_plugin_provider/dio_plugin_provider.dart'
    as _i29;
import '../../packages/core/core_data_manager/lib/core_data_manager_interface.dart'
    as _i19;
import '../../packages/core/core_data_manager/lib/src/data_manager.dart'
    as _i20;
import '../../packages/core/core_data_manager/lib/src/deck/deck_data_manager.dart'
    as _i23;
import '../../packages/core/core_data_manager/lib/src/duel/duel_data_manager.dart'
    as _i31;
import '../../packages/core/core_data_manager/lib/src/news/news_data_manager.dart'
    as _i49;
import '../../packages/core/core_data_manager/lib/src/yugioh_cards/yugioh_cards_data_manager.dart'
    as _i74;
import '../../packages/core/core_general/lib/core_general.dart' as _i53;
import '../../packages/core/core_general/lib/src/formatters/date_formatter.dart'
    as _i21;
import '../../packages/core/core_logger/lib/core_logger.dart' as _i14;
import '../../packages/core/core_logger/lib/src/logger.dart' as _i45;
import '../../packages/core/core_logger/lib/src/logger_impl.dart' as _i46;
import '../../packages/core/core_messaging/lib/core_messaging.dart' as _i26;
import '../../packages/core/core_messaging/lib/src/snack_bar/snack_bar_service.dart'
    as _i63;
import '../../packages/core/core_navigation/lib/core_navigation.dart' as _i5;
import '../../packages/core/core_navigation/lib/src/app_router.dart' as _i3;
import '../../packages/core/core_navigation/lib/src/dialogs/dialog_service.dart'
    as _i27;
import '../../packages/core/core_smart_duel_server/lib/core_smart_duel_server.dart'
    as _i36;
import '../../packages/core/core_smart_duel_server/lib/src/smart_duel_server.dart'
    as _i61;
import '../../packages/core/core_storage/lib/core_storage.dart' as _i32;
import '../../packages/core/core_storage/lib/src/duel/duel_storage_provider.dart'
    as _i37;
import '../../packages/core/core_storage/lib/src/yugioh_cards/yugioh_cards_storage_provider.dart'
    as _i76;
import '../../packages/core/core_ygoprodeck/lib/core_ygoprodeck.dart' as _i75;
import '../../packages/core/core_ygoprodeck/lib/src/api/ygoprodeck_api.dart'
    as _i72;
import '../../packages/core/core_ygoprodeck/lib/src/di/ygoprodeck_module.dart'
    as _i82;
import '../../packages/core/core_ygoprodeck/lib/src/ygoprodeck_api_provider.dart'
    as _i80;
import '../../packages/features/feature_deck_builder/lib/src/deck_builder/deck_builder_viewmodel.dart'
    as _i22;
import '../../packages/features/feature_duel_room/lib/src/duel_room_viewmodel.dart'
    as _i35;
import '../../packages/features/feature_home/lib/feature_home.dart' as _i7;
import '../../packages/features/feature_home/lib/src/deck/deck_viewmodel.dart'
    as _i25;
import '../../packages/features/feature_home/lib/src/duel/dialogs/duel_dialog_provider.dart'
    as _i33;
import '../../packages/features/feature_home/lib/src/duel/dialogs/select_deck/select_deck_dialog_viewmodel.dart'
    as _i58;
import '../../packages/features/feature_home/lib/src/duel/duel_viewmodel.dart'
    as _i39;
import '../../packages/features/feature_home/lib/src/duel/mixins/duel_form_validators.dart'
    as _i34;
import '../../packages/features/feature_home/lib/src/home/home_viewmodel.dart'
    as _i43;
import '../../packages/features/feature_home/lib/src/news/news_viewmodel.dart'
    as _i52;
import '../../packages/features/feature_onboarding/lib/src/onboarding/onboarding_viewmodel.dart'
    as _i54;
import '../../packages/features/feature_privacy_policy/lib/src/privacy_policy_viewmodel.dart'
    as _i57;
import '../../packages/features/feature_speed_duel/lib/feature_speed_duel.dart'
    as _i8;
import '../../packages/features/feature_speed_duel/lib/src/dialogs/play_card_dialog/models/play_card_dialog_parameters.dart'
    as _i56;
import '../../packages/features/feature_speed_duel/lib/src/dialogs/play_card_dialog/play_card_dialog_viewmodel.dart'
    as _i55;
import '../../packages/features/feature_speed_duel/lib/src/dialogs/play_card_dialog/use_cases/create_play_card_dialog_actions_use_case.dart'
    as _i13;
import '../../packages/features/feature_speed_duel/lib/src/dialogs/speed_duel_dialog_provider.dart'
    as _i65;
import '../../packages/features/feature_speed_duel/lib/src/speed_duel_viewmodel.dart'
    as _i66;
import '../../packages/features/feature_speed_duel/lib/src/usecases/create_play_card_use_case.dart'
    as _i15;
import '../../packages/features/feature_speed_duel/lib/src/usecases/create_player_state_use_case.dart'
    as _i18;
import '../../packages/features/feature_speed_duel/lib/src/usecases/does_card_fit_in_zone_use_case.dart'
    as _i30;
import '../../packages/features/feature_speed_duel/lib/src/usecases/move_card_use_case.dart'
    as _i48;
import '../../packages/features/feature_yugioh_card_detail/lib/src/yugioh_card_detail_viewmodel.dart'
    as _i73;
import '../../packages/wrappers/wrapper_assets/lib/src/assets_provider.dart'
    as _i10;
import '../../packages/wrappers/wrapper_assets/lib/wrapper_assets.dart' as _i16;
import '../../packages/wrappers/wrapper_cloud_database/lib/src/cloud_database_provider.dart'
    as _i77;
import '../../packages/wrappers/wrapper_cloud_database/lib/src/di/cloud_database_module.dart'
    as _i84;
import '../../packages/wrappers/wrapper_cloud_database/lib/src/firebase/firebase_cloud_database_provider.dart'
    as _i78;
import '../../packages/wrappers/wrapper_cloud_database/lib/wrapper_cloud_database.dart'
    as _i24;
import '../../packages/wrappers/wrapper_crashlytics/lib/src/crashlytics_provider.dart'
    as _i11;
import '../../packages/wrappers/wrapper_crashlytics/lib/src/di/crashlytics_module.dart'
    as _i83;
import '../../packages/wrappers/wrapper_crashlytics/lib/src/firebase/firebase_crashlytics_provider.dart'
    as _i79;
import '../../packages/wrappers/wrapper_crashlytics/lib/src/web/web_crashlytics_provider.dart'
    as _i12;
import '../../packages/wrappers/wrapper_crashlytics/lib/wrapper_crashlytics.dart'
    as _i47;
import '../../packages/wrappers/wrapper_enum_helper/lib/src/enum_helper.dart'
    as _i40;
import '../../packages/wrappers/wrapper_enum_helper/lib/wrapper_enum_helper.dart'
    as _i17;
import '../../packages/wrappers/wrapper_html_unescape/lib/src/html_unescape_provider.dart'
    as _i44;
import '../../packages/wrappers/wrapper_html_unescape/lib/wrapper_html_unescape.dart'
    as _i51;
import '../../packages/wrappers/wrapper_shared_preferences/lib/src/di/shared_preferences_module.dart'
    as _i85;
import '../../packages/wrappers/wrapper_shared_preferences/lib/src/shared_preferences_provider.dart'
    as _i60;
import '../../packages/wrappers/wrapper_shared_preferences/lib/wrapper_shared_preferences.dart'
    as _i38;
import '../../packages/wrappers/wrapper_twitter/lib/src/di/twitter_module.dart'
    as _i87;
import '../../packages/wrappers/wrapper_twitter/lib/src/twitter_provider.dart'
    as _i68;
import '../../packages/wrappers/wrapper_twitter/lib/wrapper_twitter.dart'
    as _i50;
import '../../packages/wrappers/wrapper_url_launcher/lib/src/url_launcher_provider.dart'
    as _i69;
import '../../packages/wrappers/wrapper_url_launcher/lib/wrapper_url_launcher.dart'
    as _i6;
import '../../packages/wrappers/wrapper_web_socket/lib/src/di/web_socket_module.dart'
    as _i86;
import '../../packages/wrappers/wrapper_web_socket/lib/src/web_socket_factory.dart'
    as _i70;
import '../../packages/wrappers/wrapper_web_socket/lib/src/web_socket_provider.dart'
    as _i71;
import '../../packages/wrappers/wrapper_web_socket/lib/wrapper_web_socket.dart'
    as _i62;
import 'modules/flutter_module.dart' as _i81;

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
  gh.lazySingleton<_i11.CrashlyticsProvider>(
      () => _i12.WebCrashlyticsProvider(),
      registerFor: {_web});
  gh.lazySingleton<_i13.CreatePlayCardDialogActionsUseCase>(
      () => _i13.CreatePlayCardDialogActionsUseCase(get<_i14.Logger>()));
  gh.lazySingleton<_i15.CreatePlayCardUseCase>(() => _i15.CreatePlayCardUseCase(
      get<_i16.AssetsProvider>(), get<_i17.EnumHelper>()));
  gh.lazySingleton<_i18.CreatePlayerStateUseCase>(() =>
      _i18.CreatePlayerStateUseCase(
          get<_i19.DataManager>(), get<_i15.CreatePlayCardUseCase>()));
  gh.lazySingleton<_i20.DataManager>(() => _i20.DataManagerImpl(
      get<_i19.NewsDataManager>(),
      get<_i19.YugiohCardsDataManager>(),
      get<_i19.DeckDataManager>(),
      get<_i19.DuelDataManager>()));
  gh.lazySingleton<_i21.DateFormatter>(() => _i21.DateFormatter());
  gh.factoryParam<_i22.DeckBuilderViewModel, _i19.PreBuiltDeck, dynamic>(
      (_preBuiltDeck, _) => _i22.DeckBuilderViewModel(get<_i14.Logger>(),
          _preBuiltDeck, get<_i5.AppRouter>(), get<_i19.DataManager>()));
  gh.lazySingleton<_i23.DeckDataManager>(
      () => _i23.DeckDataManagerImpl(get<_i24.CloudDatabaseProvider>()));
  gh.factory<_i25.DeckViewModel>(() => _i25.DeckViewModel(
      get<_i14.Logger>(), get<_i5.AppRouter>(), get<_i26.SnackBarService>()));
  gh.lazySingleton<_i27.DialogService>(
      () => _i27.DialogServiceImpl(get<_i5.AutoRouteRouter>()));
  gh.lazySingleton<_i28.Dio>(() => ygoProDeckModule.provideYgoProDeckDio(
      get<_i4.AppConfig>(), get<_i4.DioPluginProvider>(), get<_i14.Logger>()));
  gh.lazySingleton<_i29.DioPluginProvider>(() => _i29.DioPluginProviderImpl());
  gh.lazySingleton<_i30.DoesCardFitInZoneUseCase>(
      () => _i30.DoesCardFitInZoneUseCase());
  gh.lazySingleton<_i31.DuelDataManager>(() => _i31.DuelDataManagerImpl(
      get<_i4.AppConfig>(), get<_i32.DuelStorageProvider>()));
  gh.lazySingleton<_i33.DuelDialogProvider>(() => _i33.DuelDialogProvider());
  gh.lazySingleton<_i34.DuelFormValidators>(() => _i34.DuelFormValidators());
  gh.factoryParam<_i35.DuelRoomViewModel, _i19.PreBuiltDeck, dynamic>(
      (_preBuiltDeck, _) => _i35.DuelRoomViewModel(
          get<_i14.Logger>(),
          _preBuiltDeck,
          get<_i5.AppRouter>(),
          get<_i36.SmartDuelServer>(),
          get<_i19.DataManager>()));
  gh.lazySingleton<_i37.DuelStorageProvider>(() =>
      _i37.DuelStorageProviderImpl(get<_i38.SharedPreferencesProvider>()));
  gh.factory<_i39.DuelViewModel>(() => _i39.DuelViewModel(
      get<_i14.Logger>(),
      get<_i34.DuelFormValidators>(),
      get<_i5.AppRouter>(),
      get<_i19.DataManager>()));
  gh.lazySingleton<_i40.EnumHelper>(() => _i40.EnumHelperImpl());
  gh.lazySingleton<_i41.FirebaseCrashlytics>(
      () => crashlyticsModule.provideFirebaseCrashlytics());
  gh.lazySingleton<_i42.FirebaseFirestore>(
      () => cloudDatabaseModule.provideFirebaseFirestore());
  gh.factory<_i43.HomeViewModel>(() => _i43.HomeViewModel(get<_i14.Logger>()));
  gh.lazySingleton<_i44.HtmlUnescapeProvider>(
      () => _i44.HtmlUnescapeProviderImpl());
  gh.lazySingleton<_i45.Logger>(() =>
      _i46.LoggerImpl(get<_i47.CrashlyticsProvider>(), get<_i4.AppConfig>()));
  gh.lazySingleton<_i48.MoveCardUseCase>(() => _i48.MoveCardUseCase());
  gh.lazySingleton<_i49.NewsDataManager>(() => _i49.NewsDataManagerImpl(
      get<_i4.AppConfig>(),
      get<_i50.TwitterProvider>(),
      get<_i51.HtmlUnescapeProvider>()));
  gh.factory<_i52.NewsViewModel>(() => _i52.NewsViewModel(
      get<_i14.Logger>(),
      get<_i5.AppRouter>(),
      get<_i19.DataManager>(),
      get<_i53.DateFormatter>(),
      get<_i47.CrashlyticsProvider>()));
  gh.factory<_i54.OnboardingViewModel>(() => _i54.OnboardingViewModel(
      get<_i14.Logger>(), get<_i5.AppRouter>(), get<_i19.DataManager>()));
  gh.factoryParam<_i55.PlayCardDialogViewModel, _i56.PlayCardDialogParameters,
          dynamic>(
      (_parameters, _) => _i55.PlayCardDialogViewModel(
          _parameters,
          get<_i13.CreatePlayCardDialogActionsUseCase>(),
          get<_i5.DialogService>(),
          get<_i14.Logger>()));
  gh.factory<_i57.PrivacyPolicyViewModel>(() => _i57.PrivacyPolicyViewModel(
      get<_i16.AssetsProvider>(),
      get<_i9.AssetBundle>(),
      get<_i5.AppRouter>(),
      get<_i14.Logger>()));
  gh.factory<_i58.SelectDeckDialogViewModel>(() =>
      _i58.SelectDeckDialogViewModel(
          get<_i5.AppRouter>(), get<_i5.DialogService>(), get<_i14.Logger>()));
  await gh.lazySingletonAsync<_i59.SharedPreferences>(
      () => sharedPreferencesModule.provideSharedPreferences(),
      preResolve: true);
  gh.lazySingleton<_i60.SharedPreferencesProvider>(
      () => _i60.SharedPreferencesProviderImpl(get<_i59.SharedPreferences>()));
  gh.lazySingleton<_i61.SmartDuelServer>(() => _i61.SmartDuelServerImpl(
      get<_i62.WebSocketFactory>(), get<_i14.Logger>()));
  gh.lazySingleton<_i63.SnackBarService>(() => _i63.SnackBarServiceImpl());
  gh.factory<_i64.Socket>(
      () => socketIoModule.provideSocket(get<_i19.DataManager>()));
  gh.lazySingleton<_i65.SpeedDuelDialogProvider>(
      () => _i65.SpeedDuelDialogProvider());
  gh.factoryParam<_i66.SpeedDuelViewModel, _i36.DuelRoom, dynamic>(
      (_duelRoom, _) => _i66.SpeedDuelViewModel(
          get<_i14.Logger>(),
          _duelRoom,
          get<_i5.AppRouter>(),
          get<_i36.SmartDuelServer>(),
          get<_i18.CreatePlayerStateUseCase>(),
          get<_i15.CreatePlayCardUseCase>(),
          get<_i30.DoesCardFitInZoneUseCase>(),
          get<_i48.MoveCardUseCase>(),
          get<_i19.DataManager>(),
          get<_i17.EnumHelper>(),
          get<_i47.CrashlyticsProvider>(),
          get<_i26.SnackBarService>()));
  gh.lazySingleton<_i67.TwitterApi>(
      () => twitterModule.provideTwitterApi(get<_i4.AppConfig>()));
  gh.lazySingleton<_i68.TwitterProvider>(
      () => _i68.TwitterProviderImpl(get<_i67.TwitterApi>()));
  gh.lazySingleton<_i69.UrlLauncherProvider>(
      () => _i69.UrlLauncherProviderImpl());
  gh.lazySingleton<_i70.WebSocketFactory>(() => _i70.WebSocketFactoryImpl());
  gh.factory<_i71.WebSocketProvider>(
      () => _i71.WebSocketProviderImpl(get<_i64.Socket>(), get<_i14.Logger>()));
  gh.lazySingleton<_i72.YgoProDeckRestClient>(
      () => _i72.YgoProDeckRestClient(get<_i28.Dio>()));
  gh.factoryParam<_i73.YugiohCardDetailViewModel, _i19.YugiohCard, int>(
      (_yugiohCard, _index) => _i73.YugiohCardDetailViewModel(
          get<_i14.Logger>(), _yugiohCard, _index));
  gh.lazySingleton<_i74.YugiohCardsDataManager>(() =>
      _i74.YugiohCardsDataManagerImpl(get<_i75.YgoProDeckApiProvider>(),
          get<_i32.YugiohCardsStorageProvider>()));
  gh.lazySingleton<_i76.YugiohCardsStorageProvider>(
      () => _i76.YugiohCardsStorageProviderImpl());
  gh.lazySingleton<_i77.CloudDatabaseProvider>(() =>
      _i78.FirebaseCloudDatabaseProvider(
          get<_i42.FirebaseFirestore>(), get<_i17.EnumHelper>()));
  gh.lazySingleton<_i11.CrashlyticsProvider>(
      () => _i79.FirebaseCrashlyticsProvider(get<_i41.FirebaseCrashlytics>()),
      registerFor: {_mobile});
  gh.lazySingleton<_i80.YgoProDeckApiProvider>(
      () => _i80.YgoProDeckApiProviderImpl(get<_i72.YgoProDeckRestClient>()));
  return get;
}

class _$FlutterModule extends _i81.FlutterModule {}

class _$YgoProDeckModule extends _i82.YgoProDeckModule {}

class _$CrashlyticsModule extends _i83.CrashlyticsModule {}

class _$CloudDatabaseModule extends _i84.CloudDatabaseModule {}

class _$SharedPreferencesModule extends _i85.SharedPreferencesModule {}

class _$SocketIoModule extends _i86.SocketIoModule {}

class _$TwitterModule extends _i87.TwitterModule {}
