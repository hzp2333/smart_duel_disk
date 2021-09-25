// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'duel_room_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DuelRoomStateTearOff {
  const _$DuelRoomStateTearOff();

  DuelRoomConnecting connecting() {
    return const DuelRoomConnecting();
  }

  DuelRoomConnected connected() {
    return const DuelRoomConnected();
  }

  DuelRoomCreate createRoom(String roomName) {
    return DuelRoomCreate(
      roomName,
    );
  }

  DuelRoomJoin joinRoom(String roomName) {
    return DuelRoomJoin(
      roomName,
    );
  }

  DuelRoomReady ready() {
    return const DuelRoomReady();
  }

  DuelRoomError error(String errorMessage, void Function() retryAction) {
    return DuelRoomError(
      errorMessage,
      retryAction,
    );
  }
}

/// @nodoc
const $DuelRoomState = _$DuelRoomStateTearOff();

/// @nodoc
mixin _$DuelRoomState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connecting,
    required TResult Function() connected,
    required TResult Function(String roomName) createRoom,
    required TResult Function(String roomName) joinRoom,
    required TResult Function() ready,
    required TResult Function(String errorMessage, void Function() retryAction)
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? connecting,
    TResult Function()? connected,
    TResult Function(String roomName)? createRoom,
    TResult Function(String roomName)? joinRoom,
    TResult Function()? ready,
    TResult Function(String errorMessage, void Function() retryAction)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connecting,
    TResult Function()? connected,
    TResult Function(String roomName)? createRoom,
    TResult Function(String roomName)? joinRoom,
    TResult Function()? ready,
    TResult Function(String errorMessage, void Function() retryAction)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DuelRoomConnecting value) connecting,
    required TResult Function(DuelRoomConnected value) connected,
    required TResult Function(DuelRoomCreate value) createRoom,
    required TResult Function(DuelRoomJoin value) joinRoom,
    required TResult Function(DuelRoomReady value) ready,
    required TResult Function(DuelRoomError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DuelRoomConnecting value)? connecting,
    TResult Function(DuelRoomConnected value)? connected,
    TResult Function(DuelRoomCreate value)? createRoom,
    TResult Function(DuelRoomJoin value)? joinRoom,
    TResult Function(DuelRoomReady value)? ready,
    TResult Function(DuelRoomError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DuelRoomConnecting value)? connecting,
    TResult Function(DuelRoomConnected value)? connected,
    TResult Function(DuelRoomCreate value)? createRoom,
    TResult Function(DuelRoomJoin value)? joinRoom,
    TResult Function(DuelRoomReady value)? ready,
    TResult Function(DuelRoomError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DuelRoomStateCopyWith<$Res> {
  factory $DuelRoomStateCopyWith(
          DuelRoomState value, $Res Function(DuelRoomState) then) =
      _$DuelRoomStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$DuelRoomStateCopyWithImpl<$Res>
    implements $DuelRoomStateCopyWith<$Res> {
  _$DuelRoomStateCopyWithImpl(this._value, this._then);

  final DuelRoomState _value;
  // ignore: unused_field
  final $Res Function(DuelRoomState) _then;
}

/// @nodoc
abstract class $DuelRoomConnectingCopyWith<$Res> {
  factory $DuelRoomConnectingCopyWith(
          DuelRoomConnecting value, $Res Function(DuelRoomConnecting) then) =
      _$DuelRoomConnectingCopyWithImpl<$Res>;
}

/// @nodoc
class _$DuelRoomConnectingCopyWithImpl<$Res>
    extends _$DuelRoomStateCopyWithImpl<$Res>
    implements $DuelRoomConnectingCopyWith<$Res> {
  _$DuelRoomConnectingCopyWithImpl(
      DuelRoomConnecting _value, $Res Function(DuelRoomConnecting) _then)
      : super(_value, (v) => _then(v as DuelRoomConnecting));

  @override
  DuelRoomConnecting get _value => super._value as DuelRoomConnecting;
}

/// @nodoc

class _$DuelRoomConnecting
    with DiagnosticableTreeMixin
    implements DuelRoomConnecting {
  const _$DuelRoomConnecting();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DuelRoomState.connecting()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'DuelRoomState.connecting'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is DuelRoomConnecting);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connecting,
    required TResult Function() connected,
    required TResult Function(String roomName) createRoom,
    required TResult Function(String roomName) joinRoom,
    required TResult Function() ready,
    required TResult Function(String errorMessage, void Function() retryAction)
        error,
  }) {
    return connecting();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? connecting,
    TResult Function()? connected,
    TResult Function(String roomName)? createRoom,
    TResult Function(String roomName)? joinRoom,
    TResult Function()? ready,
    TResult Function(String errorMessage, void Function() retryAction)? error,
  }) {
    return connecting?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connecting,
    TResult Function()? connected,
    TResult Function(String roomName)? createRoom,
    TResult Function(String roomName)? joinRoom,
    TResult Function()? ready,
    TResult Function(String errorMessage, void Function() retryAction)? error,
    required TResult orElse(),
  }) {
    if (connecting != null) {
      return connecting();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DuelRoomConnecting value) connecting,
    required TResult Function(DuelRoomConnected value) connected,
    required TResult Function(DuelRoomCreate value) createRoom,
    required TResult Function(DuelRoomJoin value) joinRoom,
    required TResult Function(DuelRoomReady value) ready,
    required TResult Function(DuelRoomError value) error,
  }) {
    return connecting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DuelRoomConnecting value)? connecting,
    TResult Function(DuelRoomConnected value)? connected,
    TResult Function(DuelRoomCreate value)? createRoom,
    TResult Function(DuelRoomJoin value)? joinRoom,
    TResult Function(DuelRoomReady value)? ready,
    TResult Function(DuelRoomError value)? error,
  }) {
    return connecting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DuelRoomConnecting value)? connecting,
    TResult Function(DuelRoomConnected value)? connected,
    TResult Function(DuelRoomCreate value)? createRoom,
    TResult Function(DuelRoomJoin value)? joinRoom,
    TResult Function(DuelRoomReady value)? ready,
    TResult Function(DuelRoomError value)? error,
    required TResult orElse(),
  }) {
    if (connecting != null) {
      return connecting(this);
    }
    return orElse();
  }
}

