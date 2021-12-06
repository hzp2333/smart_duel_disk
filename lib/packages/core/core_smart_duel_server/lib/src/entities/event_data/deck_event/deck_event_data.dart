import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:smart_duel_disk/packages/core/core_smart_duel_server/lib/core_smart_duel_server.dart';

part 'deck_event_data.g.dart';

@immutable
@JsonSerializable()
class DeckEventData extends Equatable implements SmartDuelEventData {
  final String duelistId;

  const DeckEventData({
    required this.duelistId,
  });

  @override
  List<Object?> get props => [
        duelistId,
      ];

  @override
  bool get stringify => true;

  @override
  Map<String, dynamic> toJson() => _$DeckEventDataToJson(this);

  factory DeckEventData.fromJson(Map<String, dynamic> json) => _$DeckEventDataFromJson(json);
}
