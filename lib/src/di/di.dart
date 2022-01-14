import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_config/lib/core_config.dart';
import 'package:smart_duel_disk/packages/core/core_navigation/lib/core_navigation.dart';
import 'package:smart_duel_disk/packages/core/core_storage/lib/core_storage.dart';

import 'di.config.dart';

final di = GetIt.instance;

const mobileEnvName = 'mobile';
const mobile = Environment(mobileEnvName);

const webEnvName = 'web';
const web = Environment(webEnvName);

@InjectableInit()
Future<void> initDependencies(AppConfig appConfig, Environment environment) async {
  _registerHiveAdapters();

  di.registerSingleton(appConfig);
  di.registerSingleton(AutoRouteRouter());

  await $initGetIt(di, environment: environment.name);
}

void _registerHiveAdapters() {
  Hive.registerAdapter(DbCardAttributeAdapter());
  Hive.registerAdapter(DbCardRaceAdapter());
  Hive.registerAdapter(DbCardTypeAdapter());
  Hive.registerAdapter(DbYugiohCardAdapter());
}