abstract class DuelRoomConnecting implements DuelRoomState {
  const factory DuelRoomConnecting() = _$DuelRoomConnecting;
}

/// @nodoc
abstract class $DuelRoomConnectedCopyWith<$Res> {
  factory $DuelRoomConnectedCopyWith(
          DuelRoomConnected value, $Res Function(DuelRoomConnected) then) =
      _$DuelRoomConnectedCopyWithImpl<$Res>;
}

/// @nodoc
class _$DuelRoomConnectedCopyWithImpl<$Res>
    extends _$DuelRoomStateCopyWithImpl<$Res>
    implements $DuelRoomConnectedCopyWith<$Res> {
  _$DuelRoomConnectedCopyWithImpl(
      DuelRoomConnected _value, $Res Function(DuelRoomConnected) _then)
      : super(_value, (v) => _then(v as DuelRoomConnected));

  @override
  DuelRoomConnected get _value => super._value as DuelRoomConnected;
}

/// @nodoc

class _$DuelRoomConnected
    with DiagnosticableTreeMixin
    implements DuelRoomConnected {
  const _$DuelRoomConnected();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DuelRoomState.connected()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'DuelRoomState.connected'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is DuelRoomConnected);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connecting,
    required TResult Function() connected,
    required TResult Function(String roomName) createRoom,
    required TResult Function(String roomName) joinRoom,
    required TResult Function() ready,
    required TResult Function(String errorMessage, void Function() retryAction)
        error,
  }) {
    return connected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? connecting,
    TResult Function()? connected,
    TResult Function(String roomName)? createRoom,
    TResult Function(String roomName)? joinRoom,
    TResult Function()? ready,
    TResult Function(String errorMessage, void Function() retryAction)? error,
  }) {
    return connected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connecting,
    TResult Function()? connected,
    TResult Function(String roomName)? createRoom,
    TResult Function(String roomName)? joinRoom,
    TResult Function()? ready,
    TResult Function(String errorMessage, void Function() retryAction)? error,
    required TResult orElse(),
  }) {
    if (connected != null) {
      return connected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DuelRoomConnecting value) connecting,
    required TResult Function(DuelRoomConnected value) connected,
    required TResult Function(DuelRoomCreate value) createRoom,
    required TResult Function(DuelRoomJoin value) joinRoom,
    required TResult Function(DuelRoomReady value) ready,
    required TResult Function(DuelRoomError value) error,
  }) {
    return connected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DuelRoomConnecting value)? connecting,
    TResult Function(DuelRoomConnected value)? connected,
    TResult Function(DuelRoomCreate value)? createRoom,
    TResult Function(DuelRoomJoin value)? joinRoom,
    TResult Function(DuelRoomReady value)? ready,
    TResult Function(DuelRoomError value)? error,
  }) {
    return connected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DuelRoomConnecting value)? connecting,
    TResult Function(DuelRoomConnected value)? connected,
    TResult Function(DuelRoomCreate value)? createRoom,
    TResult Function(DuelRoomJoin value)? joinRoom,
    TResult Function(DuelRoomReady value)? ready,
    TResult Function(DuelRoomError value)? error,
    required TResult orElse(),
  }) {
    if (connected != null) {
      return connected(this);
    }
    return orElse();
  }
}

