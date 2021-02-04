// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:dart_twitter_api/twitter_api.dart';

import '../../packages/core/core_config/core_config_interface/lib/core_config_interface.dart';
import '../navigation/router.gr.dart';
import '../../packages/wrappers/wrapper_assets/wrapper_assets_interface/lib/wrapper_assets_interface.dart';
import '../../packages/wrappers/wrapper_assets/wrapper_assets_impl/lib/src/assets_provider.dart';
import '../../packages/wrappers/wrapper_cloud_database/wrapper_cloud_database_interface/lib/wrapper_cloud_database_interface.dart';
import '../../packages/wrappers/wrapper_crashlytics/wrapper_crashlytics_interface/lib/wrapper_crashlytics_interface.dart';
import '../../packages/core/core_data_manager/core_data_manager_interface/lib/core_data_manager_interface.dart';
import '../../packages/core/core_data_manager/core_data_manager_impl/lib/src/data_manager.dart';
import '../../packages/core/core_general/lib/core_general.dart'
    as smart_duel_disk1;
import '../../packages/core/core_general/lib/src/formatters/date_formatter.dart';
import '../../packages/features/feature_deck_builder/lib/src/deck_builder/deck_builder_viewmodel.dart';
import '../../packages/core/core_data_manager/core_data_manager_impl/lib/src/deck/deck_data_manager.dart';
import '../../packages/features/feature_home/lib/src/deck/deck_viewmodel.dart';
import '../../packages/features/feature_draw_card/lib/src/draw_card_viewmodel.dart';
import '../../packages/features/feature_home/lib/src/duel/duel_viewmodel.dart';
import '../../packages/wrappers/wrapper_enum_helper/wrapper_enum_helper_interface/lib/wrapper_enum_helper_interface.dart';
import '../../packages/wrappers/wrapper_enum_helper/wrapper_enum_helper_impl/lib/src/enum_helper.dart';
import '../../packages/wrappers/wrapper_cloud_database/wrapper_cloud_database_impl/lib/src/firebase/firebase_cloud_database_provider.dart';
import '../../packages/wrappers/wrapper_crashlytics/wrapper_crashlytics_impl/lib/src/firebase/firebase_crashlytics_provider.dart';
import 'modules/third_party_modules.dart';
import '../../packages/features/feature_speed_duel/lib/src/usecases/get_cards_from_deck_use_case.dart';
import '../../packages/features/feature_home/lib/src/home/home_viewmodel.dart';
import '../../packages/core/core_logger/core_logger_interface/lib/core_logger_interface.dart';
import '../../packages/core/core_logger/core_logger_interface/lib/src/logger.dart'
    as smart_duel_disk;
