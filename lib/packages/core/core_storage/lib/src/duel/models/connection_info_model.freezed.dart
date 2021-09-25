// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'connection_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ConnectionInfoModel _$ConnectionInfoModelFromJson(Map<String, dynamic> json) {
  return _ConnectionInfoModel.fromJson(json);
}

/// @nodoc
class _$ConnectionInfoModelTearOff {
  const _$ConnectionInfoModelTearOff();

  _ConnectionInfoModel call({required String ipAddress, required String port}) {
    return _ConnectionInfoModel(
      ipAddress: ipAddress,
      port: port,
    );
  }

  ConnectionInfoModel fromJson(Map<String, Object> json) {
    return ConnectionInfoModel.fromJson(json);
  }
}

/// @nodoc
const $ConnectionInfoModel = _$ConnectionInfoModelTearOff();

/// @nodoc
mixin _$ConnectionInfoModel {
  String get ipAddress => throw _privateConstructorUsedError;
  String get port => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConnectionInfoModelCopyWith<ConnectionInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnectionInfoModelCopyWith<$Res> {
  factory $ConnectionInfoModelCopyWith(
          ConnectionInfoModel value, $Res Function(ConnectionInfoModel) then) =
      _$ConnectionInfoModelCopyWithImpl<$Res>;
  $Res call({String ipAddress, String port});
}

/// @nodoc
class _$ConnectionInfoModelCopyWithImpl<$Res>
    implements $ConnectionInfoModelCopyWith<$Res> {
  _$ConnectionInfoModelCopyWithImpl(this._value, this._then);

  final ConnectionInfoModel _value;
  // ignore: unused_field
  final $Res Function(ConnectionInfoModel) _then;

  @override
  $Res call({
    Object? ipAddress = freezed,
    Object? port = freezed,
  }) {
    return _then(_value.copyWith(
      ipAddress: ipAddress == freezed
          ? _value.ipAddress
          : ipAddress // ignore: cast_nullable_to_non_nullable
              as String,
      port: port == freezed
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ConnectionInfoModelCopyWith<$Res>
    implements $ConnectionInfoModelCopyWith<$Res> {
  factory _$ConnectionInfoModelCopyWith(_ConnectionInfoModel value,
          $Res Function(_ConnectionInfoModel) then) =
      __$ConnectionInfoModelCopyWithImpl<$Res>;
  @override
  $Res call({String ipAddress, String port});
}

/// @nodoc
class __$ConnectionInfoModelCopyWithImpl<$Res>
    extends _$ConnectionInfoModelCopyWithImpl<$Res>
    implements _$ConnectionInfoModelCopyWith<$Res> {
  __$ConnectionInfoModelCopyWithImpl(
      _ConnectionInfoModel _value, $Res Function(_ConnectionInfoModel) _then)
      : super(_value, (v) => _then(v as _ConnectionInfoModel));

  @override
  _ConnectionInfoModel get _value => super._value as _ConnectionInfoModel;

  @override
  $Res call({
    Object? ipAddress = freezed,
    Object? port = freezed,
  }) {
    return _then(_ConnectionInfoModel(
      ipAddress: ipAddress == freezed
          ? _value.ipAddress
          : ipAddress // ignore: cast_nullable_to_non_nullable
              as String,
      port: port == freezed
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ConnectionInfoModel implements _ConnectionInfoModel {
  const _$_ConnectionInfoModel({required this.ipAddress, required this.port});

  factory _$_ConnectionInfoModel.fromJson(Map<String, dynamic> json) =>
      _$$_ConnectionInfoModelFromJson(json);

  @override
  final String ipAddress;
  @override
  final String port;

  @override
  String toString() {
    return 'ConnectionInfoModel(ipAddress: $ipAddress, port: $port)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ConnectionInfoModel &&
            (identical(other.ipAddress, ipAddress) ||
                const DeepCollectionEquality()
                    .equals(other.ipAddress, ipAddress)) &&
            (identical(other.port, port) ||
                const DeepCollectionEquality().equals(other.port, port)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(ipAddress) ^
      const DeepCollectionEquality().hash(port);

  @JsonKey(ignore: true)
  @override
  _$ConnectionInfoModelCopyWith<_ConnectionInfoModel> get copyWith =>
      __$ConnectionInfoModelCopyWithImpl<_ConnectionInfoModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ConnectionInfoModelToJson(this);
  }
}

abstract class _ConnectionInfoModel implements ConnectionInfoModel {
  const factory _ConnectionInfoModel(
      {required String ipAddress,
      required String port}) = _$_ConnectionInfoModel;

  factory _ConnectionInfoModel.fromJson(Map<String, dynamic> json) =
      _$_ConnectionInfoModel.fromJson;

  @override
  String get ipAddress => throw _privateConstructorUsedError;
  @override
  String get port => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ConnectionInfoModelCopyWith<_ConnectionInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}
