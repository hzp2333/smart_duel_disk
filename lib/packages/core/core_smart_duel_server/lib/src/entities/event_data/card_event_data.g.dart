// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_event_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardEventData _$CardEventDataFromJson(Map<String, dynamic> json) {
  return CardEventData(
    duelistId: json['duelistId'] as String,
    cardId: json['cardId'] as int,
    copyNumber: json['copyNumber'] as int,
    zoneName: json['zoneName'] as String,
    cardPosition: json['cardPosition'] as String,
  );
}

Map<String, dynamic> _$CardEventDataToJson(CardEventData instance) =>
    <String, dynamic>{
      'duelistId': instance.duelistId,
      'cardId': instance.cardId,
      'copyNumber': instance.copyNumber,
      'zoneName': instance.zoneName,
      'cardPosition': instance.cardPosition,
    };
