// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_deck_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GetDeckResponse _$_$_GetDeckResponseFromJson(Map<String, dynamic> json) {
  return _$_GetDeckResponse(
    cardIds: (json['cardIds'] as List)?.map((e) => e as int)?.toList(),
  );
}

Map<String, dynamic> _$_$_GetDeckResponseToJson(_$_GetDeckResponse instance) =>
    <String, dynamic>{
      'cardIds': instance.cardIds,
    };
