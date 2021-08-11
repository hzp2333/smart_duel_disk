// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart' as _i18;
import 'package:dart_twitter_api/twitter_api.dart' as _i33;
import 'package:dio/dio.dart' as _i50;
import 'package:firebase_crashlytics/firebase_crashlytics.dart' as _i17;
import 'package:flutter/services.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i27;
import 'package:socket_io_client/socket_io_client.dart' as _i77;

import '../../packages/core/core_config/core_config_interface/lib/core_config_interface.dart'
    as _i25;
import '../../packages/core/core_data_manager/core_data_manager_impl/lib/src/data_manager.dart'
    as _i70;
import '../../packages/core/core_data_manager/core_data_manager_impl/lib/src/deck/deck_data_manager.dart'
    as _i49;
import '../../packages/core/core_data_manager/core_data_manager_impl/lib/src/duel/duel_data_manager.dart'
    as _i65;
import '../../packages/core/core_data_manager/core_data_manager_impl/lib/src/news/news_data_manager.dart'
    as _i52;
import '../../packages/core/core_data_manager/core_data_manager_impl/lib/src/yugioh_cards/yugioh_cards_data_manager.dart'
    as _i69;
import '../../packages/core/core_data_manager/core_data_manager_interface/lib/core_data_manager_interface.dart'
    as _i41;
import '../../packages/core/core_general/lib/core_general.dart' as _i75;
import '../../packages/core/core_general/lib/src/formatters/date_formatter.dart'
    as _i8;
import '../../packages/core/core_logger/core_logger_impl/lib/src/logger.dart'
    as _i24;
import '../../packages/core/core_logger/core_logger_interface/lib/core_logger_interface.dart'
    as _i23;
import '../../packages/core/core_logger/core_logger_interface/lib/src/logger.dart'
    as _i20;
import '../../packages/core/core_messaging/core_messaging_impl/lib/src/snack_bar/snack_bar_service_impl.dart'
    as _i31;
import '../../packages/core/core_messaging/core_messaging_interface/lib/core_messaging_interface.dart'
    as _i30;
import '../../packages/core/core_messaging/core_messaging_interface/lib/src/snack_bar/snack_bar_service.dart'
    as _i64;
import '../../packages/core/core_navigation/lib/core_navigation.dart' as _i55;
import '../../packages/core/core_navigation/lib/src/dialogs/dialog_service.dart'
    as _i9;
import '../../packages/core/core_smart_duel_server/core_smart_duel_server_impl/lib/src/smart_duel_server.dart'
    as _i61;
import '../../packages/core/core_smart_duel_server/core_smart_duel_server_interface/lib/core_smart_duel_server_interface.dart'
    as _i60;
import '../../packages/core/core_storage/core_storage_impl/lib/src/duel/duel_storage_provider.dart'
    as _i51;
import '../../packages/core/core_storage/core_storage_impl/lib/src/providers/shared_preferences/shared_preferences_impl/shared_preferences_provider.dart'
    as _i29;
import '../../packages/core/core_storage/core_storage_impl/lib/src/providers/shared_preferences/shared_preferences_interface/shared_preferences_provider.dart'
    as _i28;
import '../../packages/core/core_storage/core_storage_impl/lib/src/yugioh_cards/yugioh_cards_storage_provider.dart'
    as _i43;
import '../../packages/core/core_storage/core_storage_interface/lib/core_storage_interface.dart'
    as _i42;
import '../../packages/core/core_ygoprodeck/core_ygoprodeck_impl/lib/src/api/ygoprodeck_api.dart'
    as _i62;
import '../../packages/core/core_ygoprodeck/core_ygoprodeck_impl/lib/src/ygoprodeck_api_provider.dart'
    as _i68;
import '../../packages/core/core_ygoprodeck/core_ygoprodeck_interface/lib/core_ygoprodeck_interface.dart'
    as _i67;
import '../../packages/features/feature_deck_builder/lib/src/deck_builder/deck_builder_viewmodel.dart'
    as _i71;
import '../../packages/features/feature_duel_room/lib/src/duel_room_viewmodel.dart'
    as _i72;
import '../../packages/features/feature_home/lib/feature_home.dart' as _i57;
import '../../packages/features/feature_home/lib/src/deck/deck_viewmodel.dart'
    as _i63;
