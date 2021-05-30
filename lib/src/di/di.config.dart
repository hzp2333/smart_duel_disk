// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart' as _i17;
import 'package:dart_twitter_api/twitter_api.dart' as _i31;
import 'package:dio/dio.dart' as _i48;
import 'package:firebase_crashlytics/firebase_crashlytics.dart' as _i16;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i25;
import 'package:socket_io_client/socket_io_client.dart' as _i75;

import '../../packages/core/core_config/core_config_interface/lib/core_config_interface.dart'
    as _i24;
import '../../packages/core/core_data_manager/core_data_manager_impl/lib/src/data_manager.dart'
    as _i66;
import '../../packages/core/core_data_manager/core_data_manager_impl/lib/src/deck/deck_data_manager.dart'
    as _i47;
import '../../packages/core/core_data_manager/core_data_manager_impl/lib/src/duel/duel_data_manager.dart'
    as _i62;
import '../../packages/core/core_data_manager/core_data_manager_impl/lib/src/news/news_data_manager.dart'
    as _i50;
import '../../packages/core/core_data_manager/core_data_manager_impl/lib/src/yugioh_cards/yugioh_cards_data_manager.dart'
    as _i65;
import '../../packages/core/core_data_manager/core_data_manager_interface/lib/core_data_manager_interface.dart'
    as _i39;
import '../../packages/core/core_general/lib/core_general.dart' as _i71;
import '../../packages/core/core_general/lib/src/formatters/date_formatter.dart'
    as _i7;
import '../../packages/core/core_logger/core_logger_impl/lib/src/logger.dart'
    as _i23;
import '../../packages/core/core_logger/core_logger_interface/lib/core_logger_interface.dart'
    as _i22;
import '../../packages/core/core_logger/core_logger_interface/lib/src/logger.dart'
    as _i19;
import '../../packages/core/core_messaging/core_messaging_impl/lib/src/snack_bar/snack_bar_service_impl.dart'
    as _i29;
import '../../packages/core/core_messaging/core_messaging_interface/lib/core_messaging_interface.dart'
    as _i28;
import '../../packages/core/core_messaging/core_messaging_interface/lib/src/snack_bar/snack_bar_service.dart'
    as _i61;
import '../../packages/core/core_navigation/lib/core_navigation.dart' as _i54;
import '../../packages/core/core_navigation/lib/src/dialogs/dialog_service.dart'
    as _i8;
import '../../packages/core/core_smart_duel_server/core_smart_duel_server_impl/lib/src/smart_duel_server.dart'
    as _i74;
import '../../packages/core/core_smart_duel_server/core_smart_duel_server_interface/lib/core_smart_duel_server_interface.dart'
    as _i73;
import '../../packages/core/core_storage/core_storage_impl/lib/src/duel/duel_storage_provider.dart'
    as _i49;
import '../../packages/core/core_storage/core_storage_impl/lib/src/providers/shared_preferences/shared_preferences_impl/shared_preferences_provider.dart'
    as _i27;
import '../../packages/core/core_storage/core_storage_impl/lib/src/providers/shared_preferences/shared_preferences_interface/shared_preferences_provider.dart'
    as _i26;
import '../../packages/core/core_storage/core_storage_impl/lib/src/yugioh_cards/yugioh_cards_storage_provider.dart'
    as _i41;
import '../../packages/core/core_storage/core_storage_interface/lib/core_storage_interface.dart'
    as _i40;
import '../../packages/core/core_ygoprodeck/core_ygoprodeck_impl/lib/src/api/ygoprodeck_api.dart'
    as _i59;
import '../../packages/core/core_ygoprodeck/core_ygoprodeck_impl/lib/src/ygoprodeck_api_provider.dart'
    as _i64;
import '../../packages/core/core_ygoprodeck/core_ygoprodeck_interface/lib/core_ygoprodeck_interface.dart'
    as _i63;
