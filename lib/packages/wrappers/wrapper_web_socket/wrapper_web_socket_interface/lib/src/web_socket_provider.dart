abstract class WebSocketProvider {
  void init();
  void emitEvent(String eventName, Map<String, dynamic> data);
  void dispose();
}