abstract class DuelRoomConnected implements DuelRoomState {
  const factory DuelRoomConnected() = _$DuelRoomConnected;
}

/// @nodoc
abstract class $DuelRoomCreateCopyWith<$Res> {
  factory $DuelRoomCreateCopyWith(
          DuelRoomCreate value, $Res Function(DuelRoomCreate) then) =
      _$DuelRoomCreateCopyWithImpl<$Res>;
  $Res call({String roomName});
}

/// @nodoc
class _$DuelRoomCreateCopyWithImpl<$Res>
    extends _$DuelRoomStateCopyWithImpl<$Res>
    implements $DuelRoomCreateCopyWith<$Res> {
  _$DuelRoomCreateCopyWithImpl(
      DuelRoomCreate _value, $Res Function(DuelRoomCreate) _then)
      : super(_value, (v) => _then(v as DuelRoomCreate));

  @override
  DuelRoomCreate get _value => super._value as DuelRoomCreate;

  @override
  $Res call({
    Object? roomName = freezed,
  }) {
    return _then(DuelRoomCreate(
      roomName == freezed
          ? _value.roomName
          : roomName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DuelRoomCreate with DiagnosticableTreeMixin implements DuelRoomCreate {
  const _$DuelRoomCreate(this.roomName);

  @override
  final String roomName;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DuelRoomState.createRoom(roomName: $roomName)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DuelRoomState.createRoom'))
      ..add(DiagnosticsProperty('roomName', roomName));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DuelRoomCreate &&
            (identical(other.roomName, roomName) ||
                const DeepCollectionEquality()
                    .equals(other.roomName, roomName)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(roomName);

  @JsonKey(ignore: true)
  @override
  $DuelRoomCreateCopyWith<DuelRoomCreate> get copyWith =>
      _$DuelRoomCreateCopyWithImpl<DuelRoomCreate>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connecting,
    required TResult Function() connected,
    required TResult Function(String roomName) createRoom,
    required TResult Function(String roomName) joinRoom,
    required TResult Function() ready,
    required TResult Function(String errorMessage, void Function() retryAction)
        error,
  }) {
    return createRoom(roomName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? connecting,
    TResult Function()? connected,
    TResult Function(String roomName)? createRoom,
    TResult Function(String roomName)? joinRoom,
    TResult Function()? ready,
    TResult Function(String errorMessage, void Function() retryAction)? error,
  }) {
    return createRoom?.call(roomName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connecting,
    TResult Function()? connected,
    TResult Function(String roomName)? createRoom,
    TResult Function(String roomName)? joinRoom,
    TResult Function()? ready,
    TResult Function(String errorMessage, void Function() retryAction)? error,
    required TResult orElse(),
  }) {
    if (createRoom != null) {
      return createRoom(roomName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DuelRoomConnecting value) connecting,
    required TResult Function(DuelRoomConnected value) connected,
    required TResult Function(DuelRoomCreate value) createRoom,
    required TResult Function(DuelRoomJoin value) joinRoom,
    required TResult Function(DuelRoomReady value) ready,
    required TResult Function(DuelRoomError value) error,
  }) {
    return createRoom(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DuelRoomConnecting value)? connecting,
    TResult Function(DuelRoomConnected value)? connected,
    TResult Function(DuelRoomCreate value)? createRoom,
    TResult Function(DuelRoomJoin value)? joinRoom,
    TResult Function(DuelRoomReady value)? ready,
    TResult Function(DuelRoomError value)? error,
  }) {
    return createRoom?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DuelRoomConnecting value)? connecting,
    TResult Function(DuelRoomConnected value)? connected,
    TResult Function(DuelRoomCreate value)? createRoom,
    TResult Function(DuelRoomJoin value)? joinRoom,
    TResult Function(DuelRoomReady value)? ready,
    TResult Function(DuelRoomError value)? error,
    required TResult orElse(),
  }) {
    if (createRoom != null) {
      return createRoom(this);
    }
    return orElse();
  }
}

