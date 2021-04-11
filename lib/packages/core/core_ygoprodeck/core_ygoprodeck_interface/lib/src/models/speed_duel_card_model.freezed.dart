// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'speed_duel_card_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
SpeedDuelCardModel _$SpeedDuelCardModelFromJson(Map<String, dynamic> json) {
  return _SpeedDuelCardModel.fromJson(json);
}

/// @nodoc
class _$SpeedDuelCardModelTearOff {
  const _$SpeedDuelCardModelTearOff();

// ignore: unused_element
  _SpeedDuelCardModel call(
      {@required @JsonKey(name: 'id') int id,
      @required @JsonKey(name: 'name') String name,
      @required @JsonKey(name: 'type') String type,
      @required @JsonKey(name: 'desc') String desc,
      @required @JsonKey(name: 'race') String race,
      @required @JsonKey(name: 'card_sets') List<CardSetModel> cardSets,
      @required @JsonKey(name: 'card_images') List<CardImageModel> cardImages,
      @required @JsonKey(name: 'card_prices') List<CardPriceModel> cardPrices,
      @JsonKey(name: 'atk') int atk,
      @JsonKey(name: 'def') int def,
      @JsonKey(name: 'level') int level,
      @JsonKey(name: 'attribute') String attribute,
      @JsonKey(name: 'archetype') String archetype,
      @JsonKey(name: 'banlist_info') BanListInfoModel banListInfo}) {
    return _SpeedDuelCardModel(
      id: id,
      name: name,
      type: type,
      desc: desc,
      race: race,
      cardSets: cardSets,
      cardImages: cardImages,
      cardPrices: cardPrices,
      atk: atk,
      def: def,
      level: level,
      attribute: attribute,
      archetype: archetype,
      banListInfo: banListInfo,
    );
  }

// ignore: unused_element
  SpeedDuelCardModel fromJson(Map<String, Object> json) {
    return SpeedDuelCardModel.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $SpeedDuelCardModel = _$SpeedDuelCardModelTearOff();

/// @nodoc
mixin _$SpeedDuelCardModel {
  @JsonKey(name: 'id')
  int get id;
  @JsonKey(name: 'name')
  String get name;
  @JsonKey(name: 'type')
  String get type;
  @JsonKey(name: 'desc')
  String get desc;
  @JsonKey(name: 'race')
  String get race;
  @JsonKey(name: 'card_sets')
  List<CardSetModel> get cardSets;
  @JsonKey(name: 'card_images')
  List<CardImageModel> get cardImages;
  @JsonKey(name: 'card_prices')
  List<CardPriceModel> get cardPrices;
  @JsonKey(name: 'atk')
  int get atk;
  @JsonKey(name: 'def')
  int get def;
  @JsonKey(name: 'level')
  int get level;
  @JsonKey(name: 'attribute')
  String get attribute;
  @JsonKey(name: 'archetype')
  String get archetype;
  @JsonKey(name: 'banlist_info')
  BanListInfoModel get banListInfo;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $SpeedDuelCardModelCopyWith<SpeedDuelCardModel> get copyWith;
}

/// @nodoc
abstract class $SpeedDuelCardModelCopyWith<$Res> {
  factory $SpeedDuelCardModelCopyWith(
          SpeedDuelCardModel value, $Res Function(SpeedDuelCardModel) then) =
      _$SpeedDuelCardModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'type') String type,
      @JsonKey(name: 'desc') String desc,
      @JsonKey(name: 'race') String race,
      @JsonKey(name: 'card_sets') List<CardSetModel> cardSets,
      @JsonKey(name: 'card_images') List<CardImageModel> cardImages,
      @JsonKey(name: 'card_prices') List<CardPriceModel> cardPrices,
      @JsonKey(name: 'atk') int atk,
      @JsonKey(name: 'def') int def,
      @JsonKey(name: 'level') int level,
      @JsonKey(name: 'attribute') String attribute,
      @JsonKey(name: 'archetype') String archetype,
      @JsonKey(name: 'banlist_info') BanListInfoModel banListInfo});

  $BanListInfoModelCopyWith<$Res> get banListInfo;
}

