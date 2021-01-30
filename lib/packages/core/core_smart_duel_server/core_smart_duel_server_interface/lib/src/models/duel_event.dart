import 'package:freezed_annotation/freezed_annotation.dart';

part 'duel_event.freezed.dart';
part 'duel_event.g.dart';

@freezed
abstract class SummonDuelEvent with _$SummonDuelEvent {
  const factory SummonDuelEvent({
    @required String yugiohCardId,
    @required String zoneName,
  }) = _SummonDuelEvent;

  factory SummonDuelEvent.fromJson(Map<String, dynamic> json) => _$SummonDuelEventFromJson(json);
}
