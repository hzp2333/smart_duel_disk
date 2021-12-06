// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'duel_phase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DuelPhase _$DuelPhaseFromJson(Map<String, dynamic> json) => DuelPhase(
      duelistId: json['duelistId'] as String,
      duelPhaseType: _$enumDecode(_$DuelPhaseTypeEnumMap, json['duelPhaseType'],
          unknownValue: DuelPhaseType.unknown),
    );

Map<String, dynamic> _$DuelPhaseToJson(DuelPhase instance) => <String, dynamic>{
      'duelistId': instance.duelistId,
      'duelPhaseType': _$DuelPhaseTypeEnumMap[instance.duelPhaseType],
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

const _$DuelPhaseTypeEnumMap = {
  DuelPhaseType.drawPhase: 'drawPhase',
  DuelPhaseType.standbyPhase: 'standbyPhase',
  DuelPhaseType.mainPhase1: 'mainPhase1',
  DuelPhaseType.battlePhase: 'battlePhase',
  DuelPhaseType.endPhase: 'endPhase',
  DuelPhaseType.unknown: 'unknown',
};
