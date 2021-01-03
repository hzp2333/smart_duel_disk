import 'package:smart_duel_disk/packages/core/core_config/core_config_interface/lib/core_config_interface.dart';
import 'package:smart_duel_disk/start.dart';

Future<void> main() async {
  await start(AppConfig.release());
}
