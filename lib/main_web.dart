import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:smart_duel_disk/packages/core/core_config/core_config_interface/lib/core_config_interface.dart';
import 'package:smart_duel_disk/src/di/di.dart';
import 'package:smart_duel_disk/start.dart';

const _secretsFilePath = './secrets.env';

Future<void> main() async {
  final dotEnv = DotEnv();
  await dotEnv.load(_secretsFilePath);

  await start(AppConfig.release(dotEnv), web);
}
