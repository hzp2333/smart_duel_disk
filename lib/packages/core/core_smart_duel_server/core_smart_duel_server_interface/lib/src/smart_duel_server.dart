import 'models/speed_duel_event.dart';

abstract class SmartDuelServer {
  void connect();
  void emitSpeedDuelEvent(SpeedDuelEvent duelEvent);
  void dispose();
}
