import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../core_smart_duel_server_interface.dart';

part 'room_event_data.g.dart';

enum RoomError {
  @JsonValue('roomNotFound')
  roomNotFound,

  @JsonValue('tooManyPlayers')
  tooManyPlayers,

  unknown,
}

@immutable
@JsonSerializable()
class RoomEventData extends Equatable implements SmartDuelEventData {
  final String roomName;
  final bool ready;
  @JsonKey(unknownEnumValue: RoomError.unknown)
  final RoomError error;

  const RoomEventData({
    this.roomName,
    this.ready = false,
    this.error,
  });

  @override
  List<Object> get props => [
        roomName,
        ready,
        error,
      ];

  @override
  bool get stringify => true;

  @override
  Map<String, dynamic> toJson() => _$RoomEventDataToJson(this);

  factory RoomEventData.fromJson(Map<String, dynamic> json) => _$RoomEventDataFromJson(json);
}
