abstract class WebSocketProvider {
  void connect();
  bool isConnected();
  void emitEvent(String eventName, Map<String, dynamic> data);
  void dispose();
}
