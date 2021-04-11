// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'card_price_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
CardPriceModel _$CardPriceModelFromJson(Map<String, dynamic> json) {
  return _CardPriceModel.fromJson(json);
}

/// @nodoc
class _$CardPriceModelTearOff {
  const _$CardPriceModelTearOff();

// ignore: unused_element
  _CardPriceModel call(
      {@required
      @JsonKey(name: 'cardmarket_price')
          String cardmarketPrice,
      @required
      @JsonKey(name: 'tcgplayer_price')
          String tcgplayerPrice,
      @required
      @JsonKey(name: 'ebay_price')
          String ebayPrice,
      @required
      @JsonKey(name: 'amazon_price')
          String amazonPrice,
      @required
      @JsonKey(name: 'coolstuffinc_price')
          String coolstuffincPrice}) {
    return _CardPriceModel(
      cardmarketPrice: cardmarketPrice,
      tcgplayerPrice: tcgplayerPrice,
      ebayPrice: ebayPrice,
      amazonPrice: amazonPrice,
      coolstuffincPrice: coolstuffincPrice,
    );
  }

// ignore: unused_element
  CardPriceModel fromJson(Map<String, Object> json) {
    return CardPriceModel.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $CardPriceModel = _$CardPriceModelTearOff();

/// @nodoc
mixin _$CardPriceModel {
  @JsonKey(name: 'cardmarket_price')
  String get cardmarketPrice;
  @JsonKey(name: 'tcgplayer_price')
  String get tcgplayerPrice;
  @JsonKey(name: 'ebay_price')
  String get ebayPrice;
  @JsonKey(name: 'amazon_price')
  String get amazonPrice;
  @JsonKey(name: 'coolstuffinc_price')
  String get coolstuffincPrice;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $CardPriceModelCopyWith<CardPriceModel> get copyWith;
}

/// @nodoc
abstract class $CardPriceModelCopyWith<$Res> {
  factory $CardPriceModelCopyWith(
          CardPriceModel value, $Res Function(CardPriceModel) then) =
      _$CardPriceModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'cardmarket_price') String cardmarketPrice,
      @JsonKey(name: 'tcgplayer_price') String tcgplayerPrice,
      @JsonKey(name: 'ebay_price') String ebayPrice,
      @JsonKey(name: 'amazon_price') String amazonPrice,
      @JsonKey(name: 'coolstuffinc_price') String coolstuffincPrice});
}

/// @nodoc
class _$CardPriceModelCopyWithImpl<$Res>
    implements $CardPriceModelCopyWith<$Res> {
  _$CardPriceModelCopyWithImpl(this._value, this._then);

  final CardPriceModel _value;
  // ignore: unused_field
  final $Res Function(CardPriceModel) _then;

  @override
  $Res call({
    Object cardmarketPrice = freezed,
    Object tcgplayerPrice = freezed,
    Object ebayPrice = freezed,
    Object amazonPrice = freezed,
    Object coolstuffincPrice = freezed,
  }) {
    return _then(_value.copyWith(
      cardmarketPrice: cardmarketPrice == freezed
          ? _value.cardmarketPrice
          : cardmarketPrice as String,
      tcgplayerPrice: tcgplayerPrice == freezed
          ? _value.tcgplayerPrice
          : tcgplayerPrice as String,
      ebayPrice: ebayPrice == freezed ? _value.ebayPrice : ebayPrice as String,
      amazonPrice:
          amazonPrice == freezed ? _value.amazonPrice : amazonPrice as String,
      coolstuffincPrice: coolstuffincPrice == freezed
          ? _value.coolstuffincPrice
          : coolstuffincPrice as String,
    ));
  }
}

/// @nodoc
abstract class _$CardPriceModelCopyWith<$Res>
    implements $CardPriceModelCopyWith<$Res> {
  factory _$CardPriceModelCopyWith(
          _CardPriceModel value, $Res Function(_CardPriceModel) then) =
      __$CardPriceModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'cardmarket_price') String cardmarketPrice,
      @JsonKey(name: 'tcgplayer_price') String tcgplayerPrice,
      @JsonKey(name: 'ebay_price') String ebayPrice,
      @JsonKey(name: 'amazon_price') String amazonPrice,
      @JsonKey(name: 'coolstuffinc_price') String coolstuffincPrice});
}

