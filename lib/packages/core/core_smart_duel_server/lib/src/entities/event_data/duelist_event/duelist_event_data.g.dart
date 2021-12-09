// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'duelist_event_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DuelistEventData _$DuelistEventDataFromJson(Map<String, dynamic> json) =>
    DuelistEventData(
      duelistId: json['duelistId'] as String,
      phase: _$enumDecodeNullable(_$DuelPhaseTypeEnumMap, json['phase']),
      result: json['result'] as String?,
      lifepoints: json['lifepoints'] as int?,
    );

Map<String, dynamic> _$DuelistEventDataToJson(DuelistEventData instance) =>
    <String, dynamic>{
      'duelistId': instance.duelistId,
      'phase': _$DuelPhaseTypeEnumMap[instance.phase],
      'result': instance.result,
      'lifepoints': instance.lifepoints,
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

const _$DuelPhaseTypeEnumMap = {
  DuelPhaseType.drawPhase: 'drawPhase',
  DuelPhaseType.standbyPhase: 'standbyPhase',
  DuelPhaseType.mainPhase1: 'mainPhase1',
  DuelPhaseType.battlePhase: 'battlePhase',
  DuelPhaseType.endPhase: 'endPhase',
  DuelPhaseType.unknown: 'unknown',
};
