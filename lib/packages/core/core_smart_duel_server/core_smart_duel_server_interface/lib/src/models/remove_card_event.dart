import 'package:freezed_annotation/freezed_annotation.dart';

part 'remove_card_event.freezed.dart';
part 'remove_card_event.g.dart';

@freezed
abstract class RemoveCardEvent with _$RemoveCardEvent {
  const factory RemoveCardEvent({
    @required String zoneName,
  }) = _RemoveCardEvent;

  factory RemoveCardEvent.fromJson(Map<String, dynamic> json) => _$RemoveCardEventFromJson(json);
}
