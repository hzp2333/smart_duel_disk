import 'package:freezed_annotation/freezed_annotation.dart';

part 'card_price_model.freezed.dart';
part 'card_price_model.g.dart';

@freezed
class CardPriceModel with _$CardPriceModel {
  const factory CardPriceModel({
    @JsonKey(name: 'cardmarket_price') required String cardmarketPrice,
    @JsonKey(name: 'tcgplayer_price') required String tcgplayerPrice,
    @JsonKey(name: 'ebay_price') required String ebayPrice,
    @JsonKey(name: 'amazon_price') required String amazonPrice,
    @JsonKey(name: 'coolstuffinc_price') required String coolstuffincPrice,
  }) = _CardPriceModel;

  factory CardPriceModel.fromJson(Map<String, dynamic> json) => _$CardPriceModelFromJson(json);
}
