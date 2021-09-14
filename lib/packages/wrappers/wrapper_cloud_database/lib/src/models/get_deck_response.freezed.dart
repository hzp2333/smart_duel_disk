// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'get_deck_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetDeckResponse _$GetDeckResponseFromJson(Map<String, dynamic> json) {
  return _GetDeckResponse.fromJson(json);
}

/// @nodoc
class _$GetDeckResponseTearOff {
  const _$GetDeckResponseTearOff();

  _GetDeckResponse call({required List<int> cardIds}) {
    return _GetDeckResponse(
      cardIds: cardIds,
    );
  }

  GetDeckResponse fromJson(Map<String, Object> json) {
    return GetDeckResponse.fromJson(json);
  }
}

/// @nodoc
const $GetDeckResponse = _$GetDeckResponseTearOff();

/// @nodoc
mixin _$GetDeckResponse {
  List<int> get cardIds => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetDeckResponseCopyWith<GetDeckResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetDeckResponseCopyWith<$Res> {
  factory $GetDeckResponseCopyWith(
          GetDeckResponse value, $Res Function(GetDeckResponse) then) =
      _$GetDeckResponseCopyWithImpl<$Res>;
  $Res call({List<int> cardIds});
}

/// @nodoc
class _$GetDeckResponseCopyWithImpl<$Res>
    implements $GetDeckResponseCopyWith<$Res> {
  _$GetDeckResponseCopyWithImpl(this._value, this._then);

  final GetDeckResponse _value;
  // ignore: unused_field
  final $Res Function(GetDeckResponse) _then;

  @override
  $Res call({
    Object? cardIds = freezed,
  }) {
    return _then(_value.copyWith(
      cardIds: cardIds == freezed
          ? _value.cardIds
          : cardIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
abstract class _$GetDeckResponseCopyWith<$Res>
    implements $GetDeckResponseCopyWith<$Res> {
  factory _$GetDeckResponseCopyWith(
          _GetDeckResponse value, $Res Function(_GetDeckResponse) then) =
      __$GetDeckResponseCopyWithImpl<$Res>;
  @override
  $Res call({List<int> cardIds});
}

/// @nodoc
class __$GetDeckResponseCopyWithImpl<$Res>
    extends _$GetDeckResponseCopyWithImpl<$Res>
    implements _$GetDeckResponseCopyWith<$Res> {
  __$GetDeckResponseCopyWithImpl(
      _GetDeckResponse _value, $Res Function(_GetDeckResponse) _then)
      : super(_value, (v) => _then(v as _GetDeckResponse));

  @override
  _GetDeckResponse get _value => super._value as _GetDeckResponse;

  @override
  $Res call({
    Object? cardIds = freezed,
  }) {
    return _then(_GetDeckResponse(
      cardIds: cardIds == freezed
          ? _value.cardIds
          : cardIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GetDeckResponse implements _GetDeckResponse {
  const _$_GetDeckResponse({required this.cardIds});

  factory _$_GetDeckResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_GetDeckResponseFromJson(json);

  @override
  final List<int> cardIds;

  @override
  String toString() {
    return 'GetDeckResponse(cardIds: $cardIds)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GetDeckResponse &&
            (identical(other.cardIds, cardIds) ||
                const DeepCollectionEquality().equals(other.cardIds, cardIds)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(cardIds);

  @JsonKey(ignore: true)
  @override
  _$GetDeckResponseCopyWith<_GetDeckResponse> get copyWith =>
      __$GetDeckResponseCopyWithImpl<_GetDeckResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_GetDeckResponseToJson(this);
  }
}

abstract class _GetDeckResponse implements GetDeckResponse {
  const factory _GetDeckResponse({required List<int> cardIds}) =
      _$_GetDeckResponse;

  factory _GetDeckResponse.fromJson(Map<String, dynamic> json) =
      _$_GetDeckResponse.fromJson;

  @override
  List<int> get cardIds => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$GetDeckResponseCopyWith<_GetDeckResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
