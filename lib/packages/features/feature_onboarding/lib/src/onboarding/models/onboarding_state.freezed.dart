// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'onboarding_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$OnboardingStateTearOff {
  const _$OnboardingStateTearOff();

  OnboardingConnecting connecting() {
    return const OnboardingConnecting();
  }

  OnboardingCachingCards cachingCards() {
    return const OnboardingCachingCards();
  }

  OnboardingCachingCardImages cachingCardImages(String progress) {
    return OnboardingCachingCardImages(
      progress,
    );
  }

  OnboardingReady ready() {
    return const OnboardingReady();
  }
}

/// @nodoc
const $OnboardingState = _$OnboardingStateTearOff();

/// @nodoc
mixin _$OnboardingState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connecting,
    required TResult Function() cachingCards,
    required TResult Function(String progress) cachingCardImages,
    required TResult Function() ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? connecting,
    TResult Function()? cachingCards,
    TResult Function(String progress)? cachingCardImages,
    TResult Function()? ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connecting,
    TResult Function()? cachingCards,
    TResult Function(String progress)? cachingCardImages,
    TResult Function()? ready,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnboardingConnecting value) connecting,
    required TResult Function(OnboardingCachingCards value) cachingCards,
    required TResult Function(OnboardingCachingCardImages value)
        cachingCardImages,
    required TResult Function(OnboardingReady value) ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(OnboardingConnecting value)? connecting,
    TResult Function(OnboardingCachingCards value)? cachingCards,
    TResult Function(OnboardingCachingCardImages value)? cachingCardImages,
    TResult Function(OnboardingReady value)? ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnboardingConnecting value)? connecting,
    TResult Function(OnboardingCachingCards value)? cachingCards,
    TResult Function(OnboardingCachingCardImages value)? cachingCardImages,
    TResult Function(OnboardingReady value)? ready,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnboardingStateCopyWith<$Res> {
  factory $OnboardingStateCopyWith(
          OnboardingState value, $Res Function(OnboardingState) then) =
      _$OnboardingStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$OnboardingStateCopyWithImpl<$Res>
    implements $OnboardingStateCopyWith<$Res> {
  _$OnboardingStateCopyWithImpl(this._value, this._then);

  final OnboardingState _value;
  // ignore: unused_field
  final $Res Function(OnboardingState) _then;
}

/// @nodoc
abstract class $OnboardingConnectingCopyWith<$Res> {
  factory $OnboardingConnectingCopyWith(OnboardingConnecting value,
          $Res Function(OnboardingConnecting) then) =
      _$OnboardingConnectingCopyWithImpl<$Res>;
}

/// @nodoc
class _$OnboardingConnectingCopyWithImpl<$Res>
    extends _$OnboardingStateCopyWithImpl<$Res>
    implements $OnboardingConnectingCopyWith<$Res> {
  _$OnboardingConnectingCopyWithImpl(
      OnboardingConnecting _value, $Res Function(OnboardingConnecting) _then)
      : super(_value, (v) => _then(v as OnboardingConnecting));

  @override
  OnboardingConnecting get _value => super._value as OnboardingConnecting;
}

/// @nodoc

class _$OnboardingConnecting implements OnboardingConnecting {
  const _$OnboardingConnecting();

  @override
  String toString() {
    return 'OnboardingState.connecting()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is OnboardingConnecting);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connecting,
    required TResult Function() cachingCards,
    required TResult Function(String progress) cachingCardImages,
    required TResult Function() ready,
  }) {
    return connecting();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? connecting,
    TResult Function()? cachingCards,
    TResult Function(String progress)? cachingCardImages,
    TResult Function()? ready,
  }) {
    return connecting?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connecting,
    TResult Function()? cachingCards,
    TResult Function(String progress)? cachingCardImages,
    TResult Function()? ready,
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
    required TResult Function(OnboardingConnecting value) connecting,
    required TResult Function(OnboardingCachingCards value) cachingCards,
    required TResult Function(OnboardingCachingCardImages value)
        cachingCardImages,
    required TResult Function(OnboardingReady value) ready,
  }) {
    return connecting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(OnboardingConnecting value)? connecting,
    TResult Function(OnboardingCachingCards value)? cachingCards,
    TResult Function(OnboardingCachingCardImages value)? cachingCardImages,
    TResult Function(OnboardingReady value)? ready,
  }) {
    return connecting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnboardingConnecting value)? connecting,
    TResult Function(OnboardingCachingCards value)? cachingCards,
    TResult Function(OnboardingCachingCardImages value)? cachingCardImages,
    TResult Function(OnboardingReady value)? ready,
    required TResult orElse(),
  }) {
    if (connecting != null) {
      return connecting(this);
    }
    return orElse();
  }
}

