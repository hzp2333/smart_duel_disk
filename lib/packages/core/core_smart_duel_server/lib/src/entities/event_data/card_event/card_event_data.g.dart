// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_event_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardEventData _$CardEventDataFromJson(Map<String, dynamic> json) =>
    CardEventData(
      duelistId: json['duelistId'] as String,
      cardId: json['cardId'] as int,
      copyNumber: json['copyNumber'] as int,
      zoneName: json['zoneName'] as String?,
      cardPosition: json['cardPosition'] as String?,
      cardPlayType: _$enumDecodeNullable(
          _$CardPlayTypeEnumMap, json['cardPlayType'],
          unknownValue: CardPlayType.other),
    );

Map<String, dynamic> _$CardEventDataToJson(CardEventData instance) =>
    <String, dynamic>{
      'duelistId': instance.duelistId,
      'cardId': instance.cardId,
      'copyNumber': instance.copyNumber,
      'zoneName': instance.zoneName,
      'cardPosition': instance.cardPosition,
      'cardPlayType': _$CardPlayTypeEnumMap[instance.cardPlayType],
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

const _$CardPlayTypeEnumMap = {
  CardPlayType.normalSummon: 'normalSummon',
  CardPlayType.specialSummon: 'specialSummon',
  CardPlayType.set: 'set',
  CardPlayType.activate: 'activate',
  CardPlayType.draw: 'draw',
  CardPlayType.other: 'other',
};