import '../../packages/features/feature_deck_builder/lib/src/deck_builder/deck_builder_viewmodel.dart'
    as _i67;
import '../../packages/features/feature_home/lib/feature_home.dart' as _i56;
import '../../packages/features/feature_home/lib/src/deck/deck_viewmodel.dart'
    as _i60;
import '../../packages/features/feature_home/lib/src/duel/dialogs/duel_dialog_provider.dart'
    as _i12;
import '../../packages/features/feature_home/lib/src/duel/dialogs/select_deck/select_deck_dialog_viewmodel.dart'
    as _i58;
import '../../packages/features/feature_home/lib/src/duel/duel_viewmodel.dart'
    as _i68;
import '../../packages/features/feature_home/lib/src/duel/mixins/duel_form_validators.dart'
    as _i13;
import '../../packages/features/feature_home/lib/src/home/home_viewmodel.dart'
    as _i18;
import '../../packages/features/feature_home/lib/src/news/news_viewmodel.dart'
    as _i70;
import '../../packages/features/feature_onboarding/lib/src/onboarding/onboarding_viewmodel.dart'
    as _i72;
import '../../packages/features/feature_speed_duel/lib/feature_speed_duel.dart'
    as _i57;
import '../../packages/features/feature_speed_duel/lib/src/dialogs/play_card_dialog/play_card_dialog_viewmodel.dart'
    as _i51;
import '../../packages/features/feature_speed_duel/lib/src/dialogs/play_card_dialog/use_cases/create_play_card_dialog_actions_use_case.dart'
    as _i45;
import '../../packages/features/feature_speed_duel/lib/src/dialogs/speed_duel_dialog_provider.dart'
    as _i30;
import '../../packages/features/feature_speed_duel/lib/src/models/play_card.dart'
    as _i52;
import '../../packages/features/feature_speed_duel/lib/src/models/zone.dart'
    as _i53;
import '../../packages/features/feature_speed_duel/lib/src/speed_duel_viewmodel.dart'
    as _i76;
import '../../packages/features/feature_speed_duel/lib/src/usecases/create_play_card_use_case.dart'
    as _i46;
import '../../packages/features/feature_speed_duel/lib/src/usecases/does_card_fit_in_zone_use_case.dart'
    as _i11;
import '../../packages/features/feature_speed_duel/lib/src/usecases/get_cards_from_deck_use_case.dart'
    as _i69;
import '../../packages/features/feature_yugioh_card_detail/lib/src/yugioh_card_detail_viewmodel.dart'
    as _i38;
import '../../packages/wrappers/wrapper_assets/wrapper_assets_impl/lib/src/assets_provider.dart'
    as _i4;
import '../../packages/wrappers/wrapper_assets/wrapper_assets_interface/lib/wrapper_assets_interface.dart'
    as _i3;
import '../../packages/wrappers/wrapper_cloud_database/wrapper_cloud_database_impl/lib/src/firebase/firebase_cloud_database_provider.dart'
    as _i43;
import '../../packages/wrappers/wrapper_cloud_database/wrapper_cloud_database_interface/lib/wrapper_cloud_database_interface.dart'
    as _i42;
import '../../packages/wrappers/wrapper_crashlytics/wrapper_crashlytics_impl/lib/src/firebase/firebase_crashlytics_provider.dart'
    as _i44;
import '../../packages/wrappers/wrapper_crashlytics/wrapper_crashlytics_impl/lib/src/web/web_crashlytics_provider.dart'
    as _i6;
import '../../packages/wrappers/wrapper_crashlytics/wrapper_crashlytics_interface/lib/wrapper_crashlytics_interface.dart'
    as _i5;
import '../../packages/wrappers/wrapper_enum_helper/wrapper_enum_helper_impl/lib/src/enum_helper.dart'
    as _i15;