abstract class DuelRoomCreate implements DuelRoomState {
  const factory DuelRoomCreate(String roomName) = _$DuelRoomCreate;

  String get roomName => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DuelRoomCreateCopyWith<DuelRoomCreate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DuelRoomJoinCopyWith<$Res> {
  factory $DuelRoomJoinCopyWith(
          DuelRoomJoin value, $Res Function(DuelRoomJoin) then) =
      _$DuelRoomJoinCopyWithImpl<$Res>;
  $Res call({String roomName});
}

/// @nodoc
class _$DuelRoomJoinCopyWithImpl<$Res> extends _$DuelRoomStateCopyWithImpl<$Res>
    implements $DuelRoomJoinCopyWith<$Res> {
  _$DuelRoomJoinCopyWithImpl(
      DuelRoomJoin _value, $Res Function(DuelRoomJoin) _then)
      : super(_value, (v) => _then(v as DuelRoomJoin));

  @override
  DuelRoomJoin get _value => super._value as DuelRoomJoin;

  @override
  $Res call({
    Object? roomName = freezed,
  }) {
    return _then(DuelRoomJoin(
      roomName == freezed
          ? _value.roomName
          : roomName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DuelRoomJoin with DiagnosticableTreeMixin implements DuelRoomJoin {
  const _$DuelRoomJoin(this.roomName);

  @override
  final String roomName;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DuelRoomState.joinRoom(roomName: $roomName)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DuelRoomState.joinRoom'))
      ..add(DiagnosticsProperty('roomName', roomName));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DuelRoomJoin &&
            (identical(other.roomName, roomName) ||
                const DeepCollectionEquality()
                    .equals(other.roomName, roomName)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(roomName);

  @JsonKey(ignore: true)
  @override
  $DuelRoomJoinCopyWith<DuelRoomJoin> get copyWith =>
      _$DuelRoomJoinCopyWithImpl<DuelRoomJoin>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connecting,
    required TResult Function() connected,
    required TResult Function(String roomName) createRoom,
    required TResult Function(String roomName) joinRoom,
    required TResult Function() ready,
    required TResult Function(String errorMessage, void Function() retryAction)
        error,
  }) {
    return joinRoom(roomName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? connecting,
    TResult Function()? connected,
    TResult Function(String roomName)? createRoom,
    TResult Function(String roomName)? joinRoom,
    TResult Function()? ready,
    TResult Function(String errorMessage, void Function() retryAction)? error,
  }) {
    return joinRoom?.call(roomName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connecting,
    TResult Function()? connected,
    TResult Function(String roomName)? createRoom,
    TResult Function(String roomName)? joinRoom,
    TResult Function()? ready,
    TResult Function(String errorMessage, void Function() retryAction)? error,
    required TResult orElse(),
  }) {
    if (joinRoom != null) {
      return joinRoom(roomName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DuelRoomConnecting value) connecting,
    required TResult Function(DuelRoomConnected value) connected,
    required TResult Function(DuelRoomCreate value) createRoom,
    required TResult Function(DuelRoomJoin value) joinRoom,
    required TResult Function(DuelRoomReady value) ready,
    required TResult Function(DuelRoomError value) error,
  }) {
    return joinRoom(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DuelRoomConnecting value)? connecting,
    TResult Function(DuelRoomConnected value)? connected,
    TResult Function(DuelRoomCreate value)? createRoom,
    TResult Function(DuelRoomJoin value)? joinRoom,
    TResult Function(DuelRoomReady value)? ready,
    TResult Function(DuelRoomError value)? error,
  }) {
    return joinRoom?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DuelRoomConnecting value)? connecting,
    TResult Function(DuelRoomConnected value)? connected,
    TResult Function(DuelRoomCreate value)? createRoom,
    TResult Function(DuelRoomJoin value)? joinRoom,
    TResult Function(DuelRoomReady value)? ready,
    TResult Function(DuelRoomError value)? error,
    required TResult orElse(),
  }) {
    if (joinRoom != null) {
      return joinRoom(this);
    }
    return orElse();
  }
}

abstract class DuelRoomJoin implements DuelRoomState {
  const factory DuelRoomJoin(String roomName) = _$DuelRoomJoin;

