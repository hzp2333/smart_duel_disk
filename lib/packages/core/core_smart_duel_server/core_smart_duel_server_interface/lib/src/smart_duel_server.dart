import 'models/smart_duel_event.dart';

abstract class SmartDuelServer {
  void init();
  Stream<SmartDuelEvent> get smartDuelEvents;
  void emitEvent(SmartDuelEvent event);
  void dispose();
}
