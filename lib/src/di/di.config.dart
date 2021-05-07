// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart' as _i15;
import 'package:dart_twitter_api/twitter_api.dart' as _i26;
import 'package:dio/dio.dart' as _i56;
import 'package:firebase_crashlytics/firebase_crashlytics.dart' as _i14;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i20;
import 'package:socket_io_client/socket_io_client.dart' as _i74;

import '../../packages/core/core_config/core_config_interface/lib/core_config_interface.dart'
    as _i27;
import '../../packages/core/core_data_manager/core_data_manager_impl/lib/src/data_manager.dart'
    as _i65;
import '../../packages/core/core_data_manager/core_data_manager_impl/lib/src/deck/deck_data_manager.dart'
    as _i42;
import '../../packages/core/core_data_manager/core_data_manager_impl/lib/src/duel/duel_data_manager.dart'
    as _i57;
import '../../packages/core/core_data_manager/core_data_manager_impl/lib/src/news/news_data_manager.dart'
    as _i46;
import '../../packages/core/core_data_manager/core_data_manager_impl/lib/src/yugioh_cards/yugioh_cards_data_manager.dart'
    as _i64;
import '../../packages/core/core_data_manager/core_data_manager_interface/lib/core_data_manager_interface.dart'
    as _i41;
import '../../packages/core/core_general/lib/core_general.dart' as _i70;
import '../../packages/core/core_general/lib/src/formatters/date_formatter.dart'
    as _i5;
import '../../packages/core/core_logger/core_logger_impl/lib/src/logger.dart'
    as _i45;
import '../../packages/core/core_logger/core_logger_interface/lib/core_logger_interface.dart'
    as _i44;
import '../../packages/core/core_logger/core_logger_interface/lib/src/logger.dart'
    as _i17;
import '../../packages/core/core_messaging/core_messaging_impl/lib/src/snack_bar/snack_bar_service_impl.dart'
    as _i24;
import '../../packages/core/core_messaging/core_messaging_interface/lib/core_messaging_interface.dart'
    as _i23;
import '../../packages/core/core_messaging/core_messaging_interface/lib/src/snack_bar/snack_bar_service.dart'
    as _i55;
import '../../packages/core/core_navigation/lib/core_navigation.dart' as _i47;
import '../../packages/core/core_navigation/lib/src/dialogs/dialog_service.dart'
    as _i6;
import '../../packages/core/core_smart_duel_server/core_smart_duel_server_impl/lib/src/smart_duel_server.dart'
    as _i73;
import '../../packages/core/core_smart_duel_server/core_smart_duel_server_interface/lib/core_smart_duel_server_interface.dart'
    as _i72;
import '../../packages/core/core_storage/core_storage_impl/lib/src/duel/duel_storage_provider.dart'
    as _i43;
import '../../packages/core/core_storage/core_storage_impl/lib/src/providers/shared_preferences/shared_preferences_impl/shared_preferences_provider.dart'
    as _i22;
import '../../packages/core/core_storage/core_storage_impl/lib/src/providers/shared_preferences/shared_preferences_interface/shared_preferences_provider.dart'
    as _i21;
import '../../packages/core/core_storage/core_storage_impl/lib/src/yugioh_cards/yugioh_cards_storage_provider.dart'
    as _i35;
import '../../packages/core/core_storage/core_storage_interface/lib/core_storage_interface.dart'
    as _i34;
import '../../packages/core/core_ygoprodeck/core_ygoprodeck_impl/lib/src/api/ygoprodeck_api.dart'
    as _i61;
import '../../packages/core/core_ygoprodeck/core_ygoprodeck_impl/lib/src/ygoprodeck_api_provider.dart'
    as _i63;
import '../../packages/core/core_ygoprodeck/core_ygoprodeck_interface/lib/core_ygoprodeck_interface.dart'
    as _i62;
import '../../packages/features/feature_deck_builder/lib/src/deck_builder/deck_builder_viewmodel.dart'
    as _i66;
import '../../packages/features/feature_home/lib/feature_home.dart' as _i49;
import '../../packages/features/feature_home/lib/src/deck/deck_viewmodel.dart'
    as _i54;
import '../../packages/features/feature_home/lib/src/duel/dialogs/duel_dialog_provider.dart'
    as _i10;
import '../../packages/features/feature_home/lib/src/duel/dialogs/select_deck/select_deck_dialog_viewmodel.dart'
    as _i51;