import '../../packages/wrappers/wrapper_enum_helper/wrapper_enum_helper_interface/lib/wrapper_enum_helper_interface.dart'
    as _i14;
import '../../packages/wrappers/wrapper_html_unescape/wrapper_html_unescape_impl/lib/src/html_unescape_provider.dart'
    as _i21;
import '../../packages/wrappers/wrapper_html_unescape/wrapper_html_unescape_interface/lib/wrapper_html_unescape_interface.dart'
    as _i20;
import '../../packages/wrappers/wrapper_twitter/wrapper_twitter_impl/lib/src/twitter_provider.dart'
    as _i33;
import '../../packages/wrappers/wrapper_twitter/wrapper_twitter_interface/lib/wrapper_twitter_interface.dart'
    as _i32;
import '../../packages/wrappers/wrapper_url_launcher/wrapper_url_launcher_impl/lib/src/url_launcher_provider.dart'
    as _i35;
import '../../packages/wrappers/wrapper_url_launcher/wrapper_url_launcher_interface/lib/wrapper_url_launcher_interface.dart'
    as _i34;
import '../../packages/wrappers/wrapper_web_socket/wrapper_web_socket_impl/lib/src/web_socket_factory.dart'
    as _i37;
import '../../packages/wrappers/wrapper_web_socket/wrapper_web_socket_impl/lib/src/web_socket_provider.dart'
    as _i77;
import '../../packages/wrappers/wrapper_web_socket/wrapper_web_socket_interface/lib/wrapper_web_socket_interface.dart'
    as _i36;
import '../navigation/dialogs/dialog_service.dart' as _i9;
import '../navigation/router.gr.dart' as _i10;
import '../navigation/router_helper.dart' as _i55;
import 'modules/core_modules.dart' as _i79;
import 'modules/third_party_modules.dart' as _i78;

