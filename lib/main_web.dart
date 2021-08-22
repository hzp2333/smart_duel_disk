import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:smart_duel_disk/packages/core/core_config/lib/core_config.dart';
import 'package:smart_duel_disk/src/di/di.dart';
import 'package:smart_duel_disk/start.dart';

const _secretsFilePath = './secrets.env';

Future<void> main() async {
  AppConfig appConfig;
  try {
    final dotEnv = DotEnv();
    await dotEnv.load(_secretsFilePath);
    appConfig = AppConfig.release(dotEnv);
  } catch (e) {
    appConfig = AppConfig.develop();
  }

  await start(appConfig, web);
}