import '../../packages/features/feature_home/lib/src/duel/dialogs/duel_dialog_provider.dart'
    as _i13;
import '../../packages/features/feature_home/lib/src/duel/dialogs/select_deck/select_deck_dialog_viewmodel.dart'
    as _i59;
import '../../packages/features/feature_home/lib/src/duel/duel_viewmodel.dart'
    as _i73;
import '../../packages/features/feature_home/lib/src/duel/mixins/duel_form_validators.dart'
    as _i14;
import '../../packages/features/feature_home/lib/src/home/home_viewmodel.dart'
    as _i19;
import '../../packages/features/feature_home/lib/src/news/news_viewmodel.dart'
    as _i74;
import '../../packages/features/feature_onboarding/lib/src/onboarding/onboarding_viewmodel.dart'
    as _i76;
import '../../packages/features/feature_privacy_policy/lib/src/privacy_policy_viewmodel.dart'
    as _i66;
import '../../packages/features/feature_speed_duel/lib/feature_speed_duel.dart'
    as _i58;
import '../../packages/features/feature_speed_duel/lib/src/dialogs/play_card_dialog/models/play_card_dialog_parameters.dart'
    as _i54;
import '../../packages/features/feature_speed_duel/lib/src/dialogs/play_card_dialog/play_card_dialog_viewmodel.dart'
    as _i53;
import '../../packages/features/feature_speed_duel/lib/src/dialogs/play_card_dialog/use_cases/create_play_card_dialog_actions_use_case.dart'
    as _i47;
import '../../packages/features/feature_speed_duel/lib/src/dialogs/speed_duel_dialog_provider.dart'
    as _i32;
import '../../packages/features/feature_speed_duel/lib/src/speed_duel_viewmodel.dart'
    as _i80;
import '../../packages/features/feature_speed_duel/lib/src/usecases/create_play_card_use_case.dart'
    as _i48;
import '../../packages/features/feature_speed_duel/lib/src/usecases/create_player_state_use_case.dart'
    as _i79;
import '../../packages/features/feature_speed_duel/lib/src/usecases/does_card_fit_in_zone_use_case.dart'
    as _i12;
import '../../packages/features/feature_speed_duel/lib/src/usecases/move_card_use_case.dart'
    as _i26;
import '../../packages/features/feature_yugioh_card_detail/lib/src/yugioh_card_detail_viewmodel.dart'
    as _i40;
import '../../packages/wrappers/wrapper_assets/wrapper_assets_impl/lib/src/assets_provider.dart'
    as _i5;
import '../../packages/wrappers/wrapper_assets/wrapper_assets_interface/lib/wrapper_assets_interface.dart'
    as _i4;
import '../../packages/wrappers/wrapper_cloud_database/wrapper_cloud_database_impl/lib/src/firebase/firebase_cloud_database_provider.dart'
    as _i45;
import '../../packages/wrappers/wrapper_cloud_database/wrapper_cloud_database_interface/lib/wrapper_cloud_database_interface.dart'
    as _i44;
import '../../packages/wrappers/wrapper_crashlytics/wrapper_crashlytics_impl/lib/src/firebase/firebase_crashlytics_provider.dart'
    as _i46;
import '../../packages/wrappers/wrapper_crashlytics/wrapper_crashlytics_impl/lib/src/web/web_crashlytics_provider.dart'
    as _i7;
import '../../packages/wrappers/wrapper_crashlytics/wrapper_crashlytics_interface/lib/wrapper_crashlytics_interface.dart'
    as _i6;
import '../../packages/wrappers/wrapper_enum_helper/wrapper_enum_helper_impl/lib/src/enum_helper.dart'
    as _i16;
import '../../packages/wrappers/wrapper_enum_helper/wrapper_enum_helper_interface/lib/wrapper_enum_helper_interface.dart'
    as _i15;
import '../../packages/wrappers/wrapper_html_unescape/wrapper_html_unescape_impl/lib/src/html_unescape_provider.dart'
    as _i22;
import '../../packages/wrappers/wrapper_html_unescape/wrapper_html_unescape_interface/lib/wrapper_html_unescape_interface.dart'
    as _i21;
