// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_price_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CardPriceModel _$$_CardPriceModelFromJson(Map<String, dynamic> json) =>
    _$_CardPriceModel(
      cardmarketPrice: json['cardmarket_price'] as String,
      tcgplayerPrice: json['tcgplayer_price'] as String,
      ebayPrice: json['ebay_price'] as String,
      amazonPrice: json['amazon_price'] as String,
      coolstuffincPrice: json['coolstuffinc_price'] as String,
    );

Map<String, dynamic> _$$_CardPriceModelToJson(_$_CardPriceModel instance) =>
    <String, dynamic>{
      'cardmarket_price': instance.cardmarketPrice,
      'tcgplayer_price': instance.tcgplayerPrice,
      'ebay_price': instance.ebayPrice,
      'amazon_price': instance.amazonPrice,
      'coolstuffinc_price': instance.coolstuffincPrice,
    };
