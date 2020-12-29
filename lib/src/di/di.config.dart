// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../packages/wrappers/wrapper_crashlytics_provider/wrapper_crashlytics_provider_interface/lib/wrapper_crashlytics_provider_interface.dart';
import '../../packages/features/feature_home/feature_home_impl/lib/src/deck/deck_viewmodel.dart';
import '../../packages/features/feature_home/feature_home_impl/lib/src/duel/duel_viewmodel.dart';
import '../../packages/wrappers/wrapper_crashlytics_provider/wrapper_crashlytics_provider_impl/lib/src/firebase/firebase_crashlytics_provider.dart';
import 'modules/third_party_modules.dart';
import '../../packages/features/feature_home/feature_home_impl/lib/src/home/home_viewmodel.dart';
import '../../packages/features/feature_home/feature_home_impl/lib/src/news/news_viewmodel.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  final firebaseModule = _$FirebaseModule();
  gh.factory<DeckViewModel>(() => DeckViewModel());
  gh.factory<DuelViewModel>(() => DuelViewModel());
  gh.lazySingleton<FirebaseCrashlytics>(
      () => firebaseModule.provideFirebaseCrashlytics());
  gh.factory<HomeViewModel>(() => HomeViewModel());
  gh.factory<NewsViewModel>(() => NewsViewModel());
  gh.lazySingleton<CrashlyticsProvider>(
      () => FirebaseCrashlyticsProvider(get<FirebaseCrashlytics>()));
  return get;
}

class _$FirebaseModule extends FirebaseModule {}
