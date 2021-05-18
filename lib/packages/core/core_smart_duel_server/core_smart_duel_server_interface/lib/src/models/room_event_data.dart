import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../core_smart_duel_server_interface.dart';

part 'room_event_data.g.dart';

@immutable
@JsonSerializable()
class RoomEventData extends Equatable implements SmartDuelEventData {
  final String roomName;

  const RoomEventData({
    @required this.roomName,
  });

  @override
  List<Object> get props => [
        roomName,
      ];

  @override
  bool get stringify => true;

  @override
  Map<String, dynamic> toJson() => _$RoomEventDataToJson(this);

  factory RoomEventData.fromJson(Map<String, dynamic> json) => _$RoomEventDataFromJson(json);
}
