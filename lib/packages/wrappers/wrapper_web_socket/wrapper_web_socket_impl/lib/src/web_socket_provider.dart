import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_web_socket/wrapper_web_socket_interface/lib/wrapper_web_socket_interface.dart';
import 'package:socket_io_client/socket_io_client.dart';

@Injectable(as: WebSocketProvider)
class WebSocketProviderImpl implements WebSocketProvider {
  final Socket _socket;

  WebSocketProviderImpl(
    this._socket,
  );

  @override
  void connect() {
    try {
      _socket.connect();

      // Handle socket events
      _socket.on('connect', (dynamic _) => print('connect2: ${_socket.id}'));
      _socket.on('location', (dynamic data) => handleLocationListen(data as Map<String, dynamic>));
      _socket.on('typing', (dynamic data) => handleTyping(data as Map<String, dynamic>));
      _socket.on('message', (dynamic data) => handleMessage(data as Map<String, dynamic>));
      _socket.on('disconnect', (dynamic _) => print('disconnect'));
      _socket.on('fromServer', (dynamic _) => print(_));

      sendLocation(<String, dynamic>{'Hallo': 'België'});
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void dispose() {
    _socket.dispose();
  }

  // Send Location to Server
  void sendLocation(Map<String, dynamic> data) {
    _socket.emit("location", data);
  }

  // Listen to Location updates of connected usersfrom server
  void handleLocationListen(Map<String, dynamic> data) async {
    print(data);
  }

  // Send update of user's typing status
  void sendTyping(bool typing) {
    _socket.emit("typing", {
      "id": _socket.id,
      "typing": typing,
    });
  }

  // Listen to update of typing status from connected users
  void handleTyping(Map<String, dynamic> data) {
    print(data);
  }

  // Send a Message to the server
  void sendMessage(String message) {
    _socket.emit(
      "message",
      {
        "id": _socket.id,
        "message": message, // Message to be sent
        "timestamp": DateTime.now().millisecondsSinceEpoch,
      },
    );
  }

  // Listen to all message events from connected users
  void handleMessage(Map<String, dynamic> data) {
    print(data);
  }
}
