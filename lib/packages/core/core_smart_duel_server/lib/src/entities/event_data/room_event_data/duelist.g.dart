// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'duelist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Duelist _$DuelistFromJson(Map<String, dynamic> json) {
  return Duelist(
    id: json['id'] as String?,
    deckList: (json['deckList'] as List<dynamic>?)?.map((e) => e as int),
  );
}

Map<String, dynamic> _$DuelistToJson(Duelist instance) => <String, dynamic>{
      'id': instance.id,
      'deckList': instance.deckList?.toList(),
    };
