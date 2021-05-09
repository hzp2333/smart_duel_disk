import 'models/smart_duel_event.dart';

abstract class SmartDuelServer {
  void init();
  void emitSpeedDuelEvent(SmartDuelEvent duelEvent);
  void dispose();
}