/// @nodoc
class _$SpeedDuelCardModelCopyWithImpl<$Res>
    implements $SpeedDuelCardModelCopyWith<$Res> {
  _$SpeedDuelCardModelCopyWithImpl(this._value, this._then);

  final SpeedDuelCardModel _value;
  // ignore: unused_field
  final $Res Function(SpeedDuelCardModel) _then;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object type = freezed,
    Object desc = freezed,
    Object race = freezed,
    Object cardSets = freezed,
    Object cardImages = freezed,
    Object cardPrices = freezed,
    Object atk = freezed,
    Object def = freezed,
    Object level = freezed,
    Object attribute = freezed,
    Object archetype = freezed,
    Object banListInfo = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      name: name == freezed ? _value.name : name as String,
      type: type == freezed ? _value.type : type as String,
      desc: desc == freezed ? _value.desc : desc as String,
      race: race == freezed ? _value.race : race as String,
      cardSets: cardSets == freezed
          ? _value.cardSets
          : cardSets as List<CardSetModel>,
      cardImages: cardImages == freezed
          ? _value.cardImages
          : cardImages as List<CardImageModel>,
      cardPrices: cardPrices == freezed
          ? _value.cardPrices
          : cardPrices as List<CardPriceModel>,
      atk: atk == freezed ? _value.atk : atk as int,
      def: def == freezed ? _value.def : def as int,
      level: level == freezed ? _value.level : level as int,
      attribute: attribute == freezed ? _value.attribute : attribute as String,
      archetype: archetype == freezed ? _value.archetype : archetype as String,
      banListInfo: banListInfo == freezed
          ? _value.banListInfo
          : banListInfo as BanListInfoModel,
    ));
  }

  @override
  $BanListInfoModelCopyWith<$Res> get banListInfo {
    if (_value.banListInfo == null) {
      return null;
    }
    return $BanListInfoModelCopyWith<$Res>(_value.banListInfo, (value) {
      return _then(_value.copyWith(banListInfo: value));
    });
  }
}

/// @nodoc
abstract class _$SpeedDuelCardModelCopyWith<$Res>
    implements $SpeedDuelCardModelCopyWith<$Res> {
  factory _$SpeedDuelCardModelCopyWith(
          _SpeedDuelCardModel value, $Res Function(_SpeedDuelCardModel) then) =
      __$SpeedDuelCardModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'type') String type,
      @JsonKey(name: 'desc') String desc,
      @JsonKey(name: 'race') String race,
      @JsonKey(name: 'card_sets') List<CardSetModel> cardSets,
      @JsonKey(name: 'card_images') List<CardImageModel> cardImages,
      @JsonKey(name: 'card_prices') List<CardPriceModel> cardPrices,
      @JsonKey(name: 'atk') int atk,
      @JsonKey(name: 'def') int def,
      @JsonKey(name: 'level') int level,
      @JsonKey(name: 'attribute') String attribute,
      @JsonKey(name: 'archetype') String archetype,
      @JsonKey(name: 'banlist_info') BanListInfoModel banListInfo});

  @override
  $BanListInfoModelCopyWith<$Res> get banListInfo;
}

