// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart' as _i15;
import 'package:dart_twitter_api/twitter_api.dart' as _i24;
import 'package:dio/dio.dart' as _i52;
import 'package:firebase_crashlytics/firebase_crashlytics.dart' as _i14;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i18;
import 'package:socket_io_client/socket_io_client.dart' as _i69;

import '../../packages/core/core_config/core_config_interface/lib/core_config_interface.dart'
    as _i25;
import '../../packages/core/core_data_manager/core_data_manager_impl/lib/src/data_manager.dart'
    as _i61;
import '../../packages/core/core_data_manager/core_data_manager_impl/lib/src/deck/deck_data_manager.dart'
    as _i37;
import '../../packages/core/core_data_manager/core_data_manager_impl/lib/src/duel/duel_data_manager.dart'
    as _i53;
import '../../packages/core/core_data_manager/core_data_manager_impl/lib/src/news/news_data_manager.dart'
    as _i42;
import '../../packages/core/core_data_manager/core_data_manager_impl/lib/src/yugioh_cards/yugioh_cards_data_manager.dart'
    as _i60;
import '../../packages/core/core_data_manager/core_data_manager_interface/lib/core_data_manager_interface.dart'
    as _i36;
import '../../packages/core/core_general/lib/core_general.dart' as _i66;
import '../../packages/core/core_general/lib/src/formatters/date_formatter.dart'
    as _i5;
import '../../packages/core/core_logger/core_logger_impl/lib/src/logger.dart'
    as _i41;
import '../../packages/core/core_logger/core_logger_interface/lib/core_logger_interface.dart'
    as _i40;
import '../../packages/core/core_logger/core_logger_interface/lib/src/logger.dart'
    as _i17;
import '../../packages/core/core_messaging/core_messaging_impl/lib/src/snack_bar/snack_bar_service_impl.dart'
    as _i22;
import '../../packages/core/core_messaging/core_messaging_interface/lib/core_messaging_interface.dart'
    as _i21;
import '../../packages/core/core_messaging/core_messaging_interface/lib/src/snack_bar/snack_bar_service.dart'
    as _i51;
import '../../packages/core/core_navigation/lib/core_navigation.dart' as _i43;
import '../../packages/core/core_navigation/lib/src/dialogs/dialog_service.dart'
    as _i6;
import '../../packages/core/core_smart_duel_server/core_smart_duel_server_impl/lib/src/smart_duel_server.dart'
    as _i68;
import '../../packages/core/core_smart_duel_server/core_smart_duel_server_interface/lib/core_smart_duel_server_interface.dart'
    as _i67;
import '../../packages/core/core_storage/core_storage_impl/lib/src/duel/duel_storage_provider.dart'
    as _i39;
import '../../packages/core/core_storage/core_storage_impl/lib/src/providers/shared_preferences/shared_preferences_impl/shared_preferences_provider.dart'
    as _i20;
import '../../packages/core/core_storage/core_storage_impl/lib/src/providers/shared_preferences/shared_preferences_interface/shared_preferences_provider.dart'
    as _i19;
import '../../packages/core/core_storage/core_storage_interface/lib/core_storage_interface.dart'
    as _i38;
import '../../packages/core/core_ygoprodeck/core_ygoprodeck_impl/lib/src/api/ygoprodeck_api.dart'
    as _i57;
import '../../packages/core/core_ygoprodeck/core_ygoprodeck_impl/lib/src/ygoprodeck_api_provider.dart'
    as _i59;
import '../../packages/core/core_ygoprodeck/core_ygoprodeck_interface/lib/core_ygoprodeck_interface.dart'
    as _i58;
import '../../packages/features/feature_deck_builder/lib/src/deck_builder/deck_builder_viewmodel.dart'
    as _i62;
import '../../packages/features/feature_home/lib/feature_home.dart' as _i45;
import '../../packages/features/feature_home/lib/src/deck/deck_viewmodel.dart'
    as _i50;
import '../../packages/features/feature_home/lib/src/duel/dialogs/duel_dialog_provider.dart'
    as _i10;
import '../../packages/features/feature_home/lib/src/duel/dialogs/select_deck/select_deck_dialog_viewmodel.dart'
    as _i47;
import '../../packages/features/feature_home/lib/src/duel/duel_viewmodel.dart'
    as _i63;
import '../../packages/features/feature_home/lib/src/duel/mixins/duel_form_validators.dart'
    as _i11;