import '../../packages/features/feature_home/lib/src/duel/duel_viewmodel.dart'
    as _i67;
import '../../packages/features/feature_home/lib/src/duel/mixins/duel_form_validators.dart'
    as _i11;
import '../../packages/features/feature_home/lib/src/home/home_viewmodel.dart'
    as _i16;
import '../../packages/features/feature_home/lib/src/news/news_viewmodel.dart'
    as _i69;
import '../../packages/features/feature_onboarding/lib/src/onboarding/onboarding_viewmodel.dart'
    as _i71;
import '../../packages/features/feature_speed_duel/lib/feature_speed_duel.dart'
    as _i50;
import '../../packages/features/feature_speed_duel/lib/src/dialogs/play_card_dialog/play_card_dialog_viewmodel.dart'
    as _i58;
import '../../packages/features/feature_speed_duel/lib/src/dialogs/play_card_dialog/use_cases/create_play_card_dialog_actions_use_case.dart'
    as _i53;
import '../../packages/features/feature_speed_duel/lib/src/dialogs/speed_duel_dialog_provider.dart'
    as _i25;
import '../../packages/features/feature_speed_duel/lib/src/models/play_card.dart'
    as _i59;
import '../../packages/features/feature_speed_duel/lib/src/models/zone.dart'
    as _i60;
import '../../packages/features/feature_speed_duel/lib/src/speed_duel_viewmodel.dart'
    as _i75;
import '../../packages/features/feature_speed_duel/lib/src/usecases/create_play_card_use_case.dart'
    as _i40;
import '../../packages/features/feature_speed_duel/lib/src/usecases/does_card_fit_in_zone_use_case.dart'
    as _i9;
import '../../packages/features/feature_speed_duel/lib/src/usecases/get_cards_from_deck_use_case.dart'
    as _i68;
import '../../packages/features/feature_yugioh_card_detail/lib/src/yugioh_card_detail_viewmodel.dart'
    as _i52;
import '../../packages/wrappers/wrapper_assets/wrapper_assets_impl/lib/src/assets_provider.dart'
    as _i4;
import '../../packages/wrappers/wrapper_assets/wrapper_assets_interface/lib/wrapper_assets_interface.dart'
    as _i3;
import '../../packages/wrappers/wrapper_cloud_database/wrapper_cloud_database_impl/lib/src/firebase/firebase_cloud_database_provider.dart'
    as _i37;
import '../../packages/wrappers/wrapper_cloud_database/wrapper_cloud_database_interface/lib/wrapper_cloud_database_interface.dart'
    as _i36;
import '../../packages/wrappers/wrapper_crashlytics/wrapper_crashlytics_impl/lib/src/firebase/firebase_crashlytics_provider.dart'
    as _i39;
import '../../packages/wrappers/wrapper_crashlytics/wrapper_crashlytics_interface/lib/wrapper_crashlytics_interface.dart'
    as _i38;
import '../../packages/wrappers/wrapper_enum_helper/wrapper_enum_helper_impl/lib/src/enum_helper.dart'
    as _i13;
import '../../packages/wrappers/wrapper_enum_helper/wrapper_enum_helper_interface/lib/wrapper_enum_helper_interface.dart'
    as _i12;
import '../../packages/wrappers/wrapper_html_unescape/wrapper_html_unescape_impl/lib/src/html_unescape_provider.dart'
    as _i19;
import '../../packages/wrappers/wrapper_html_unescape/wrapper_html_unescape_interface/lib/wrapper_html_unescape_interface.dart'
    as _i18;
import '../../packages/wrappers/wrapper_twitter/wrapper_twitter_impl/lib/src/twitter_provider.dart'
    as _i29;
import '../../packages/wrappers/wrapper_twitter/wrapper_twitter_interface/lib/wrapper_twitter_interface.dart'
    as _i28;
import '../../packages/wrappers/wrapper_url_launcher/wrapper_url_launcher_impl/lib/src/url_launcher_provider.dart'
    as _i31;
import '../../packages/wrappers/wrapper_url_launcher/wrapper_url_launcher_interface/lib/wrapper_url_launcher_interface.dart'
    as _i30;
import '../../packages/wrappers/wrapper_web_socket/wrapper_web_socket_impl/lib/src/web_socket_factory.dart'
    as _i33;
import '../../packages/wrappers/wrapper_web_socket/wrapper_web_socket_impl/lib/src/web_socket_provider.dart'
    as _i76;
