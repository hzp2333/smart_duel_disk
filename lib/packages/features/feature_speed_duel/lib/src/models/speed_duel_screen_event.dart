import 'package:freezed_annotation/freezed_annotation.dart';

import 'zone.dart';

part 'speed_duel_screen_event.freezed.dart';

@freezed
abstract class SpeedDuelScreenEvent with _$SpeedDuelScreenEvent {
  const factory SpeedDuelScreenEvent.hideOverlays() = SpeedDuelHideOverlaysEvent;
  const factory SpeedDuelScreenEvent.inspectCardPile(Zone zone) = SpeedDuelInspectCardPileEvent;
}
