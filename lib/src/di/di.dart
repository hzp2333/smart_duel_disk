import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_config/core_config_interface/lib/core_config_interface.dart';
import 'package:smart_duel_disk/src/navigation/router.gr.dart';

import 'di.config.dart';

final di = GetIt.instance;

@InjectableInit()
Future<void> initDependencies(AppConfig appConfig) async {
  di.registerSingleton(appConfig);
  di.registerSingleton(AppRouter());

  await $initGetIt(di);
}
