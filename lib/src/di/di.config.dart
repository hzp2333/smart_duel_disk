// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../packages/features/feature_home/feature_home_impl/lib/src/deck/deck_viewmodel.dart';
import '../../packages/features/feature_home/feature_home_impl/lib/src/duel/duel_viewmodel.dart';
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
  gh.factory<DeckViewModel>(() => DeckViewModel());
  gh.factory<DuelViewModel>(() => DuelViewModel());
  gh.factory<HomeViewModel>(() => HomeViewModel());
  gh.factory<NewsViewModel>(() => NewsViewModel());
  return get;
}
