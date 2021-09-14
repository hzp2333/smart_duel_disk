// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'speed_duel_card_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SpeedDuelCardModel _$SpeedDuelCardModelFromJson(Map<String, dynamic> json) {
  return _SpeedDuelCardModel.fromJson(json);
}

/// @nodoc
class _$SpeedDuelCardModelTearOff {
  const _$SpeedDuelCardModelTearOff();

  _SpeedDuelCardModel call(
      {@JsonKey(name: 'id') required int id,
      @JsonKey(name: 'name') required String name,
      @JsonKey(name: 'type') required String type,
      @JsonKey(name: 'desc') required String desc,
      @JsonKey(name: 'race') required String race,
      @JsonKey(name: 'card_images') required List<CardImageModel> cardImages,
      @JsonKey(name: 'card_sets') List<CardSetModel>? cardSets,
      @JsonKey(name: 'card_prices') List<CardPriceModel>? cardPrices,
      @JsonKey(name: 'atk') int? atk,
      @JsonKey(name: 'def') int? def,
      @JsonKey(name: 'level') int? level,
      @JsonKey(name: 'attribute') String? attribute,
      @JsonKey(name: 'archetype') String? archetype,
      @JsonKey(name: 'banlist_info') BanListInfoModel? banListInfo}) {
    return _SpeedDuelCardModel(
      id: id,
      name: name,
      type: type,
      desc: desc,
      race: race,
      cardImages: cardImages,
      cardSets: cardSets,
      cardPrices: cardPrices,
      atk: atk,
      def: def,
      level: level,
      attribute: attribute,
      archetype: archetype,
      banListInfo: banListInfo,
    );
  }

  SpeedDuelCardModel fromJson(Map<String, Object> json) {
    return SpeedDuelCardModel.fromJson(json);
  }
}

/// @nodoc
const $SpeedDuelCardModel = _$SpeedDuelCardModelTearOff();

