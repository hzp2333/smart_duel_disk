import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'smart_duel_event_data.dart';

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
