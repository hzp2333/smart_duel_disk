import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_config/lib/core_config.dart';
import 'package:smart_duel_disk/packages/core/core_navigation/lib/core_navigation.dart';

import 'di.config.dart';

final di = GetIt.instance;

const mobile = Environment('mobile');
const web = Environment('web');

@InjectableInit()
Future<void> initDependencies(AppConfig appConfig, Environment environment) async {
  di.registerSingleton(appConfig);
  di.registerSingleton(AutoRouteRouter());

  await $initGetIt(di, environment: environment.name);
}
