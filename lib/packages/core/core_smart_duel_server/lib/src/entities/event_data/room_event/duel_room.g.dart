// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'duel_room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DuelRoom _$DuelRoomFromJson(Map<String, dynamic> json) => DuelRoom(
      roomName: json['roomName'] as String,
      duelists: (json['duelists'] as List<dynamic>)
          .map((e) => Duelist.fromJson(e as Map<String, dynamic>)),
      duelistLimit: json['duelistLimit'] as int,
      duelPhase: DuelPhase.fromJson(json['duelPhase'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DuelRoomToJson(DuelRoom instance) => <String, dynamic>{
      'roomName': instance.roomName,
      'duelists': instance.duelists.toList(),
      'duelistLimit': instance.duelistLimit,
      'duelPhase': instance.duelPhase,
    };
