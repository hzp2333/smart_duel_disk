import 'models/smart_duel_event.dart';

abstract class SmartDuelServer {
  void init();
  void emitEvent(SmartDuelEvent event);
  void dispose();
}
