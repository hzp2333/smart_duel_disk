import 'package:smart_duel_disk/packages/core/core_smart_duel_server/core_smart_duel_server_interface/lib/src/models/duel_event.dart';

abstract class SmartDuelServer {
  void connect();
  void emitEvent(SummonDuelEvent duelEvent);
  void dispose();
}