abstract class OnboardingConnecting implements OnboardingState {
  const factory OnboardingConnecting() = _$OnboardingConnecting;
}

/// @nodoc
abstract class $OnboardingCachingCardsCopyWith<$Res> {
  factory $OnboardingCachingCardsCopyWith(OnboardingCachingCards value,
          $Res Function(OnboardingCachingCards) then) =
      _$OnboardingCachingCardsCopyWithImpl<$Res>;
}

/// @nodoc
class _$OnboardingCachingCardsCopyWithImpl<$Res>
    extends _$OnboardingStateCopyWithImpl<$Res>
    implements $OnboardingCachingCardsCopyWith<$Res> {
  _$OnboardingCachingCardsCopyWithImpl(OnboardingCachingCards _value,
      $Res Function(OnboardingCachingCards) _then)
      : super(_value, (v) => _then(v as OnboardingCachingCards));

  @override
  OnboardingCachingCards get _value => super._value as OnboardingCachingCards;
}

/// @nodoc

class _$OnboardingCachingCards implements OnboardingCachingCards {
  const _$OnboardingCachingCards();

  @override
  String toString() {
    return 'OnboardingState.cachingCards()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is OnboardingCachingCards);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connecting,
    required TResult Function() cachingCards,
    required TResult Function(String progress) cachingCardImages,
    required TResult Function() ready,
  }) {
    return cachingCards();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? connecting,
    TResult Function()? cachingCards,
    TResult Function(String progress)? cachingCardImages,
    TResult Function()? ready,
  }) {
    return cachingCards?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connecting,
    TResult Function()? cachingCards,
    TResult Function(String progress)? cachingCardImages,
    TResult Function()? ready,
    required TResult orElse(),
  }) {
    if (cachingCards != null) {
      return cachingCards();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnboardingConnecting value) connecting,
    required TResult Function(OnboardingCachingCards value) cachingCards,
    required TResult Function(OnboardingCachingCardImages value)
        cachingCardImages,
    required TResult Function(OnboardingReady value) ready,
  }) {
    return cachingCards(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(OnboardingConnecting value)? connecting,
    TResult Function(OnboardingCachingCards value)? cachingCards,
    TResult Function(OnboardingCachingCardImages value)? cachingCardImages,
    TResult Function(OnboardingReady value)? ready,
  }) {
    return cachingCards?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnboardingConnecting value)? connecting,
    TResult Function(OnboardingCachingCards value)? cachingCards,
    TResult Function(OnboardingCachingCardImages value)? cachingCardImages,
    TResult Function(OnboardingReady value)? ready,
    required TResult orElse(),
  }) {
    if (cachingCards != null) {
      return cachingCards(this);
    }
    return orElse();
  }
}

abstract class OnboardingCachingCards implements OnboardingState {
  const factory OnboardingCachingCards() = _$OnboardingCachingCards;
}

/// @nodoc
abstract class $OnboardingCachingCardImagesCopyWith<$Res> {
  factory $OnboardingCachingCardImagesCopyWith(
          OnboardingCachingCardImages value,
          $Res Function(OnboardingCachingCardImages) then) =
      _$OnboardingCachingCardImagesCopyWithImpl<$Res>;
  $Res call({String progress});
}

