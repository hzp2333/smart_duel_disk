import 'models/smart_duel_event.dart';

abstract class SmartDuelServer {
  void init();
  Stream<SmartDuelEvent> get globalEvents;
  Stream<SmartDuelEvent> get roomEvents;
  Stream<SmartDuelEvent> get cardEvents;
  String getDuelistId();
  void emitEvent(SmartDuelEvent event);
  void dispose();
}
