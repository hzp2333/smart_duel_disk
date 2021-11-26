// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'duelist_event_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DuelistEventData _$DuelistEventDataFromJson(Map<String, dynamic> json) =>
    DuelistEventData(
      duelistId: json['duelistId'] as String,
      result: json['result'] as String?,
    );

Map<String, dynamic> _$DuelistEventDataToJson(DuelistEventData instance) =>
    <String, dynamic>{
      'duelistId': instance.duelistId,
      'result': instance.result,
    };