/// @nodoc
class _$OnboardingCachingCardImagesCopyWithImpl<$Res>
    extends _$OnboardingStateCopyWithImpl<$Res>
    implements $OnboardingCachingCardImagesCopyWith<$Res> {
  _$OnboardingCachingCardImagesCopyWithImpl(OnboardingCachingCardImages _value,
      $Res Function(OnboardingCachingCardImages) _then)
      : super(_value, (v) => _then(v as OnboardingCachingCardImages));

  @override
  OnboardingCachingCardImages get _value =>
      super._value as OnboardingCachingCardImages;

  @override
  $Res call({
    Object? progress = freezed,
  }) {
    return _then(OnboardingCachingCardImages(
      progress == freezed
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OnboardingCachingCardImages implements OnboardingCachingCardImages {
  const _$OnboardingCachingCardImages(this.progress);

  @override
  final String progress;

  @override
  String toString() {
    return 'OnboardingState.cachingCardImages(progress: $progress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is OnboardingCachingCardImages &&
            (identical(other.progress, progress) ||
                const DeepCollectionEquality()
                    .equals(other.progress, progress)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(progress);

  @JsonKey(ignore: true)
  @override
  $OnboardingCachingCardImagesCopyWith<OnboardingCachingCardImages>
      get copyWith => _$OnboardingCachingCardImagesCopyWithImpl<
          OnboardingCachingCardImages>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connecting,
    required TResult Function() cachingCards,
    required TResult Function(String progress) cachingCardImages,
    required TResult Function() ready,
  }) {
    return cachingCardImages(progress);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? connecting,
    TResult Function()? cachingCards,
    TResult Function(String progress)? cachingCardImages,
    TResult Function()? ready,
  }) {
    return cachingCardImages?.call(progress);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connecting,
    TResult Function()? cachingCards,
    TResult Function(String progress)? cachingCardImages,
    TResult Function()? ready,
    required TResult orElse(),
  }) {
    if (cachingCardImages != null) {
      return cachingCardImages(progress);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnboardingConnecting value) connecting,
    required TResult Function(OnboardingCachingCards value) cachingCards,
    required TResult Function(OnboardingCachingCardImages value)
        cachingCardImages,
    required TResult Function(OnboardingReady value) ready,
  }) {
    return cachingCardImages(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(OnboardingConnecting value)? connecting,
    TResult Function(OnboardingCachingCards value)? cachingCards,
    TResult Function(OnboardingCachingCardImages value)? cachingCardImages,
    TResult Function(OnboardingReady value)? ready,
  }) {
    return cachingCardImages?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnboardingConnecting value)? connecting,
    TResult Function(OnboardingCachingCards value)? cachingCards,
    TResult Function(OnboardingCachingCardImages value)? cachingCardImages,
    TResult Function(OnboardingReady value)? ready,
    required TResult orElse(),
  }) {
    if (cachingCardImages != null) {
      return cachingCardImages(this);
    }
    return orElse();
  }
}

abstract class OnboardingCachingCardImages implements OnboardingState {
  const factory OnboardingCachingCardImages(String progress) =
      _$OnboardingCachingCardImages;

  String get progress => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OnboardingCachingCardImagesCopyWith<OnboardingCachingCardImages>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnboardingReadyCopyWith<$Res> {
  factory $OnboardingReadyCopyWith(
          OnboardingReady value, $Res Function(OnboardingReady) then) =
      _$OnboardingReadyCopyWithImpl<$Res>;
}

/// @nodoc
class _$OnboardingReadyCopyWithImpl<$Res>
    extends _$OnboardingStateCopyWithImpl<$Res>
    implements $OnboardingReadyCopyWith<$Res> {
  _$OnboardingReadyCopyWithImpl(
      OnboardingReady _value, $Res Function(OnboardingReady) _then)
      : super(_value, (v) => _then(v as OnboardingReady));

  @override
  OnboardingReady get _value => super._value as OnboardingReady;
}

/// @nodoc

class _$OnboardingReady implements OnboardingReady {
  const _$OnboardingReady();

  @override
  String toString() {
    return 'OnboardingState.ready()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is OnboardingReady);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connecting,
    required TResult Function() cachingCards,
    required TResult Function(String progress) cachingCardImages,
    required TResult Function() ready,
  }) {
    return ready();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? connecting,
    TResult Function()? cachingCards,
    TResult Function(String progress)? cachingCardImages,
    TResult Function()? ready,
  }) {
    return ready?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connecting,
    TResult Function()? cachingCards,
    TResult Function(String progress)? cachingCardImages,
    TResult Function()? ready,
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
    required TResult Function(OnboardingConnecting value) connecting,
    required TResult Function(OnboardingCachingCards value) cachingCards,
    required TResult Function(OnboardingCachingCardImages value)
        cachingCardImages,
    required TResult Function(OnboardingReady value) ready,
  }) {
    return ready(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(OnboardingConnecting value)? connecting,
    TResult Function(OnboardingCachingCards value)? cachingCards,
    TResult Function(OnboardingCachingCardImages value)? cachingCardImages,
    TResult Function(OnboardingReady value)? ready,
  }) {
    return ready?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnboardingConnecting value)? connecting,
    TResult Function(OnboardingCachingCards value)? cachingCards,
    TResult Function(OnboardingCachingCardImages value)? cachingCardImages,
    TResult Function(OnboardingReady value)? ready,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }
}

abstract class OnboardingReady implements OnboardingState {
  const factory OnboardingReady() = _$OnboardingReady;
}