  String get roomName => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DuelRoomJoinCopyWith<DuelRoomJoin> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DuelRoomReadyCopyWith<$Res> {
  factory $DuelRoomReadyCopyWith(
          DuelRoomReady value, $Res Function(DuelRoomReady) then) =
      _$DuelRoomReadyCopyWithImpl<$Res>;
}

/// @nodoc
class _$DuelRoomReadyCopyWithImpl<$Res>
    extends _$DuelRoomStateCopyWithImpl<$Res>
    implements $DuelRoomReadyCopyWith<$Res> {
  _$DuelRoomReadyCopyWithImpl(
      DuelRoomReady _value, $Res Function(DuelRoomReady) _then)
      : super(_value, (v) => _then(v as DuelRoomReady));

  @override
  DuelRoomReady get _value => super._value as DuelRoomReady;
}

/// @nodoc

class _$DuelRoomReady with DiagnosticableTreeMixin implements DuelRoomReady {
  const _$DuelRoomReady();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DuelRoomState.ready()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'DuelRoomState.ready'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is DuelRoomReady);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connecting,
    required TResult Function() connected,
    required TResult Function(String roomName) createRoom,
    required TResult Function(String roomName) joinRoom,
    required TResult Function() ready,
    required TResult Function(String errorMessage, void Function() retryAction)
        error,
  }) {
    return ready();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? connecting,
    TResult Function()? connected,
    TResult Function(String roomName)? createRoom,
    TResult Function(String roomName)? joinRoom,
    TResult Function()? ready,
    TResult Function(String errorMessage, void Function() retryAction)? error,
  }) {
    return ready?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connecting,
    TResult Function()? connected,
    TResult Function(String roomName)? createRoom,
    TResult Function(String roomName)? joinRoom,
    TResult Function()? ready,
    TResult Function(String errorMessage, void Function() retryAction)? error,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DuelRoomConnecting value) connecting,
    required TResult Function(DuelRoomConnected value) connected,
    required TResult Function(DuelRoomCreate value) createRoom,
    required TResult Function(DuelRoomJoin value) joinRoom,
    required TResult Function(DuelRoomReady value) ready,
    required TResult Function(DuelRoomError value) error,
  }) {
    return ready(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DuelRoomConnecting value)? connecting,
    TResult Function(DuelRoomConnected value)? connected,
    TResult Function(DuelRoomCreate value)? createRoom,
    TResult Function(DuelRoomJoin value)? joinRoom,
    TResult Function(DuelRoomReady value)? ready,
    TResult Function(DuelRoomError value)? error,
  }) {
    return ready?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DuelRoomConnecting value)? connecting,
    TResult Function(DuelRoomConnected value)? connected,
    TResult Function(DuelRoomCreate value)? createRoom,
    TResult Function(DuelRoomJoin value)? joinRoom,
    TResult Function(DuelRoomReady value)? ready,
    TResult Function(DuelRoomError value)? error,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }
}

abstract class DuelRoomReady implements DuelRoomState {
  const factory DuelRoomReady() = _$DuelRoomReady;
}

/// @nodoc
abstract class $DuelRoomErrorCopyWith<$Res> {
  factory $DuelRoomErrorCopyWith(
          DuelRoomError value, $Res Function(DuelRoomError) then) =
      _$DuelRoomErrorCopyWithImpl<$Res>;
  $Res call({String errorMessage, void Function() retryAction});
}

