import 'models/smart_duel_event.dart';

abstract class SmartDuelServer {
  void init();
  Stream<SmartDuelEvent> get smartDuelEvents;
  String get duelistId;
  void emitEvent(SmartDuelEvent event);
  void dispose();
}
