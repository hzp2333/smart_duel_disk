// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      decks: (json['decks'] as List<dynamic>)
          .map((e) => UserDeck.fromJson(e as Map<String, dynamic>)),
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'decks': instance.decks.map((e) => e.toJson()).toList(),
    };