/// @nodoc
class _$DuelRoomErrorCopyWithImpl<$Res>
    extends _$DuelRoomStateCopyWithImpl<$Res>
    implements $DuelRoomErrorCopyWith<$Res> {
  _$DuelRoomErrorCopyWithImpl(
      DuelRoomError _value, $Res Function(DuelRoomError) _then)
      : super(_value, (v) => _then(v as DuelRoomError));

  @override
  DuelRoomError get _value => super._value as DuelRoomError;

  @override
  $Res call({
    Object? errorMessage = freezed,
    Object? retryAction = freezed,
  }) {
    return _then(DuelRoomError(
      errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      retryAction == freezed
          ? _value.retryAction
          : retryAction // ignore: cast_nullable_to_non_nullable
              as void Function(),
    ));
  }
}

/// @nodoc

class _$DuelRoomError with DiagnosticableTreeMixin implements DuelRoomError {
  const _$DuelRoomError(this.errorMessage, this.retryAction);

  @override
  final String errorMessage;
  @override
  final void Function() retryAction;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DuelRoomState.error(errorMessage: $errorMessage, retryAction: $retryAction)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DuelRoomState.error'))
      ..add(DiagnosticsProperty('errorMessage', errorMessage))
      ..add(DiagnosticsProperty('retryAction', retryAction));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DuelRoomError &&
            (identical(other.errorMessage, errorMessage) ||
                const DeepCollectionEquality()
                    .equals(other.errorMessage, errorMessage)) &&
            (identical(other.retryAction, retryAction) ||
                const DeepCollectionEquality()
                    .equals(other.retryAction, retryAction)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(errorMessage) ^
      const DeepCollectionEquality().hash(retryAction);

  @JsonKey(ignore: true)
  @override
  $DuelRoomErrorCopyWith<DuelRoomError> get copyWith =>
      _$DuelRoomErrorCopyWithImpl<DuelRoomError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connecting,
    required TResult Function() connected,
    required TResult Function(String roomName) createRoom,
    required TResult Function(String roomName) joinRoom,
    required TResult Function() ready,
    required TResult Function(String errorMessage, void Function() retryAction)
        error,
  }) {
    return error(errorMessage, retryAction);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? connecting,
    TResult Function()? connected,
    TResult Function(String roomName)? createRoom,
    TResult Function(String roomName)? joinRoom,
    TResult Function()? ready,
    TResult Function(String errorMessage, void Function() retryAction)? error,
  }) {
    return error?.call(errorMessage, retryAction);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connecting,
    TResult Function()? connected,
    TResult Function(String roomName)? createRoom,
    TResult Function(String roomName)? joinRoom,
    TResult Function()? ready,
    TResult Function(String errorMessage, void Function() retryAction)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(errorMessage, retryAction);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DuelRoomConnecting value) connecting,
    required TResult Function(DuelRoomConnected value) connected,
    required TResult Function(DuelRoomCreate value) createRoom,
    required TResult Function(DuelRoomJoin value) joinRoom,
    required TResult Function(DuelRoomReady value) ready,
    required TResult Function(DuelRoomError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DuelRoomConnecting value)? connecting,
    TResult Function(DuelRoomConnected value)? connected,
    TResult Function(DuelRoomCreate value)? createRoom,
    TResult Function(DuelRoomJoin value)? joinRoom,
    TResult Function(DuelRoomReady value)? ready,
    TResult Function(DuelRoomError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DuelRoomConnecting value)? connecting,
    TResult Function(DuelRoomConnected value)? connected,
    TResult Function(DuelRoomCreate value)? createRoom,
    TResult Function(DuelRoomJoin value)? joinRoom,
    TResult Function(DuelRoomReady value)? ready,
    TResult Function(DuelRoomError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class DuelRoomError implements DuelRoomState {
  const factory DuelRoomError(
      String errorMessage, void Function() retryAction) = _$DuelRoomError;

  String get errorMessage => throw _privateConstructorUsedError;
  void Function() get retryAction => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DuelRoomErrorCopyWith<DuelRoomError> get copyWith =>
      throw _privateConstructorUsedError;
}