/// @nodoc
class __$CardPriceModelCopyWithImpl<$Res>
    extends _$CardPriceModelCopyWithImpl<$Res>
    implements _$CardPriceModelCopyWith<$Res> {
  __$CardPriceModelCopyWithImpl(
      _CardPriceModel _value, $Res Function(_CardPriceModel) _then)
      : super(_value, (v) => _then(v as _CardPriceModel));

  @override
  _CardPriceModel get _value => super._value as _CardPriceModel;

  @override
  $Res call({
    Object cardmarketPrice = freezed,
    Object tcgplayerPrice = freezed,
    Object ebayPrice = freezed,
    Object amazonPrice = freezed,
    Object coolstuffincPrice = freezed,
  }) {
    return _then(_CardPriceModel(
      cardmarketPrice: cardmarketPrice == freezed
          ? _value.cardmarketPrice
          : cardmarketPrice as String,
      tcgplayerPrice: tcgplayerPrice == freezed
          ? _value.tcgplayerPrice
          : tcgplayerPrice as String,
      ebayPrice: ebayPrice == freezed ? _value.ebayPrice : ebayPrice as String,
      amazonPrice:
          amazonPrice == freezed ? _value.amazonPrice : amazonPrice as String,
      coolstuffincPrice: coolstuffincPrice == freezed
          ? _value.coolstuffincPrice
          : coolstuffincPrice as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_CardPriceModel implements _CardPriceModel {
  const _$_CardPriceModel(
      {@required @JsonKey(name: 'cardmarket_price') this.cardmarketPrice,
      @required @JsonKey(name: 'tcgplayer_price') this.tcgplayerPrice,
      @required @JsonKey(name: 'ebay_price') this.ebayPrice,
      @required @JsonKey(name: 'amazon_price') this.amazonPrice,
      @required @JsonKey(name: 'coolstuffinc_price') this.coolstuffincPrice})
      : assert(cardmarketPrice != null),
        assert(tcgplayerPrice != null),
        assert(ebayPrice != null),
        assert(amazonPrice != null),
        assert(coolstuffincPrice != null);

  factory _$_CardPriceModel.fromJson(Map<String, dynamic> json) =>
      _$_$_CardPriceModelFromJson(json);

  @override
  @JsonKey(name: 'cardmarket_price')
  final String cardmarketPrice;
  @override
  @JsonKey(name: 'tcgplayer_price')
  final String tcgplayerPrice;
  @override
  @JsonKey(name: 'ebay_price')
  final String ebayPrice;
  @override
  @JsonKey(name: 'amazon_price')
  final String amazonPrice;
  @override
  @JsonKey(name: 'coolstuffinc_price')
  final String coolstuffincPrice;

  @override
  String toString() {
    return 'CardPriceModel(cardmarketPrice: $cardmarketPrice, tcgplayerPrice: $tcgplayerPrice, ebayPrice: $ebayPrice, amazonPrice: $amazonPrice, coolstuffincPrice: $coolstuffincPrice)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CardPriceModel &&
            (identical(other.cardmarketPrice, cardmarketPrice) ||
                const DeepCollectionEquality()
                    .equals(other.cardmarketPrice, cardmarketPrice)) &&
            (identical(other.tcgplayerPrice, tcgplayerPrice) ||
                const DeepCollectionEquality()
                    .equals(other.tcgplayerPrice, tcgplayerPrice)) &&
            (identical(other.ebayPrice, ebayPrice) ||
                const DeepCollectionEquality()
                    .equals(other.ebayPrice, ebayPrice)) &&
            (identical(other.amazonPrice, amazonPrice) ||
                const DeepCollectionEquality()
                    .equals(other.amazonPrice, amazonPrice)) &&
            (identical(other.coolstuffincPrice, coolstuffincPrice) ||
                const DeepCollectionEquality()
                    .equals(other.coolstuffincPrice, coolstuffincPrice)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(cardmarketPrice) ^
      const DeepCollectionEquality().hash(tcgplayerPrice) ^
      const DeepCollectionEquality().hash(ebayPrice) ^
      const DeepCollectionEquality().hash(amazonPrice) ^
      const DeepCollectionEquality().hash(coolstuffincPrice);

  @JsonKey(ignore: true)
  @override
  _$CardPriceModelCopyWith<_CardPriceModel> get copyWith =>
      __$CardPriceModelCopyWithImpl<_CardPriceModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CardPriceModelToJson(this);
  }
}

abstract class _CardPriceModel implements CardPriceModel {
  const factory _CardPriceModel(
      {@required
      @JsonKey(name: 'cardmarket_price')
          String cardmarketPrice,
      @required
      @JsonKey(name: 'tcgplayer_price')
          String tcgplayerPrice,
      @required
      @JsonKey(name: 'ebay_price')
          String ebayPrice,
      @required
      @JsonKey(name: 'amazon_price')
          String amazonPrice,
      @required
      @JsonKey(name: 'coolstuffinc_price')
          String coolstuffincPrice}) = _$_CardPriceModel;

  factory _CardPriceModel.fromJson(Map<String, dynamic> json) =
      _$_CardPriceModel.fromJson;

  @override
  @JsonKey(name: 'cardmarket_price')
  String get cardmarketPrice;
  @override
  @JsonKey(name: 'tcgplayer_price')
  String get tcgplayerPrice;
  @override
  @JsonKey(name: 'ebay_price')
  String get ebayPrice;
  @override
  @JsonKey(name: 'amazon_price')
  String get amazonPrice;
  @override
  @JsonKey(name: 'coolstuffinc_price')
  String get coolstuffincPrice;
  @override
  @JsonKey(ignore: true)
  _$CardPriceModelCopyWith<_CardPriceModel> get copyWith;
}