import '../../packages/features/feature_home/lib/src/home/home_viewmodel.dart'
    as _i16;
import '../../packages/features/feature_home/lib/src/news/news_viewmodel.dart'
    as _i65;
import '../../packages/features/feature_speed_duel/lib/feature_speed_duel.dart'
    as _i46;
import '../../packages/features/feature_speed_duel/lib/src/dialogs/play_card_dialog/play_card_dialog_viewmodel.dart'
    as _i54;
import '../../packages/features/feature_speed_duel/lib/src/dialogs/play_card_dialog/use_cases/create_play_card_dialog_actions_use_case.dart'
    as _i49;
import '../../packages/features/feature_speed_duel/lib/src/dialogs/speed_duel_dialog_provider.dart'
    as _i23;
import '../../packages/features/feature_speed_duel/lib/src/models/play_card.dart'
    as _i55;
import '../../packages/features/feature_speed_duel/lib/src/models/zone.dart'
    as _i56;
import '../../packages/features/feature_speed_duel/lib/src/speed_duel_viewmodel.dart'
    as _i70;
import '../../packages/features/feature_speed_duel/lib/src/usecases/does_card_fit_in_zone_use_case.dart'
    as _i9;
import '../../packages/features/feature_speed_duel/lib/src/usecases/get_cards_from_deck_use_case.dart'
    as _i64;
import '../../packages/features/feature_yugioh_card_detail/lib/src/yugioh_card_detail_viewmodel.dart'
    as _i48;
import '../../packages/wrappers/wrapper_assets/wrapper_assets_impl/lib/src/assets_provider.dart'
    as _i4;
import '../../packages/wrappers/wrapper_assets/wrapper_assets_interface/lib/wrapper_assets_interface.dart'
    as _i3;
import '../../packages/wrappers/wrapper_cloud_database/wrapper_cloud_database_impl/lib/src/firebase/firebase_cloud_database_provider.dart'
    as _i33;
import '../../packages/wrappers/wrapper_cloud_database/wrapper_cloud_database_interface/lib/wrapper_cloud_database_interface.dart'
    as _i32;
import '../../packages/wrappers/wrapper_crashlytics/wrapper_crashlytics_impl/lib/src/firebase/firebase_crashlytics_provider.dart'
    as _i35;
import '../../packages/wrappers/wrapper_crashlytics/wrapper_crashlytics_interface/lib/wrapper_crashlytics_interface.dart'
    as _i34;
import '../../packages/wrappers/wrapper_enum_helper/wrapper_enum_helper_impl/lib/src/enum_helper.dart'
    as _i13;
import '../../packages/wrappers/wrapper_enum_helper/wrapper_enum_helper_interface/lib/wrapper_enum_helper_interface.dart'
    as _i12;
import '../../packages/wrappers/wrapper_twitter/wrapper_twitter_impl/lib/src/twitter_provider.dart'
    as _i27;
import '../../packages/wrappers/wrapper_twitter/wrapper_twitter_interface/lib/wrapper_twitter_interface.dart'
    as _i26;
import '../../packages/wrappers/wrapper_url_launcher/wrapper_url_launcher_impl/lib/src/url_launcher_provider.dart'
    as _i29;
import '../../packages/wrappers/wrapper_url_launcher/wrapper_url_launcher_interface/lib/wrapper_url_launcher_interface.dart'
    as _i28;
import '../../packages/wrappers/wrapper_web_socket/wrapper_web_socket_impl/lib/src/web_socket_factory.dart'
    as _i31;
import '../../packages/wrappers/wrapper_web_socket/wrapper_web_socket_impl/lib/src/web_socket_provider.dart'
    as _i71;
import '../../packages/wrappers/wrapper_web_socket/wrapper_web_socket_interface/lib/wrapper_web_socket_interface.dart'
    as _i30;
