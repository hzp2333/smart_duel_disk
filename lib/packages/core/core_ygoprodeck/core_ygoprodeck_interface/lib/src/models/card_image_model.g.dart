// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CardImageModel _$_$_CardImageModelFromJson(Map<String, dynamic> json) {
  return _$_CardImageModel(
    id: json['cardmarket_price'] as int,
    imageUrl: json['image_url'] as String,
    imageUrlSmall: json['image_url_small'] as String,
  );
}

Map<String, dynamic> _$_$_CardImageModelToJson(_$_CardImageModel instance) =>
    <String, dynamic>{
      'cardmarket_price': instance.id,
      'image_url': instance.imageUrl,
      'image_url_small': instance.imageUrlSmall,
    };
