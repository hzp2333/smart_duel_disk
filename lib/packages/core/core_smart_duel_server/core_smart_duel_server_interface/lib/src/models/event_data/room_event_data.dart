import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'room_event_data/duel_room.dart';
import 'room_event_data/room_error.dart';
import 'smart_duel_event_data.dart';

part 'room_event_data.g.dart';

@immutable
@JsonSerializable()
class RoomEventData extends Equatable implements SmartDuelEventData {
  final String roomName;
  @JsonKey(unknownEnumValue: RoomError.unknown)
  final RoomError error;
  final Iterable<int> deckList;
  final DuelRoom duelRoom;
  final String winnerId;

  const RoomEventData({
    this.roomName,
    this.error,
    this.deckList,
    this.duelRoom,
    this.winnerId,
  });

  factory RoomEventData.fromJson(Map<String, dynamic> json) => _$RoomEventDataFromJson(json);

  @override
  List<Object> get props => [
        roomName,
        error,
        deckList,
        duelRoom,
        winnerId,
      ];

  @override
  bool get stringify => true;

  @override
  Map<String, dynamic> toJson() => _$RoomEventDataToJson(this);
}
