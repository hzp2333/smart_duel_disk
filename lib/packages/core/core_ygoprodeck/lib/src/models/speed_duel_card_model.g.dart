// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'speed_duel_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SpeedDuelCardModel _$_$_SpeedDuelCardModelFromJson(
    Map<String, dynamic> json) {
  return _$_SpeedDuelCardModel(
    id: json['id'] as int,
    name: json['name'] as String,
    type: json['type'] as String,
    desc: json['desc'] as String,
    race: json['race'] as String,
    cardImages: (json['card_images'] as List<dynamic>)
        .map((e) => CardImageModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    cardSets: (json['card_sets'] as List<dynamic>?)
        ?.map((e) => CardSetModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    cardPrices: (json['card_prices'] as List<dynamic>?)
        ?.map((e) => CardPriceModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    atk: json['atk'] as int?,
    def: json['def'] as int?,
    level: json['level'] as int?,
    attribute: json['attribute'] as String?,
    archetype: json['archetype'] as String?,
    banListInfo: json['banlist_info'] == null
        ? null
        : BanListInfoModel.fromJson(
            json['banlist_info'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_SpeedDuelCardModelToJson(
        _$_SpeedDuelCardModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'desc': instance.desc,
      'race': instance.race,
      'card_images': instance.cardImages,
      'card_sets': instance.cardSets,
      'card_prices': instance.cardPrices,
      'atk': instance.atk,
      'def': instance.def,
      'level': instance.level,
      'attribute': instance.attribute,
      'archetype': instance.archetype,
      'banlist_info': instance.banListInfo,
    };
