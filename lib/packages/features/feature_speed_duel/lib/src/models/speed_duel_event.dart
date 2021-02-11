import 'package:freezed_annotation/freezed_annotation.dart';

import 'zone.dart';

part 'speed_duel_event.freezed.dart';

@freezed
abstract class SpeedDuelEvent with _$SpeedDuelEvent {
  const factory SpeedDuelEvent.inspectCardPile(Zone zone) = SpeedDuelInspectCardPileEvent;
}
