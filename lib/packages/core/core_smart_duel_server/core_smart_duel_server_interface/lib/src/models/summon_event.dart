import 'package:freezed_annotation/freezed_annotation.dart';

part 'summon_event.freezed.dart';
part 'summon_event.g.dart';

@freezed
abstract class SummonEvent with _$SummonEvent {
  const factory SummonEvent({
    @required String yugiohCardId,
    @required String zoneName,
  }) = _SummonEvent;

  factory SummonEvent.fromJson(Map<String, dynamic> json) => _$SummonEventFromJson(json);
}
