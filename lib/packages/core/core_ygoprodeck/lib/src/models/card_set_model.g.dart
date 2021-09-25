// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_set_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CardSetModel _$$_CardSetModelFromJson(Map<String, dynamic> json) =>
    _$_CardSetModel(
      setName: json['set_name'] as String,
      setCode: json['set_code'] as String,
      setRarity: json['set_rarity'] as String,
      setRarityCode: json['set_rarity_code'] as String,
      setPrice: json['set_price'] as String,
    );

Map<String, dynamic> _$$_CardSetModelToJson(_$_CardSetModel instance) =>
    <String, dynamic>{
      'set_name': instance.setName,
      'set_code': instance.setCode,
      'set_rarity': instance.setRarity,
      'set_rarity_code': instance.setRarityCode,
      'set_price': instance.setPrice,
    };