/// @nodoc
class __$SpeedDuelCardModelCopyWithImpl<$Res>
    extends _$SpeedDuelCardModelCopyWithImpl<$Res>
    implements _$SpeedDuelCardModelCopyWith<$Res> {
  __$SpeedDuelCardModelCopyWithImpl(
      _SpeedDuelCardModel _value, $Res Function(_SpeedDuelCardModel) _then)
      : super(_value, (v) => _then(v as _SpeedDuelCardModel));

  @override
  _SpeedDuelCardModel get _value => super._value as _SpeedDuelCardModel;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object type = freezed,
    Object desc = freezed,
    Object race = freezed,
    Object cardSets = freezed,
    Object cardImages = freezed,
    Object cardPrices = freezed,
    Object atk = freezed,
    Object def = freezed,
    Object level = freezed,
    Object attribute = freezed,
    Object archetype = freezed,
    Object banListInfo = freezed,
  }) {
    return _then(_SpeedDuelCardModel(
      id: id == freezed ? _value.id : id as int,
      name: name == freezed ? _value.name : name as String,
      type: type == freezed ? _value.type : type as String,
      desc: desc == freezed ? _value.desc : desc as String,
      race: race == freezed ? _value.race : race as String,
      cardSets: cardSets == freezed
          ? _value.cardSets
          : cardSets as List<CardSetModel>,
      cardImages: cardImages == freezed
          ? _value.cardImages
          : cardImages as List<CardImageModel>,
      cardPrices: cardPrices == freezed
          ? _value.cardPrices
          : cardPrices as List<CardPriceModel>,
      atk: atk == freezed ? _value.atk : atk as int,
      def: def == freezed ? _value.def : def as int,
      level: level == freezed ? _value.level : level as int,
      attribute: attribute == freezed ? _value.attribute : attribute as String,
      archetype: archetype == freezed ? _value.archetype : archetype as String,
      banListInfo: banListInfo == freezed
          ? _value.banListInfo
          : banListInfo as BanListInfoModel,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_SpeedDuelCardModel implements _SpeedDuelCardModel {
  const _$_SpeedDuelCardModel(
      {@required @JsonKey(name: 'id') this.id,
      @required @JsonKey(name: 'name') this.name,
      @required @JsonKey(name: 'type') this.type,
      @required @JsonKey(name: 'desc') this.desc,
      @required @JsonKey(name: 'race') this.race,
      @required @JsonKey(name: 'card_sets') this.cardSets,
      @required @JsonKey(name: 'card_images') this.cardImages,
      @required @JsonKey(name: 'card_prices') this.cardPrices,
      @JsonKey(name: 'atk') this.atk,
      @JsonKey(name: 'def') this.def,
      @JsonKey(name: 'level') this.level,
      @JsonKey(name: 'attribute') this.attribute,
      @JsonKey(name: 'archetype') this.archetype,
      @JsonKey(name: 'banlist_info') this.banListInfo})
      : assert(id != null),
        assert(name != null),
        assert(type != null),
        assert(desc != null),
        assert(race != null),
        assert(cardSets != null),
        assert(cardImages != null),
        assert(cardPrices != null);

  factory _$_SpeedDuelCardModel.fromJson(Map<String, dynamic> json) =>
      _$_$_SpeedDuelCardModelFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'type')
  final String type;
  @override
  @JsonKey(name: 'desc')
  final String desc;
  @override
  @JsonKey(name: 'race')
  final String race;
  @override
  @JsonKey(name: 'card_sets')
  final List<CardSetModel> cardSets;
  @override
  @JsonKey(name: 'card_images')
  final List<CardImageModel> cardImages;
  @override
  @JsonKey(name: 'card_prices')
  final List<CardPriceModel> cardPrices;
  @override
  @JsonKey(name: 'atk')
  final int atk;
  @override
  @JsonKey(name: 'def')
  final int def;
  @override
  @JsonKey(name: 'level')
  final int level;
  @override
  @JsonKey(name: 'attribute')
  final String attribute;
  @override
  @JsonKey(name: 'archetype')
  final String archetype;
  @override
  @JsonKey(name: 'banlist_info')
  final BanListInfoModel banListInfo;

  @override
  String toString() {
    return 'SpeedDuelCardModel(id: $id, name: $name, type: $type, desc: $desc, race: $race, cardSets: $cardSets, cardImages: $cardImages, cardPrices: $cardPrices, atk: $atk, def: $def, level: $level, attribute: $attribute, archetype: $archetype, banListInfo: $banListInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SpeedDuelCardModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.desc, desc) ||
                const DeepCollectionEquality().equals(other.desc, desc)) &&
            (identical(other.race, race) ||
                const DeepCollectionEquality().equals(other.race, race)) &&
            (identical(other.cardSets, cardSets) ||
                const DeepCollectionEquality()
                    .equals(other.cardSets, cardSets)) &&
            (identical(other.cardImages, cardImages) ||
                const DeepCollectionEquality()
                    .equals(other.cardImages, cardImages)) &&
            (identical(other.cardPrices, cardPrices) ||
                const DeepCollectionEquality()
                    .equals(other.cardPrices, cardPrices)) &&
            (identical(other.atk, atk) ||
                const DeepCollectionEquality().equals(other.atk, atk)) &&
            (identical(other.def, def) ||
                const DeepCollectionEquality().equals(other.def, def)) &&
            (identical(other.level, level) ||
                const DeepCollectionEquality().equals(other.level, level)) &&
            (identical(other.attribute, attribute) ||
                const DeepCollectionEquality()
                    .equals(other.attribute, attribute)) &&
            (identical(other.archetype, archetype) ||
                const DeepCollectionEquality()
                    .equals(other.archetype, archetype)) &&
            (identical(other.banListInfo, banListInfo) ||
                const DeepCollectionEquality()
                    .equals(other.banListInfo, banListInfo)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(desc) ^
      const DeepCollectionEquality().hash(race) ^
      const DeepCollectionEquality().hash(cardSets) ^
      const DeepCollectionEquality().hash(cardImages) ^
      const DeepCollectionEquality().hash(cardPrices) ^
      const DeepCollectionEquality().hash(atk) ^
      const DeepCollectionEquality().hash(def) ^
      const DeepCollectionEquality().hash(level) ^
      const DeepCollectionEquality().hash(attribute) ^
      const DeepCollectionEquality().hash(archetype) ^
      const DeepCollectionEquality().hash(banListInfo);

  @JsonKey(ignore: true)
  @override
  _$SpeedDuelCardModelCopyWith<_SpeedDuelCardModel> get copyWith =>
      __$SpeedDuelCardModelCopyWithImpl<_SpeedDuelCardModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SpeedDuelCardModelToJson(this);
  }
}

abstract class _SpeedDuelCardModel implements SpeedDuelCardModel {
  const factory _SpeedDuelCardModel(
      {@required
      @JsonKey(name: 'id')
          int id,
      @required
      @JsonKey(name: 'name')
          String name,
      @required
      @JsonKey(name: 'type')
          String type,
      @required
      @JsonKey(name: 'desc')
          String desc,
      @required
      @JsonKey(name: 'race')
          String race,
      @required
      @JsonKey(name: 'card_sets')
          List<CardSetModel> cardSets,
      @required
      @JsonKey(name: 'card_images')
          List<CardImageModel> cardImages,
      @required
      @JsonKey(name: 'card_prices')
          List<CardPriceModel> cardPrices,
      @JsonKey(name: 'atk')
          int atk,
      @JsonKey(name: 'def')
          int def,
      @JsonKey(name: 'level')
          int level,
      @JsonKey(name: 'attribute')
          String attribute,
      @JsonKey(name: 'archetype')
          String archetype,
      @JsonKey(name: 'banlist_info')
          BanListInfoModel banListInfo}) = _$_SpeedDuelCardModel;

  factory _SpeedDuelCardModel.fromJson(Map<String, dynamic> json) =
      _$_SpeedDuelCardModel.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'type')
  String get type;
  @override
  @JsonKey(name: 'desc')
  String get desc;
  @override
  @JsonKey(name: 'race')
  String get race;
  @override
  @JsonKey(name: 'card_sets')
  List<CardSetModel> get cardSets;
  @override
  @JsonKey(name: 'card_images')
  List<CardImageModel> get cardImages;
  @override
  @JsonKey(name: 'card_prices')
  List<CardPriceModel> get cardPrices;
  @override
  @JsonKey(name: 'atk')
  int get atk;
  @override
  @JsonKey(name: 'def')
  int get def;
  @override
  @JsonKey(name: 'level')
  int get level;
  @override
  @JsonKey(name: 'attribute')
  String get attribute;
  @override
  @JsonKey(name: 'archetype')
  String get archetype;
  @override
  @JsonKey(name: 'banlist_info')
  BanListInfoModel get banListInfo;
  @override
  @JsonKey(ignore: true)
  _$SpeedDuelCardModelCopyWith<_SpeedDuelCardModel> get copyWith;
}