import '../navigation/dialogs/dialog_service.dart' as _i7;
import '../navigation/router.gr.dart' as _i8;
import '../navigation/router_helper.dart' as _i44;
import 'modules/core_modules.dart' as _i73;
import 'modules/third_party_modules.dart'
    as _i72; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String environment, _i2.EnvironmentFilter environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final firebaseModule = _$FirebaseModule();
  final sharedPreferencesModule = _$SharedPreferencesModule();
  final twitterModule = _$TwitterModule();
  final ygoProDeckModule = _$YgoProDeckModule();
  final socketIoModule = _$SocketIoModule();
  gh.lazySingleton<_i3.AssetsProvider>(() => _i4.AssetsProviderImpl());
  gh.lazySingleton<_i5.DateFormatter>(() => _i5.DateFormatter());
  gh.lazySingleton<_i6.DialogService>(
      () => _i7.DialogServiceImpl(get<_i8.AppRouter>()));
  gh.lazySingleton<_i9.DoesCardFitInZoneUseCase>(
      () => _i9.DoesCardFitInZoneUseCase());
  gh.lazySingleton<_i10.DuelDialogProvider>(() => _i10.DuelDialogProvider());
  gh.lazySingleton<_i11.DuelFormValidators>(() => _i11.DuelFormValidators());
  gh.lazySingleton<_i12.EnumHelper>(() => _i13.EnumHelperImpl());
  gh.lazySingleton<_i14.FirebaseCrashlytics>(
      () => firebaseModule.provideFirebaseCrashlytics());
  gh.lazySingleton<_i15.FirebaseFirestore>(
      () => firebaseModule.provideFirebaseFirestore());
  gh.factory<_i16.HomeViewModel>(() => _i16.HomeViewModel(get<_i17.Logger>()));
  await gh.lazySingletonAsync<_i18.SharedPreferences>(
      () => sharedPreferencesModule.provideSharedPreferences(),
      preResolve: true);
  gh.lazySingleton<_i19.SharedPreferencesProvider>(
      () => _i20.SharedPreferencesProviderImpl(get<_i18.SharedPreferences>()));
  gh.lazySingleton<_i21.SnackBarService>(() => _i22.SnackBarServiceImpl());
  gh.lazySingleton<_i23.SpeedDuelDialogProvider>(
      () => _i23.SpeedDuelDialogProvider());
  gh.lazySingleton<_i24.TwitterApi>(
      () => twitterModule.provideTwitterApi(get<_i25.AppConfig>()));
  gh.lazySingleton<_i26.TwitterProvider>(
      () => _i27.TwitterProviderImpl(get<_i24.TwitterApi>()));
  gh.lazySingleton<_i28.UrlLauncherProvider>(
      () => _i29.UrlLauncherProviderImpl());
  gh.lazySingleton<_i30.WebSocketFactory>(() => _i31.WebSocketFactoryImpl());
  gh.lazySingleton<_i32.CloudDatabaseProvider>(() =>
      _i33.FirebaseCloudDatabaseProvider(
          get<_i15.FirebaseFirestore>(), get<_i12.EnumHelper>()));
  gh.lazySingleton<_i34.CrashlyticsProvider>(
      () => _i35.FirebaseCrashlyticsProvider(get<_i14.FirebaseCrashlytics>()));
  gh.lazySingleton<_i36.DeckDataManager>(
      () => _i37.DeckDataManagerImpl(get<_i32.CloudDatabaseProvider>()));
  gh.lazySingleton<_i38.DuelStorageProvider>(() =>
      _i39.DuelStorageProviderImpl(get<_i19.SharedPreferencesProvider>()));
  gh.lazySingleton<_i40.Logger>(() =>
      _i41.LoggerImpl(get<_i34.CrashlyticsProvider>(), get<_i25.AppConfig>()));
  gh.lazySingleton<_i36.NewsDataManager>(() => _i42.NewsDataManagerImpl(
      get<_i25.AppConfig>(), get<_i26.TwitterProvider>()));
  gh.lazySingleton<_i43.RouterHelper>(() => _i44.RouterHelperImpl(
      get<_i25.AppConfig>(),
      get<_i8.AppRouter>(),
      get<_i43.DialogService>(),
      get<_i28.UrlLauncherProvider>(),
      get<_i45.DuelDialogProvider>(),
      get<_i46.SpeedDuelDialogProvider>()));
  gh.factory<_i47.SelectDeckDialogViewModel>(() =>
      _i47.SelectDeckDialogViewModel(get<_i43.RouterHelper>(),
          get<_i43.DialogService>(), get<_i17.Logger>()));
  gh.factoryParam<_i48.YugiohCardDetailViewModel, _i36.YugiohCard, int>(
      (_yugiohCard, _index) => _i48.YugiohCardDetailViewModel(
          get<_i40.Logger>(), _yugiohCard, _index));
  gh.lazySingleton<_i49.CreatePlayCardDialogActionsUseCase>(
      () => _i49.CreatePlayCardDialogActionsUseCase(get<_i40.Logger>()));
  gh.factory<_i50.DeckViewModel>(() => _i50.DeckViewModel(get<_i40.Logger>(),
      get<_i43.RouterHelper>(), get<_i51.SnackBarService>()));
  gh.lazySingleton<_i52.Dio>(() => ygoProDeckModule.provideYgoProDeckDio(
      get<_i25.AppConfig>(), get<_i40.Logger>()));
  gh.lazySingleton<_i36.DuelDataManager>(
      () => _i53.DuelDataManagerImpl(get<_i38.DuelStorageProvider>()));
  gh.factoryParam<_i54.PlayCardDialogViewModel, _i55.PlayCard, _i56.Zone>(
      (_playCard, _newZone) => _i54.PlayCardDialogViewModel(
          _playCard,
          _newZone,
          get<_i49.CreatePlayCardDialogActionsUseCase>(),
          get<_i43.DialogService>(),
          get<_i17.Logger>()));
  gh.lazySingleton<_i57.YgoProDeckRestClient>(
      () => _i57.YgoProDeckRestClient(get<_i52.Dio>()));
  gh.lazySingleton<_i58.YgoProDeckApiProvider>(
      () => _i59.YgoProDeckApiProviderImpl(get<_i57.YgoProDeckRestClient>()));
  gh.lazySingleton<_i36.YugiohCardsDataManager>(
      () => _i60.YugiohCardsDataManagerImpl(get<_i58.YgoProDeckApiProvider>()));
  gh.lazySingleton<_i36.DataManager>(() => _i61.DataManagerImpl(
      get<_i36.NewsDataManager>(),
      get<_i36.YugiohCardsDataManager>(),
      get<_i36.DeckDataManager>(),
      get<_i36.DuelDataManager>()));
  gh.factoryParam<_i62.DeckBuilderViewModel, _i36.PreBuiltDeck, dynamic>(
      (_preBuiltDeck, _) => _i62.DeckBuilderViewModel(get<_i40.Logger>(),
          _preBuiltDeck, get<_i43.RouterHelper>(), get<_i36.DataManager>()));
  gh.factory<_i63.DuelViewModel>(() => _i63.DuelViewModel(
      get<_i40.Logger>(),
      get<_i11.DuelFormValidators>(),
      get<_i43.RouterHelper>(),
      get<_i36.DataManager>()));
  gh.lazySingleton<_i64.GetCardsFromDeckUseCase>(() =>
      _i64.GetCardsFromDeckUseCase(get<_i36.DataManager>(),
          get<_i3.AssetsProvider>(), get<_i12.EnumHelper>()));
  gh.factory<_i65.NewsViewModel>(() => _i65.NewsViewModel(
      get<_i40.Logger>(),
      get<_i43.RouterHelper>(),
      get<_i36.DataManager>(),
      get<_i66.DateFormatter>(),
      get<_i34.CrashlyticsProvider>()));
  gh.lazySingleton<_i67.SmartDuelServer>(() => _i68.SmartDuelServerImpl(
      get<_i30.WebSocketFactory>(), get<_i36.DataManager>()));
  gh.factory<_i69.Socket>(
      () => socketIoModule.provideSocket(get<_i36.DataManager>()));
  gh.factoryParam<_i70.SpeedDuelViewModel, _i36.PreBuiltDeck, dynamic>(
      (_preBuiltDeck, _) => _i70.SpeedDuelViewModel(
          get<_i40.Logger>(),
          _preBuiltDeck,
          get<_i43.RouterHelper>(),
          get<_i67.SmartDuelServer>(),
          get<_i64.GetCardsFromDeckUseCase>(),
          get<_i9.DoesCardFitInZoneUseCase>(),
          get<_i12.EnumHelper>(),
          get<_i34.CrashlyticsProvider>(),
          get<_i51.SnackBarService>()));
  gh.factory<_i30.WebSocketProvider>(
      () => _i71.WebSocketProviderImpl(get<_i69.Socket>(), get<_i40.Logger>()));
  return get;
}

class _$FirebaseModule extends _i72.FirebaseModule {}

class _$SharedPreferencesModule extends _i72.SharedPreferencesModule {}

class _$TwitterModule extends _i72.TwitterModule {}

class _$YgoProDeckModule extends _i73.YgoProDeckModule {}

class _$SocketIoModule extends _i72.SocketIoModule {}
