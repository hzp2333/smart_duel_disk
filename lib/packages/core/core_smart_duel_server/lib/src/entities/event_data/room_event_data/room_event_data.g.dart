// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_event_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomEventData _$RoomEventDataFromJson(Map<String, dynamic> json) {
  return RoomEventData(
    roomName: json['roomName'] as String?,
    error: _$enumDecodeNullable(_$RoomErrorEnumMap, json['error'],
        unknownValue: RoomError.unknown),
    deckList: (json['deckList'] as List<dynamic>?)?.map((e) => e as int),
    duelRoom: json['duelRoom'] == null
        ? null
        : DuelRoom.fromJson(json['duelRoom'] as Map<String, dynamic>),
    winnerId: json['winnerId'] as String?,
  );
}

Map<String, dynamic> _$RoomEventDataToJson(RoomEventData instance) =>
    <String, dynamic>{
      'roomName': instance.roomName,
      'error': _$RoomErrorEnumMap[instance.error],
      'deckList': instance.deckList?.toList(),
      'duelRoom': instance.duelRoom,
      'winnerId': instance.winnerId,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$RoomErrorEnumMap = {
  RoomError.roomNotFound: 'roomNotFound',
  RoomError.tooManyPlayers: 'tooManyPlayers',
  RoomError.unknown: 'unknown',
};