import '../../packages/core/core_logger/core_logger_impl/lib/src/logger.dart';
import '../../packages/core/core_data_manager/core_data_manager_impl/lib/src/news/news_data_manager.dart';
import '../../packages/features/feature_home/lib/src/news/news_viewmodel.dart';
import '../../packages/core/core_navigation/lib/core_navigation.dart';
import '../navigation/router_helper.dart';
import '../../packages/core/core_smart_duel_server/core_smart_duel_server_interface/lib/core_smart_duel_server_interface.dart';
import '../../packages/core/core_smart_duel_server/core_smart_duel_server_impl/lib/src/smart_duel_server.dart';
import '../../packages/features/feature_speed_duel/lib/src/speed_duel_viewmodel.dart';
import '../../packages/wrappers/wrapper_twitter/wrapper_twitter_interface/lib/wrapper_twitter_interface.dart';
import '../../packages/wrappers/wrapper_twitter/wrapper_twitter_impl/lib/src/twitter_provider.dart';
import '../../packages/wrappers/wrapper_url_launcher/wrapper_url_launcher_interface/lib/wrapper_url_launcher_interface.dart';
import '../../packages/wrappers/wrapper_url_launcher/wrapper_url_launcher_impl/lib/src/url_launcher_provider.dart';
import '../../packages/wrappers/wrapper_web_socket/wrapper_web_socket_interface/lib/wrapper_web_socket_interface.dart';
import '../../packages/wrappers/wrapper_web_socket/wrapper_web_socket_impl/lib/src/web_socket_factory.dart';
import '../../packages/wrappers/wrapper_web_socket/wrapper_web_socket_impl/lib/src/web_socket_provider.dart';
import '../../packages/core/core_ygoprodeck/core_ygoprodeck_interface/lib/core_ygoprodeck_interface.dart';
import '../../packages/core/core_ygoprodeck/core_ygoprodeck_impl/lib/src/ygoprodeck_api_provider.dart';
import 'modules/core_modules.dart';
import '../../packages/core/core_ygoprodeck/core_ygoprodeck_impl/lib/src/api/ygoprodeck_api.dart';
import '../../packages/features/feature_yugioh_card_detail/lib/src/yugioh_card_detail_viewmodel.dart';
import '../../packages/core/core_data_manager/core_data_manager_impl/lib/src/yugioh_cards/yugioh_cards_data_manager.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  final firebaseModule = _$FirebaseModule();
  final socketIoModule = _$SocketIoModule();
  final twitterModule = _$TwitterModule();
  final ygoProDeckModule = _$YgoProDeckModule();
  gh.lazySingleton<AssetsProvider>(() => AssetsProviderImpl());
  gh.lazySingleton<DateFormatter>(() => DateFormatter());
  gh.lazySingleton<EnumHelper>(() => EnumHelperImpl());
  gh.lazySingleton<FirebaseCrashlytics>(
      () => firebaseModule.provideFirebaseCrashlytics());
  gh.lazySingleton<FirebaseFirestore>(
      () => firebaseModule.provideFirebaseFirestore());
  gh.factory<HomeViewModel>(() => HomeViewModel(get<smart_duel_disk.Logger>()));
  gh.factory<Socket>(() => socketIoModule.provideSocket(get<AppConfig>()));
  gh.lazySingleton<TwitterApi>(
      () => twitterModule.provideTwitterApi(get<AppConfig>()));
  gh.lazySingleton<TwitterProvider>(
      () => TwitterProviderImpl(get<TwitterApi>()));
  gh.lazySingleton<UrlLauncherProvider>(() => UrlLauncherProviderImpl());
  gh.lazySingleton<WebSocketFactory>(() => WebSocketFactoryImpl());
  gh.factory<WebSocketProvider>(() => WebSocketProviderImpl(get<Socket>()));
  gh.lazySingleton<CloudDatabaseProvider>(() => FirebaseCloudDatabaseProvider(
      get<FirebaseFirestore>(), get<EnumHelper>()));
  gh.lazySingleton<CrashlyticsProvider>(
      () => FirebaseCrashlyticsProvider(get<FirebaseCrashlytics>()));
  gh.lazySingleton<DeckDataManager>(
      () => DeckDataManagerImpl(get<CloudDatabaseProvider>()));
  gh.lazySingleton<Logger>(
      () => LoggerImpl(get<CrashlyticsProvider>(), get<AppConfig>()));
  gh.lazySingleton<NewsDataManager>(
      () => NewsDataManagerImpl(get<AppConfig>(), get<TwitterProvider>()));
  gh.lazySingleton<RouterHelper>(() => RouterHelperImpl(
        get<AppRouter>(),
        get<AppConfig>(),
        get<UrlLauncherProvider>(),
      ));
  gh.lazySingleton<SmartDuelServer>(
      () => SmartDuelServerImpl(get<WebSocketFactory>()));
  gh.factoryParam<YugiohCardDetailViewModel, YugiohCard, int>(
      (_yugiohCard, _index) => YugiohCardDetailViewModel(
            get<Logger>(),
            _yugiohCard,
            _index,
          ));
  gh.factory<DeckViewModel>(
      () => DeckViewModel(get<Logger>(), get<RouterHelper>()));
  gh.lazySingleton<Dio>(() =>
      ygoProDeckModule.provideYgoProDeckDio(get<AppConfig>(), get<Logger>()));
  gh.factory<DrawCardViewModel>(
      () => DrawCardViewModel(get<Logger>(), get<RouterHelper>()));
  gh.factory<DuelViewModel>(
      () => DuelViewModel(get<Logger>(), get<RouterHelper>()));
  gh.lazySingleton<YgoProDeckRestClient>(
      () => YgoProDeckRestClient(get<Dio>()));
  gh.lazySingleton<YgoProDeckApiProvider>(
      () => YgoProDeckApiProviderImpl(get<YgoProDeckRestClient>()));
  gh.lazySingleton<YugiohCardsDataManager>(
      () => YugiohCardsDataManagerImpl(get<YgoProDeckApiProvider>()));
  gh.lazySingleton<DataManager>(() => DataManagerImpl(
        get<NewsDataManager>(),
        get<YugiohCardsDataManager>(),
        get<DeckDataManager>(),
      ));
  gh.factoryParam<DeckBuilderViewModel, PreBuiltDeck, dynamic>(
      (_preBuiltDeck, _) => DeckBuilderViewModel(
            get<Logger>(),
            _preBuiltDeck,
            get<RouterHelper>(),
            get<DataManager>(),
          ));
  gh.lazySingleton<GetCardsFromDeckUseCase>(
      () => GetCardsFromDeckUseCase(get<DataManager>()));
  gh.factory<NewsViewModel>(() => NewsViewModel(
        get<Logger>(),
        get<RouterHelper>(),
        get<DataManager>(),
        get<smart_duel_disk1.DateFormatter>(),
        get<CrashlyticsProvider>(),
      ));
  gh.factoryParam<SpeedDuelViewModel, PreBuiltDeck, dynamic>(
      (_preBuiltDeck, _) => SpeedDuelViewModel(
            get<Logger>(),
            _preBuiltDeck,
            get<SmartDuelServer>(),
            get<GetCardsFromDeckUseCase>(),
            get<EnumHelper>(),
          ));
  return get;
}

class _$FirebaseModule extends FirebaseModule {}

class _$SocketIoModule extends SocketIoModule {}

class _$TwitterModule extends TwitterModule {}

class _$YgoProDeckModule extends YgoProDeckModule {}