import '../../packages/wrappers/wrapper_web_socket/wrapper_web_socket_interface/lib/wrapper_web_socket_interface.dart'
    as _i32;
import '../navigation/dialogs/dialog_service.dart' as _i7;
import '../navigation/router.gr.dart' as _i8;
import '../navigation/router_helper.dart' as _i48;
import 'modules/core_modules.dart' as _i78;
import 'modules/third_party_modules.dart'
    as _i77; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i18.HtmlUnescapeProvider>(
      () => _i19.HtmlUnescapeProviderImpl());
  await gh.lazySingletonAsync<_i20.SharedPreferences>(
      () => sharedPreferencesModule.provideSharedPreferences(),
      preResolve: true);
  gh.lazySingleton<_i21.SharedPreferencesProvider>(
      () => _i22.SharedPreferencesProviderImpl(get<_i20.SharedPreferences>()));
  gh.lazySingleton<_i23.SnackBarService>(() => _i24.SnackBarServiceImpl());
  gh.lazySingleton<_i25.SpeedDuelDialogProvider>(
      () => _i25.SpeedDuelDialogProvider());
  gh.lazySingleton<_i26.TwitterApi>(
      () => twitterModule.provideTwitterApi(get<_i27.AppConfig>()));
  gh.lazySingleton<_i28.TwitterProvider>(
      () => _i29.TwitterProviderImpl(get<_i26.TwitterApi>()));
  gh.lazySingleton<_i30.UrlLauncherProvider>(
      () => _i31.UrlLauncherProviderImpl());
  gh.lazySingleton<_i32.WebSocketFactory>(() => _i33.WebSocketFactoryImpl());
  gh.lazySingleton<_i34.YugiohCardsStorageProvider>(
      () => _i35.YugiohCardsStorageProviderImpl());
  gh.lazySingleton<_i36.CloudDatabaseProvider>(() =>
      _i37.FirebaseCloudDatabaseProvider(
          get<_i15.FirebaseFirestore>(), get<_i12.EnumHelper>()));
  gh.lazySingleton<_i38.CrashlyticsProvider>(
      () => _i39.FirebaseCrashlyticsProvider(get<_i14.FirebaseCrashlytics>()));
  gh.lazySingleton<_i40.CreatePlayCardUseCase>(() => _i40.CreatePlayCardUseCase(
      get<_i3.AssetsProvider>(), get<_i12.EnumHelper>()));
  gh.lazySingleton<_i41.DeckDataManager>(
      () => _i42.DeckDataManagerImpl(get<_i36.CloudDatabaseProvider>()));
  gh.lazySingleton<_i34.DuelStorageProvider>(() =>
      _i43.DuelStorageProviderImpl(get<_i21.SharedPreferencesProvider>()));
  gh.lazySingleton<_i44.Logger>(() =>
      _i45.LoggerImpl(get<_i38.CrashlyticsProvider>(), get<_i27.AppConfig>()));
  gh.lazySingleton<_i41.NewsDataManager>(() => _i46.NewsDataManagerImpl(
      get<_i27.AppConfig>(),
      get<_i28.TwitterProvider>(),
      get<_i18.HtmlUnescapeProvider>()));
  gh.lazySingleton<_i47.RouterHelper>(() => _i48.RouterHelperImpl(
      get<_i27.AppConfig>(),
      get<_i8.AppRouter>(),
      get<_i47.DialogService>(),
      get<_i30.UrlLauncherProvider>(),
      get<_i49.DuelDialogProvider>(),
      get<_i50.SpeedDuelDialogProvider>()));
  gh.factory<_i51.SelectDeckDialogViewModel>(() =>
      _i51.SelectDeckDialogViewModel(get<_i47.RouterHelper>(),
          get<_i47.DialogService>(), get<_i17.Logger>()));
  gh.factoryParam<_i52.YugiohCardDetailViewModel, _i41.YugiohCard, int>(
      (_yugiohCard, _index) => _i52.YugiohCardDetailViewModel(
          get<_i44.Logger>(), _yugiohCard, _index));
  gh.lazySingleton<_i53.CreatePlayCardDialogActionsUseCase>(
      () => _i53.CreatePlayCardDialogActionsUseCase(get<_i44.Logger>()));
  gh.factory<_i54.DeckViewModel>(() => _i54.DeckViewModel(get<_i44.Logger>(),
      get<_i47.RouterHelper>(), get<_i55.SnackBarService>()));
  gh.lazySingleton<_i56.Dio>(() => ygoProDeckModule.provideYgoProDeckDio(
      get<_i27.AppConfig>(), get<_i44.Logger>()));
  gh.lazySingleton<_i41.DuelDataManager>(
      () => _i57.DuelDataManagerImpl(get<_i34.DuelStorageProvider>()));
  gh.factoryParam<_i58.PlayCardDialogViewModel, _i59.PlayCard, _i60.Zone>(
      (_playCard, _newZone) => _i58.PlayCardDialogViewModel(
          _playCard,
          _newZone,
          get<_i53.CreatePlayCardDialogActionsUseCase>(),
          get<_i47.DialogService>(),
          get<_i17.Logger>()));
  gh.lazySingleton<_i61.YgoProDeckRestClient>(
      () => _i61.YgoProDeckRestClient(get<_i56.Dio>()));
  gh.lazySingleton<_i62.YgoProDeckApiProvider>(
      () => _i63.YgoProDeckApiProviderImpl(get<_i61.YgoProDeckRestClient>()));
  gh.lazySingleton<_i41.YugiohCardsDataManager>(() =>
      _i64.YugiohCardsDataManagerImpl(get<_i62.YgoProDeckApiProvider>(),
          get<_i34.YugiohCardsStorageProvider>()));
  gh.lazySingleton<_i41.DataManager>(() => _i65.DataManagerImpl(
      get<_i41.NewsDataManager>(),
      get<_i41.YugiohCardsDataManager>(),
      get<_i41.DeckDataManager>(),
      get<_i41.DuelDataManager>()));
  gh.factoryParam<_i66.DeckBuilderViewModel, _i41.PreBuiltDeck, dynamic>(
      (_preBuiltDeck, _) => _i66.DeckBuilderViewModel(get<_i44.Logger>(),
          _preBuiltDeck, get<_i47.RouterHelper>(), get<_i41.DataManager>()));
  gh.factory<_i67.DuelViewModel>(() => _i67.DuelViewModel(
      get<_i44.Logger>(),
      get<_i11.DuelFormValidators>(),
      get<_i47.RouterHelper>(),
      get<_i41.DataManager>()));
  gh.lazySingleton<_i68.GetCardsFromDeckUseCase>(() =>
      _i68.GetCardsFromDeckUseCase(
          get<_i41.DataManager>(), get<_i40.CreatePlayCardUseCase>()));
  gh.factory<_i69.NewsViewModel>(() => _i69.NewsViewModel(
      get<_i44.Logger>(),
      get<_i47.RouterHelper>(),
      get<_i41.DataManager>(),
      get<_i70.DateFormatter>(),
      get<_i38.CrashlyticsProvider>()));
  gh.factory<_i71.OnboardingViewModel>(() => _i71.OnboardingViewModel(
      get<_i17.Logger>(), get<_i47.RouterHelper>(), get<_i41.DataManager>()));
  gh.lazySingleton<_i72.SmartDuelServer>(() => _i73.SmartDuelServerImpl(
      get<_i32.WebSocketFactory>(), get<_i41.DataManager>()));
  gh.factory<_i74.Socket>(
      () => socketIoModule.provideSocket(get<_i41.DataManager>()));
  gh.factoryParam<_i75.SpeedDuelViewModel, _i41.PreBuiltDeck, dynamic>(
      (_preBuiltDeck, _) => _i75.SpeedDuelViewModel(
          get<_i44.Logger>(),
          _preBuiltDeck,
          get<_i47.RouterHelper>(),
          get<_i72.SmartDuelServer>(),
          get<_i68.GetCardsFromDeckUseCase>(),
          get<_i40.CreatePlayCardUseCase>(),
          get<_i9.DoesCardFitInZoneUseCase>(),
          get<_i41.DataManager>(),
          get<_i12.EnumHelper>(),
          get<_i38.CrashlyticsProvider>(),
          get<_i55.SnackBarService>()));
  gh.factory<_i32.WebSocketProvider>(
      () => _i76.WebSocketProviderImpl(get<_i74.Socket>(), get<_i44.Logger>()));
  return get;
}

class _$FirebaseModule extends _i77.FirebaseModule {}

class _$SharedPreferencesModule extends _i77.SharedPreferencesModule {}

class _$TwitterModule extends _i77.TwitterModule {}

class _$YgoProDeckModule extends _i78.YgoProDeckModule {}

class _$SocketIoModule extends _i77.SocketIoModule {}
