// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_deck.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDeck _$UserDeckFromJson(Map<String, dynamic> json) => UserDeck(
      id: json['id'] as String,
      name: json['name'] as String,
      cardIds: (json['cardIds'] as List<dynamic>).map((e) => e as int),
    );

Map<String, dynamic> _$UserDeckToJson(UserDeck instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'cardIds': instance.cardIds.toList(),
    };
