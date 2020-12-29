import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/src/navigation/router.gr.dart';

import 'di.config.dart';

final di = GetIt.instance;

@InjectableInit()
Future<void> initDependencies() async {
  di.registerLazySingleton(() => AppRouter());

  await $initGetIt(di);
}
