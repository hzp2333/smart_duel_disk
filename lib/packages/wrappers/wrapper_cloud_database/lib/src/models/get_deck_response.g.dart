// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_deck_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GetDeckResponse _$$_GetDeckResponseFromJson(Map<String, dynamic> json) =>
    _$_GetDeckResponse(
      cardIds: (json['cardIds'] as List<dynamic>).map((e) => e as int).toList(),
    );

Map<String, dynamic> _$$_GetDeckResponseToJson(_$_GetDeckResponse instance) =>
    <String, dynamic>{
      'cardIds': instance.cardIds,
    };
