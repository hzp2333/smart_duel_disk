import 'package:freezed_annotation/freezed_annotation.dart';

import 'remove_card_event.dart';
import 'summon_event.dart';

part 'speed_duel_event.freezed.dart';

@freezed
abstract class SpeedDuelEvent with _$SpeedDuelEvent {
  const factory SpeedDuelEvent.summon(SummonEvent data) = SummonDuelEvent;
  const factory SpeedDuelEvent.removeCard(RemoveCardEvent data) = RemoveCardDuelEvent;
}
