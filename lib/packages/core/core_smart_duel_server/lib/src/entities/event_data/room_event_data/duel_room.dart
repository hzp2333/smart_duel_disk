import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'duelist.dart';

part 'duel_room.g.dart';

@immutable
@JsonSerializable()
class DuelRoom extends Equatable {
  final String roomName;
  final Iterable<Duelist> duelists;
  final int duelistLimit;

  const DuelRoom({
    @required this.roomName,
    @required this.duelists,
    @required this.duelistLimit,
  });

  @override
  List<Object> get props => [
        roomName,
        duelists,
        duelistLimit,
      ];

  @override
  bool get stringify => true;

  Map<String, dynamic> toJson() => _$DuelRoomToJson(this);
  factory DuelRoom.fromJson(Map<String, dynamic> json) => _$DuelRoomFromJson(json);
}