/// @nodoc
mixin _$SpeedDuelCardModel {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'desc')
  String get desc => throw _privateConstructorUsedError;
  @JsonKey(name: 'race')
  String get race => throw _privateConstructorUsedError;
  @JsonKey(name: 'card_images')
  List<CardImageModel> get cardImages => throw _privateConstructorUsedError;
  @JsonKey(name: 'card_sets')
  List<CardSetModel>? get cardSets => throw _privateConstructorUsedError;
  @JsonKey(name: 'card_prices')
  List<CardPriceModel>? get cardPrices => throw _privateConstructorUsedError;
  @JsonKey(name: 'atk')
  int? get atk => throw _privateConstructorUsedError;
  @JsonKey(name: 'def')
  int? get def => throw _privateConstructorUsedError;
  @JsonKey(name: 'level')
  int? get level => throw _privateConstructorUsedError;
  @JsonKey(name: 'attribute')
  String? get attribute => throw _privateConstructorUsedError;
  @JsonKey(name: 'archetype')
  String? get archetype => throw _privateConstructorUsedError;
  @JsonKey(name: 'banlist_info')
  BanListInfoModel? get banListInfo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SpeedDuelCardModelCopyWith<SpeedDuelCardModel> get copyWith =>
      throw _privateConstructorUsedError;
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
      @JsonKey(name: 'card_images') List<CardImageModel> cardImages,
      @JsonKey(name: 'card_sets') List<CardSetModel>? cardSets,
      @JsonKey(name: 'card_prices') List<CardPriceModel>? cardPrices,
      @JsonKey(name: 'atk') int? atk,
      @JsonKey(name: 'def') int? def,
      @JsonKey(name: 'level') int? level,
      @JsonKey(name: 'attribute') String? attribute,
      @JsonKey(name: 'archetype') String? archetype,
      @JsonKey(name: 'banlist_info') BanListInfoModel? banListInfo});

  $BanListInfoModelCopyWith<$Res>? get banListInfo;
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
    Object? id = freezed,
    Object? name = freezed,
    Object? type = freezed,
    Object? desc = freezed,
    Object? race = freezed,
    Object? cardImages = freezed,
    Object? cardSets = freezed,
    Object? cardPrices = freezed,
    Object? atk = freezed,
    Object? def = freezed,
    Object? level = freezed,
    Object? attribute = freezed,
    Object? archetype = freezed,
    Object? banListInfo = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      desc: desc == freezed
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
      race: race == freezed
          ? _value.race
          : race // ignore: cast_nullable_to_non_nullable
              as String,
      cardImages: cardImages == freezed
          ? _value.cardImages
          : cardImages // ignore: cast_nullable_to_non_nullable
              as List<CardImageModel>,
      cardSets: cardSets == freezed
          ? _value.cardSets
          : cardSets // ignore: cast_nullable_to_non_nullable
              as List<CardSetModel>?,
      cardPrices: cardPrices == freezed
          ? _value.cardPrices
          : cardPrices // ignore: cast_nullable_to_non_nullable
              as List<CardPriceModel>?,
      atk: atk == freezed
          ? _value.atk
          : atk // ignore: cast_nullable_to_non_nullable
              as int?,
      def: def == freezed
          ? _value.def
          : def // ignore: cast_nullable_to_non_nullable
              as int?,
      level: level == freezed
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int?,
      attribute: attribute == freezed
          ? _value.attribute
          : attribute // ignore: cast_nullable_to_non_nullable
              as String?,
      archetype: archetype == freezed
          ? _value.archetype
          : archetype // ignore: cast_nullable_to_non_nullable
              as String?,
      banListInfo: banListInfo == freezed
          ? _value.banListInfo
          : banListInfo // ignore: cast_nullable_to_non_nullable
              as BanListInfoModel?,
    ));
  }

  @override
  $BanListInfoModelCopyWith<$Res>? get banListInfo {
    if (_value.banListInfo == null) {
      return null;
    }

    return $BanListInfoModelCopyWith<$Res>(_value.banListInfo!, (value) {
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
      @JsonKey(name: 'card_images') List<CardImageModel> cardImages,
      @JsonKey(name: 'card_sets') List<CardSetModel>? cardSets,
      @JsonKey(name: 'card_prices') List<CardPriceModel>? cardPrices,
      @JsonKey(name: 'atk') int? atk,
      @JsonKey(name: 'def') int? def,
      @JsonKey(name: 'level') int? level,
      @JsonKey(name: 'attribute') String? attribute,
      @JsonKey(name: 'archetype') String? archetype,
      @JsonKey(name: 'banlist_info') BanListInfoModel? banListInfo});

  @override
  $BanListInfoModelCopyWith<$Res>? get banListInfo;
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
    Object? id = freezed,
    Object? name = freezed,
    Object? type = freezed,
    Object? desc = freezed,
    Object? race = freezed,
    Object? cardImages = freezed,
    Object? cardSets = freezed,
    Object? cardPrices = freezed,
    Object? atk = freezed,
    Object? def = freezed,
    Object? level = freezed,
    Object? attribute = freezed,
    Object? archetype = freezed,
    Object? banListInfo = freezed,
  }) {
    return _then(_SpeedDuelCardModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      desc: desc == freezed
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
      race: race == freezed
          ? _value.race
          : race // ignore: cast_nullable_to_non_nullable
              as String,
      cardImages: cardImages == freezed
          ? _value.cardImages
          : cardImages // ignore: cast_nullable_to_non_nullable
              as List<CardImageModel>,
      cardSets: cardSets == freezed
          ? _value.cardSets
          : cardSets // ignore: cast_nullable_to_non_nullable
              as List<CardSetModel>?,
      cardPrices: cardPrices == freezed
          ? _value.cardPrices
          : cardPrices // ignore: cast_nullable_to_non_nullable
              as List<CardPriceModel>?,
      atk: atk == freezed
          ? _value.atk
          : atk // ignore: cast_nullable_to_non_nullable
              as int?,
      def: def == freezed
          ? _value.def
          : def // ignore: cast_nullable_to_non_nullable
              as int?,
      level: level == freezed
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int?,
      attribute: attribute == freezed
          ? _value.attribute
          : attribute // ignore: cast_nullable_to_non_nullable
              as String?,
      archetype: archetype == freezed
          ? _value.archetype
          : archetype // ignore: cast_nullable_to_non_nullable
              as String?,
      banListInfo: banListInfo == freezed
          ? _value.banListInfo
          : banListInfo // ignore: cast_nullable_to_non_nullable
              as BanListInfoModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SpeedDuelCardModel implements _SpeedDuelCardModel {
  const _$_SpeedDuelCardModel(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'type') required this.type,
      @JsonKey(name: 'desc') required this.desc,
      @JsonKey(name: 'race') required this.race,
      @JsonKey(name: 'card_images') required this.cardImages,
      @JsonKey(name: 'card_sets') this.cardSets,
      @JsonKey(name: 'card_prices') this.cardPrices,
      @JsonKey(name: 'atk') this.atk,
      @JsonKey(name: 'def') this.def,
      @JsonKey(name: 'level') this.level,
      @JsonKey(name: 'attribute') this.attribute,
      @JsonKey(name: 'archetype') this.archetype,
      @JsonKey(name: 'banlist_info') this.banListInfo});

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
  @JsonKey(name: 'card_images')
  final List<CardImageModel> cardImages;
  @override
  @JsonKey(name: 'card_sets')
  final List<CardSetModel>? cardSets;
  @override
  @JsonKey(name: 'card_prices')
  final List<CardPriceModel>? cardPrices;
  @override
  @JsonKey(name: 'atk')
  final int? atk;
  @override
  @JsonKey(name: 'def')
  final int? def;
  @override
  @JsonKey(name: 'level')
  final int? level;
  @override
  @JsonKey(name: 'attribute')
  final String? attribute;
  @override
  @JsonKey(name: 'archetype')
  final String? archetype;
  @override
  @JsonKey(name: 'banlist_info')
  final BanListInfoModel? banListInfo;

  @override
  String toString() {
    return 'SpeedDuelCardModel(id: $id, name: $name, type: $type, desc: $desc, race: $race, cardImages: $cardImages, cardSets: $cardSets, cardPrices: $cardPrices, atk: $atk, def: $def, level: $level, attribute: $attribute, archetype: $archetype, banListInfo: $banListInfo)';
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
            (identical(other.cardImages, cardImages) ||
                const DeepCollectionEquality()
                    .equals(other.cardImages, cardImages)) &&
            (identical(other.cardSets, cardSets) ||
                const DeepCollectionEquality()
                    .equals(other.cardSets, cardSets)) &&
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
      const DeepCollectionEquality().hash(cardImages) ^
      const DeepCollectionEquality().hash(cardSets) ^
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
      {@JsonKey(name: 'id')
          required int id,
      @JsonKey(name: 'name')
          required String name,
      @JsonKey(name: 'type')
          required String type,
      @JsonKey(name: 'desc')
          required String desc,
      @JsonKey(name: 'race')
          required String race,
      @JsonKey(name: 'card_images')
          required List<CardImageModel> cardImages,
      @JsonKey(name: 'card_sets')
          List<CardSetModel>? cardSets,
      @JsonKey(name: 'card_prices')
          List<CardPriceModel>? cardPrices,
      @JsonKey(name: 'atk')
          int? atk,
      @JsonKey(name: 'def')
          int? def,
      @JsonKey(name: 'level')
          int? level,
      @JsonKey(name: 'attribute')
          String? attribute,
      @JsonKey(name: 'archetype')
          String? archetype,
      @JsonKey(name: 'banlist_info')
          BanListInfoModel? banListInfo}) = _$_SpeedDuelCardModel;

  factory _SpeedDuelCardModel.fromJson(Map<String, dynamic> json) =
      _$_SpeedDuelCardModel.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'type')
  String get type => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'desc')
  String get desc => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'race')
  String get race => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'card_images')
  List<CardImageModel> get cardImages => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'card_sets')
  List<CardSetModel>? get cardSets => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'card_prices')
  List<CardPriceModel>? get cardPrices => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'atk')
  int? get atk => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'def')
  int? get def => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'level')
  int? get level => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'attribute')
  String? get attribute => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'archetype')
  String? get archetype => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'banlist_info')
  BanListInfoModel? get banListInfo => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SpeedDuelCardModelCopyWith<_SpeedDuelCardModel> get copyWith =>
      throw _privateConstructorUsedError;
}