import '../../packages/wrappers/wrapper_twitter/wrapper_twitter_impl/lib/src/twitter_provider.dart'
    as _i35;
import '../../packages/wrappers/wrapper_twitter/wrapper_twitter_interface/lib/wrapper_twitter_interface.dart'
    as _i34;
import '../../packages/wrappers/wrapper_url_launcher/wrapper_url_launcher_impl/lib/src/url_launcher_provider.dart'
    as _i37;
import '../../packages/wrappers/wrapper_url_launcher/wrapper_url_launcher_interface/lib/wrapper_url_launcher_interface.dart'
    as _i36;
import '../../packages/wrappers/wrapper_web_socket/wrapper_web_socket_impl/lib/src/web_socket_factory.dart'
    as _i39;
import '../../packages/wrappers/wrapper_web_socket/wrapper_web_socket_impl/lib/src/web_socket_provider.dart'
    as _i78;
import '../../packages/wrappers/wrapper_web_socket/wrapper_web_socket_interface/lib/wrapper_web_socket_interface.dart'
    as _i38;
import '../navigation/dialogs/dialog_service.dart' as _i10;
import '../navigation/router.gr.dart' as _i11;
import '../navigation/router_helper.dart' as _i56;
import 'modules/core_modules.dart' as _i81;
import 'modules/third_party_modules.dart' as _i82;

