import 'package:freezed_annotation/freezed_annotation.dart';

part 'card_price_model.freezed.dart';
part 'card_price_model.g.dart';

@freezed
abstract class CardPriceModel with _$CardPriceModel {
  const factory CardPriceModel({
    @required @JsonKey(name: 'cardmarket_price') String cardmarketPrice,
    @required @JsonKey(name: 'tcgplayer_price') String tcgplayerPrice,
    @required @JsonKey(name: 'ebay_price') String ebayPrice,
    @required @JsonKey(name: 'amazon_price') String amazonPrice,
    @required @JsonKey(name: 'coolstuffinc_price') String coolstuffincPrice,
  }) = _CardPriceModel;

  factory CardPriceModel.fromJson(Map<String, dynamic> json) => _$CardPriceModelFromJson(json);
}
