import 'package:smart_duel_disk/packages/core/core_smart_duel_server/core_smart_duel_server_interface/lib/core_smart_duel_server_interface.dart';

abstract class WebSocketProvider {
  void init(SmartDuelEventReceiver receiver);
  String getSocketId();
  void emitEvent(String eventName, Map<String, dynamic> data);
  void dispose();
}