const String _web = 'web';
const String _mobile = 'mobile';
// ignore_for_file: unnecessary_lambdas
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
  gh.lazySingleton<_i5.CrashlyticsProvider>(() => _i6.WebCrashlyticsProvider(),
      registerFor: {_web});
  gh.lazySingleton<_i7.DateFormatter>(() => _i7.DateFormatter());
  gh.lazySingleton<_i8.DialogService>(
      () => _i9.DialogServiceImpl(get<_i10.AppRouter>()));
  gh.lazySingleton<_i11.DoesCardFitInZoneUseCase>(
      () => _i11.DoesCardFitInZoneUseCase());
  gh.lazySingleton<_i12.DuelDialogProvider>(() => _i12.DuelDialogProvider());
  gh.lazySingleton<_i13.DuelFormValidators>(() => _i13.DuelFormValidators());
  gh.lazySingleton<_i14.EnumHelper>(() => _i15.EnumHelperImpl());
  gh.lazySingleton<_i16.FirebaseCrashlytics>(
      () => firebaseModule.provideFirebaseCrashlytics());
  gh.lazySingleton<_i17.FirebaseFirestore>(
      () => firebaseModule.provideFirebaseFirestore());
  gh.factory<_i18.HomeViewModel>(() => _i18.HomeViewModel(get<_i19.Logger>()));
  gh.lazySingleton<_i20.HtmlUnescapeProvider>(
      () => _i21.HtmlUnescapeProviderImpl());
  gh.lazySingleton<_i22.Logger>(() =>
      _i23.LoggerImpl(get<_i5.CrashlyticsProvider>(), get<_i24.AppConfig>()));
  await gh.lazySingletonAsync<_i25.SharedPreferences>(
      () => sharedPreferencesModule.provideSharedPreferences(),
      preResolve: true);
  gh.lazySingleton<_i26.SharedPreferencesProvider>(
      () => _i27.SharedPreferencesProviderImpl(get<_i25.SharedPreferences>()));
  gh.lazySingleton<_i28.SnackBarService>(() => _i29.SnackBarServiceImpl());
  gh.lazySingleton<_i30.SpeedDuelDialogProvider>(
      () => _i30.SpeedDuelDialogProvider());
  gh.lazySingleton<_i31.TwitterApi>(
      () => twitterModule.provideTwitterApi(get<_i24.AppConfig>()));
  gh.lazySingleton<_i32.TwitterProvider>(
      () => _i33.TwitterProviderImpl(get<_i31.TwitterApi>()));
  gh.lazySingleton<_i34.UrlLauncherProvider>(
      () => _i35.UrlLauncherProviderImpl());
  gh.lazySingleton<_i36.WebSocketFactory>(() => _i37.WebSocketFactoryImpl());
  gh.factoryParam<_i38.YugiohCardDetailViewModel, _i39.YugiohCard, int>(
      (_yugiohCard, _index) => _i38.YugiohCardDetailViewModel(
          get<_i22.Logger>(), _yugiohCard, _index));
  gh.lazySingleton<_i40.YugiohCardsStorageProvider>(
      () => _i41.YugiohCardsStorageProviderImpl());
  gh.lazySingleton<_i42.CloudDatabaseProvider>(() =>
      _i43.FirebaseCloudDatabaseProvider(
          get<_i17.FirebaseFirestore>(), get<_i14.EnumHelper>()));
  gh.lazySingleton<_i5.CrashlyticsProvider>(
      () => _i44.FirebaseCrashlyticsProvider(get<_i16.FirebaseCrashlytics>()),
      registerFor: {_mobile});
  gh.lazySingleton<_i45.CreatePlayCardDialogActionsUseCase>(
      () => _i45.CreatePlayCardDialogActionsUseCase(get<_i22.Logger>()));
  gh.lazySingleton<_i46.CreatePlayCardUseCase>(() => _i46.CreatePlayCardUseCase(
      get<_i3.AssetsProvider>(), get<_i14.EnumHelper>()));
  gh.lazySingleton<_i39.DeckDataManager>(
      () => _i47.DeckDataManagerImpl(get<_i42.CloudDatabaseProvider>()));
  gh.lazySingleton<_i48.Dio>(() => ygoProDeckModule.provideYgoProDeckDio(
      get<_i24.AppConfig>(), get<_i22.Logger>()));
  gh.lazySingleton<_i40.DuelStorageProvider>(() =>
      _i49.DuelStorageProviderImpl(get<_i26.SharedPreferencesProvider>()));
  gh.lazySingleton<_i39.NewsDataManager>(() => _i50.NewsDataManagerImpl(
      get<_i24.AppConfig>(),
      get<_i32.TwitterProvider>(),
      get<_i20.HtmlUnescapeProvider>()));
  gh.factoryParam<_i51.PlayCardDialogViewModel, _i52.PlayCard, _i53.Zone>(
      (_playCard, _newZone) => _i51.PlayCardDialogViewModel(
          _playCard,
          _newZone,
          get<_i45.CreatePlayCardDialogActionsUseCase>(),
          get<_i54.DialogService>(),
          get<_i19.Logger>()));
  gh.lazySingleton<_i54.RouterHelper>(() => _i55.RouterHelperImpl(
      get<_i24.AppConfig>(),
      get<_i10.AppRouter>(),
      get<_i54.DialogService>(),
      get<_i34.UrlLauncherProvider>(),
      get<_i56.DuelDialogProvider>(),
      get<_i57.SpeedDuelDialogProvider>()));
  gh.factory<_i58.SelectDeckDialogViewModel>(() =>
      _i58.SelectDeckDialogViewModel(get<_i54.RouterHelper>(),
          get<_i54.DialogService>(), get<_i19.Logger>()));
  gh.lazySingleton<_i59.YgoProDeckRestClient>(
      () => _i59.YgoProDeckRestClient(get<_i48.Dio>()));
  gh.factory<_i60.DeckViewModel>(() => _i60.DeckViewModel(get<_i22.Logger>(),
      get<_i54.RouterHelper>(), get<_i61.SnackBarService>()));
  gh.lazySingleton<_i39.DuelDataManager>(
      () => _i62.DuelDataManagerImpl(get<_i40.DuelStorageProvider>()));
  gh.lazySingleton<_i63.YgoProDeckApiProvider>(
      () => _i64.YgoProDeckApiProviderImpl(get<_i59.YgoProDeckRestClient>()));
  gh.lazySingleton<_i39.YugiohCardsDataManager>(() =>
      _i65.YugiohCardsDataManagerImpl(get<_i63.YgoProDeckApiProvider>(),
          get<_i40.YugiohCardsStorageProvider>()));
  gh.lazySingleton<_i39.DataManager>(() => _i66.DataManagerImpl(
      get<_i39.NewsDataManager>(),
      get<_i39.YugiohCardsDataManager>(),
      get<_i39.DeckDataManager>(),
      get<_i39.DuelDataManager>()));
  gh.factoryParam<_i67.DeckBuilderViewModel, _i39.PreBuiltDeck, dynamic>(
      (_preBuiltDeck, _) => _i67.DeckBuilderViewModel(get<_i22.Logger>(),
          _preBuiltDeck, get<_i54.RouterHelper>(), get<_i39.DataManager>()));
  gh.factory<_i68.DuelViewModel>(() => _i68.DuelViewModel(
      get<_i22.Logger>(),
      get<_i13.DuelFormValidators>(),
      get<_i54.RouterHelper>(),
      get<_i39.DataManager>()));
  gh.lazySingleton<_i69.GetCardsFromDeckUseCase>(() =>
      _i69.GetCardsFromDeckUseCase(
          get<_i39.DataManager>(), get<_i46.CreatePlayCardUseCase>()));
  gh.factory<_i70.NewsViewModel>(() => _i70.NewsViewModel(
      get<_i22.Logger>(),
      get<_i54.RouterHelper>(),
      get<_i39.DataManager>(),
      get<_i71.DateFormatter>(),
      get<_i5.CrashlyticsProvider>()));
  gh.factory<_i72.OnboardingViewModel>(() => _i72.OnboardingViewModel(
      get<_i19.Logger>(), get<_i54.RouterHelper>(), get<_i39.DataManager>()));
  gh.lazySingleton<_i73.SmartDuelServer>(() => _i74.SmartDuelServerImpl(
      get<_i36.WebSocketFactory>(), get<_i39.DataManager>()));
  gh.factory<_i75.Socket>(
      () => socketIoModule.provideSocket(get<_i39.DataManager>()));
  gh.factoryParam<_i76.SpeedDuelViewModel, _i39.PreBuiltDeck, dynamic>(
      (_preBuiltDeck, _) => _i76.SpeedDuelViewModel(
          get<_i22.Logger>(),
          _preBuiltDeck,
          get<_i54.RouterHelper>(),
          get<_i73.SmartDuelServer>(),
          get<_i69.GetCardsFromDeckUseCase>(),
          get<_i46.CreatePlayCardUseCase>(),
          get<_i11.DoesCardFitInZoneUseCase>(),
          get<_i39.DataManager>(),
          get<_i14.EnumHelper>(),
          get<_i5.CrashlyticsProvider>(),
          get<_i61.SnackBarService>()));
  gh.factory<_i36.WebSocketProvider>(
      () => _i77.WebSocketProviderImpl(get<_i75.Socket>(), get<_i22.Logger>()));
  return get;
}

class _$FirebaseModule extends _i78.FirebaseModule {}

class _$SharedPreferencesModule extends _i78.SharedPreferencesModule {}

class _$TwitterModule extends _i78.TwitterModule {}

class _$YgoProDeckModule extends _i79.YgoProDeckModule {}

class _$SocketIoModule extends _i78.SocketIoModule {}
