// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:dart_twitter_api/twitter_api.dart';

import '../../packages/core/core_config/core_config_interface/lib/core_config_interface.dart';
import '../../packages/wrappers/wrapper_crashlytics_provider/wrapper_crashlytics_provider_interface/lib/wrapper_crashlytics_provider_interface.dart';
import '../../packages/core/core_data_manager/core_data_manager_interface/lib/core_data_manager_interface.dart';
import '../../packages/core/core_data_manager/core_data_manager_impl/lib/src/data_manager.dart';
import '../../packages/core/core_general/lib/core_general.dart';
import '../../packages/core/core_general/lib/src/formatters/date_formatter.dart'
    as smart_duel_disk1;
import '../../packages/features/feature_home/lib/src/deck/deck_viewmodel.dart';
import '../../packages/features/feature_home/lib/src/duel/duel_viewmodel.dart';
import '../../packages/wrappers/wrapper_crashlytics_provider/wrapper_crashlytics_provider_impl/lib/src/firebase/firebase_crashlytics_provider.dart';
import 'modules/third_party_modules.dart';
import '../../packages/features/feature_home/lib/src/home/home_viewmodel.dart';
import '../../packages/core/core_data_manager/core_data_manager_impl/lib/src/news/news_data_manager.dart';
import '../../packages/features/feature_home/lib/src/news/news_viewmodel.dart';
import '../../packages/wrappers/wrapper_twitter_provider/wrapper_twitter_provider_interface/lib/src/twitter_provider.dart';
import '../../packages/wrappers/wrapper_twitter_provider/wrapper_twitter_provider_interface/lib/wrapper_twitter_provider_interface.dart'
    as smart_duel_disk;
import '../../packages/wrappers/wrapper_twitter_provider/wrapper_twitter_provider_impl/lib/src/twitter_provider.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  final firebaseModule = _$FirebaseModule();
  final twitterModule = _$TwitterModule();
  gh.lazySingleton<smart_duel_disk1.DateFormatter>(
      () => smart_duel_disk1.DateFormatter());
  gh.factory<DeckViewModel>(() => DeckViewModel());
  gh.factory<DuelViewModel>(() => DuelViewModel());
  gh.lazySingleton<FirebaseCrashlytics>(
      () => firebaseModule.provideFirebaseCrashlytics());
  gh.factory<HomeViewModel>(() => HomeViewModel());
  gh.lazySingleton<TwitterApi>(
      () => twitterModule.provideTwitterApi(get<AppConfig>()));
  gh.lazySingleton<TwitterProvider>(
      () => TwitterProviderImpl(get<TwitterApi>()));
  gh.lazySingleton<CrashlyticsProvider>(
      () => FirebaseCrashlyticsProvider(get<FirebaseCrashlytics>()));
  gh.lazySingleton<NewsDataManager>(() => NewsDataManagerImpl(
        get<AppConfig>(),
        get<smart_duel_disk.TwitterProvider>(),
        get<CrashlyticsProvider>(),
      ));
  gh.lazySingleton<DataManager>(() => DataManagerImpl(get<NewsDataManager>()));
  gh.factory<NewsViewModel>(() => NewsViewModel(
        get<DataManager>(),
        get<DateFormatter>(),
        get<CrashlyticsProvider>(),
      ));
  return get;
}

class _$FirebaseModule extends FirebaseModule {}

class _$TwitterModule extends TwitterModule {}