const String _web = 'web';
const String _mobile = 'mobile';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String environment, _i2.EnvironmentFilter environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final flutterModule = _$FlutterModule();
  final firebaseModule = _$FirebaseModule();
  final sharedPreferencesModule = _$SharedPreferencesModule();
  final twitterModule = _$TwitterModule();
  final ygoProDeckModule = _$YgoProDeckModule();
  final socketIoModule = _$SocketIoModule();
  gh.lazySingleton<_i3.AssetBundle>(() => flutterModule.provideAssetBundle);
  gh.lazySingleton<_i4.AssetsProvider>(() => _i5.AssetsProviderImpl());
  gh.lazySingleton<_i6.CrashlyticsProvider>(() => _i7.WebCrashlyticsProvider(),
      registerFor: {_web});
  gh.lazySingleton<_i8.DateFormatter>(() => _i8.DateFormatter());
  gh.lazySingleton<_i9.DialogService>(
      () => _i10.DialogServiceImpl(get<_i11.AppRouter>()));
  gh.lazySingleton<_i12.DoesCardFitInZoneUseCase>(
      () => _i12.DoesCardFitInZoneUseCase());
  gh.lazySingleton<_i13.DuelDialogProvider>(() => _i13.DuelDialogProvider());
  gh.lazySingleton<_i14.DuelFormValidators>(() => _i14.DuelFormValidators());
  gh.lazySingleton<_i15.EnumHelper>(() => _i16.EnumHelperImpl());
  gh.lazySingleton<_i17.FirebaseCrashlytics>(
      () => firebaseModule.provideFirebaseCrashlytics());
  gh.lazySingleton<_i18.FirebaseFirestore>(
      () => firebaseModule.provideFirebaseFirestore());
  gh.factory<_i19.HomeViewModel>(() => _i19.HomeViewModel(get<_i20.Logger>()));
  gh.lazySingleton<_i21.HtmlUnescapeProvider>(
      () => _i22.HtmlUnescapeProviderImpl());
  gh.lazySingleton<_i23.Logger>(() =>
      _i24.LoggerImpl(get<_i6.CrashlyticsProvider>(), get<_i25.AppConfig>()));
  gh.lazySingleton<_i26.MoveCardUseCase>(() => _i26.MoveCardUseCase());
  await gh.lazySingletonAsync<_i27.SharedPreferences>(
      () => sharedPreferencesModule.provideSharedPreferences(),
      preResolve: true);
  gh.lazySingleton<_i28.SharedPreferencesProvider>(
      () => _i29.SharedPreferencesProviderImpl(get<_i27.SharedPreferences>()));
  gh.lazySingleton<_i30.SnackBarService>(() => _i31.SnackBarServiceImpl());
  gh.lazySingleton<_i32.SpeedDuelDialogProvider>(
      () => _i32.SpeedDuelDialogProvider());
  gh.lazySingleton<_i33.TwitterApi>(
      () => twitterModule.provideTwitterApi(get<_i25.AppConfig>()));
  gh.lazySingleton<_i34.TwitterProvider>(
      () => _i35.TwitterProviderImpl(get<_i33.TwitterApi>()));
  gh.lazySingleton<_i36.UrlLauncherProvider>(
      () => _i37.UrlLauncherProviderImpl());
  gh.lazySingleton<_i38.WebSocketFactory>(() => _i39.WebSocketFactoryImpl());
  gh.factoryParam<_i40.YugiohCardDetailViewModel, _i41.YugiohCard, int>(
      (_yugiohCard, _index) => _i40.YugiohCardDetailViewModel(
          get<_i23.Logger>(), _yugiohCard, _index));
  gh.lazySingleton<_i42.YugiohCardsStorageProvider>(
      () => _i43.YugiohCardsStorageProviderImpl());
  gh.lazySingleton<_i44.CloudDatabaseProvider>(() =>
      _i45.FirebaseCloudDatabaseProvider(
          get<_i18.FirebaseFirestore>(), get<_i15.EnumHelper>()));
  gh.lazySingleton<_i6.CrashlyticsProvider>(
      () => _i46.FirebaseCrashlyticsProvider(get<_i17.FirebaseCrashlytics>()),
      registerFor: {_mobile});
  gh.lazySingleton<_i47.CreatePlayCardDialogActionsUseCase>(
      () => _i47.CreatePlayCardDialogActionsUseCase(get<_i23.Logger>()));
  gh.lazySingleton<_i48.CreatePlayCardUseCase>(() => _i48.CreatePlayCardUseCase(
      get<_i4.AssetsProvider>(), get<_i15.EnumHelper>()));
  gh.lazySingleton<_i41.DeckDataManager>(
      () => _i49.DeckDataManagerImpl(get<_i44.CloudDatabaseProvider>()));
  gh.lazySingleton<_i50.Dio>(() => ygoProDeckModule.provideYgoProDeckDio(
      get<_i25.AppConfig>(), get<_i23.Logger>()));
  gh.lazySingleton<_i42.DuelStorageProvider>(() =>
      _i51.DuelStorageProviderImpl(get<_i28.SharedPreferencesProvider>()));
  gh.lazySingleton<_i41.NewsDataManager>(() => _i52.NewsDataManagerImpl(
      get<_i25.AppConfig>(),
      get<_i34.TwitterProvider>(),
      get<_i21.HtmlUnescapeProvider>()));
  gh.factoryParam<_i53.PlayCardDialogViewModel, _i54.PlayCardDialogParameters,
          dynamic>(
      (_parameters, _) => _i53.PlayCardDialogViewModel(
          _parameters,
          get<_i47.CreatePlayCardDialogActionsUseCase>(),
          get<_i55.DialogService>(),
          get<_i20.Logger>()));
  gh.lazySingleton<_i55.RouterHelper>(() => _i56.RouterHelperImpl(
      get<_i25.AppConfig>(),
      get<_i11.AppRouter>(),
      get<_i55.DialogService>(),
      get<_i36.UrlLauncherProvider>(),
      get<_i57.DuelDialogProvider>(),
      get<_i58.SpeedDuelDialogProvider>()));
  gh.factory<_i59.SelectDeckDialogViewModel>(() =>
      _i59.SelectDeckDialogViewModel(get<_i55.RouterHelper>(),
          get<_i55.DialogService>(), get<_i20.Logger>()));
  gh.lazySingleton<_i60.SmartDuelServer>(() => _i61.SmartDuelServerImpl(
      get<_i38.WebSocketFactory>(), get<_i23.Logger>()));
  gh.lazySingleton<_i62.YgoProDeckRestClient>(
      () => _i62.YgoProDeckRestClient(get<_i50.Dio>()));
  gh.factory<_i63.DeckViewModel>(() => _i63.DeckViewModel(get<_i23.Logger>(),
      get<_i55.RouterHelper>(), get<_i64.SnackBarService>()));
  gh.lazySingleton<_i41.DuelDataManager>(() => _i65.DuelDataManagerImpl(
      get<_i25.AppConfig>(), get<_i42.DuelStorageProvider>()));
  gh.factory<_i66.PrivacyPolicyViewModel>(() => _i66.PrivacyPolicyViewModel(
      get<_i4.AssetsProvider>(),
      get<_i3.AssetBundle>(),
      get<_i55.RouterHelper>(),
      get<_i20.Logger>()));
  gh.lazySingleton<_i67.YgoProDeckApiProvider>(
      () => _i68.YgoProDeckApiProviderImpl(get<_i62.YgoProDeckRestClient>()));
  gh.lazySingleton<_i41.YugiohCardsDataManager>(() =>
      _i69.YugiohCardsDataManagerImpl(get<_i67.YgoProDeckApiProvider>(),
          get<_i42.YugiohCardsStorageProvider>()));
  gh.lazySingleton<_i41.DataManager>(() => _i70.DataManagerImpl(
      get<_i41.NewsDataManager>(),
      get<_i41.YugiohCardsDataManager>(),
      get<_i41.DeckDataManager>(),
      get<_i41.DuelDataManager>()));
  gh.factoryParam<_i71.DeckBuilderViewModel, _i41.PreBuiltDeck, dynamic>(
      (_preBuiltDeck, _) => _i71.DeckBuilderViewModel(get<_i23.Logger>(),
          _preBuiltDeck, get<_i55.RouterHelper>(), get<_i41.DataManager>()));
  gh.factoryParam<_i72.DuelRoomViewModel, _i41.PreBuiltDeck, dynamic>(
      (_preBuiltDeck, _) => _i72.DuelRoomViewModel(
          get<_i20.Logger>(),
          _preBuiltDeck,
          get<_i55.RouterHelper>(),
          get<_i60.SmartDuelServer>(),
          get<_i41.DataManager>()));
  gh.factory<_i73.DuelViewModel>(() => _i73.DuelViewModel(
      get<_i23.Logger>(),
      get<_i14.DuelFormValidators>(),
      get<_i55.RouterHelper>(),
      get<_i41.DataManager>()));
  gh.factory<_i74.NewsViewModel>(() => _i74.NewsViewModel(
      get<_i23.Logger>(),
      get<_i55.RouterHelper>(),
      get<_i41.DataManager>(),
      get<_i75.DateFormatter>(),
      get<_i6.CrashlyticsProvider>()));
  gh.factory<_i76.OnboardingViewModel>(() => _i76.OnboardingViewModel(
      get<_i20.Logger>(), get<_i55.RouterHelper>(), get<_i41.DataManager>()));
  gh.factory<_i77.Socket>(
      () => socketIoModule.provideSocket(get<_i41.DataManager>()));
  gh.factory<_i38.WebSocketProvider>(
      () => _i78.WebSocketProviderImpl(get<_i77.Socket>(), get<_i23.Logger>()));
  gh.lazySingleton<_i79.CreatePlayerStateUseCase>(() =>
      _i79.CreatePlayerStateUseCase(
          get<_i41.DataManager>(), get<_i48.CreatePlayCardUseCase>()));
  gh.factoryParam<_i80.SpeedDuelViewModel, _i60.DuelRoom, dynamic>(
      (_duelRoom, _) => _i80.SpeedDuelViewModel(
          get<_i23.Logger>(),
          _duelRoom,
          get<_i55.RouterHelper>(),
          get<_i60.SmartDuelServer>(),
          get<_i79.CreatePlayerStateUseCase>(),
          get<_i48.CreatePlayCardUseCase>(),
          get<_i12.DoesCardFitInZoneUseCase>(),
          get<_i26.MoveCardUseCase>(),
          get<_i41.DataManager>(),
          get<_i15.EnumHelper>(),
          get<_i6.CrashlyticsProvider>(),
          get<_i64.SnackBarService>()));
  return get;
}

class _$FlutterModule extends _i81.FlutterModule {}

class _$FirebaseModule extends _i82.FirebaseModule {}

class _$SharedPreferencesModule extends _i82.SharedPreferencesModule {}

class _$TwitterModule extends _i82.TwitterModule {}

class _$YgoProDeckModule extends _i81.YgoProDeckModule {}

class _$SocketIoModule extends _i82.SocketIoModule {}
