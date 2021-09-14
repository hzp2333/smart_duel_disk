// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'news_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NewsStateTearOff {
  const _$NewsStateTearOff();

  NewsData call(Iterable<NewsListItem> news) {
    return NewsData(
      news,
    );
  }

  NewsLoading loading() {
    return const NewsLoading();
  }

  NewsError error() {
    return const NewsError();
  }
}

/// @nodoc
const $NewsState = _$NewsStateTearOff();

/// @nodoc
mixin _$NewsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Iterable<NewsListItem> news) $default, {
    required TResult Function() loading,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Iterable<NewsListItem> news)? $default, {
    TResult Function()? loading,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(NewsData value) $default, {
    required TResult Function(NewsLoading value) loading,
    required TResult Function(NewsError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(NewsData value)? $default, {
    TResult Function(NewsLoading value)? loading,
    TResult Function(NewsError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsStateCopyWith<$Res> {
  factory $NewsStateCopyWith(NewsState value, $Res Function(NewsState) then) =
      _$NewsStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$NewsStateCopyWithImpl<$Res> implements $NewsStateCopyWith<$Res> {
  _$NewsStateCopyWithImpl(this._value, this._then);

  final NewsState _value;
  // ignore: unused_field
  final $Res Function(NewsState) _then;
}

/// @nodoc
abstract class $NewsDataCopyWith<$Res> {
  factory $NewsDataCopyWith(NewsData value, $Res Function(NewsData) then) =
      _$NewsDataCopyWithImpl<$Res>;
  $Res call({Iterable<NewsListItem> news});
}

/// @nodoc
class _$NewsDataCopyWithImpl<$Res> extends _$NewsStateCopyWithImpl<$Res>
    implements $NewsDataCopyWith<$Res> {
  _$NewsDataCopyWithImpl(NewsData _value, $Res Function(NewsData) _then)
      : super(_value, (v) => _then(v as NewsData));

  @override
  NewsData get _value => super._value as NewsData;

  @override
  $Res call({
    Object? news = freezed,
  }) {
    return _then(NewsData(
      news == freezed
          ? _value.news
          : news // ignore: cast_nullable_to_non_nullable
              as Iterable<NewsListItem>,
    ));
  }
}

/// @nodoc

class _$NewsData implements NewsData {
  const _$NewsData(this.news);

  @override
  final Iterable<NewsListItem> news;

  @override
  String toString() {
    return 'NewsState(news: $news)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is NewsData &&
            (identical(other.news, news) ||
                const DeepCollectionEquality().equals(other.news, news)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(news);

  @JsonKey(ignore: true)
  @override
  $NewsDataCopyWith<NewsData> get copyWith =>
      _$NewsDataCopyWithImpl<NewsData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Iterable<NewsListItem> news) $default, {
    required TResult Function() loading,
    required TResult Function() error,
  }) {
    return $default(news);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Iterable<NewsListItem> news)? $default, {
    TResult Function()? loading,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(news);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(NewsData value) $default, {
    required TResult Function(NewsLoading value) loading,
    required TResult Function(NewsError value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(NewsData value)? $default, {
    TResult Function(NewsLoading value)? loading,
    TResult Function(NewsError value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class NewsData implements NewsState {
  const factory NewsData(Iterable<NewsListItem> news) = _$NewsData;

  Iterable<NewsListItem> get news => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewsDataCopyWith<NewsData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsLoadingCopyWith<$Res> {
  factory $NewsLoadingCopyWith(
          NewsLoading value, $Res Function(NewsLoading) then) =
      _$NewsLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$NewsLoadingCopyWithImpl<$Res> extends _$NewsStateCopyWithImpl<$Res>
    implements $NewsLoadingCopyWith<$Res> {
  _$NewsLoadingCopyWithImpl(
      NewsLoading _value, $Res Function(NewsLoading) _then)
      : super(_value, (v) => _then(v as NewsLoading));

  @override
  NewsLoading get _value => super._value as NewsLoading;
}

/// @nodoc

class _$NewsLoading implements NewsLoading {
  const _$NewsLoading();

  @override
  String toString() {
    return 'NewsState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is NewsLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Iterable<NewsListItem> news) $default, {
    required TResult Function() loading,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Iterable<NewsListItem> news)? $default, {
    TResult Function()? loading,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(NewsData value) $default, {
    required TResult Function(NewsLoading value) loading,
    required TResult Function(NewsError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(NewsData value)? $default, {
    TResult Function(NewsLoading value)? loading,
    TResult Function(NewsError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class NewsLoading implements NewsState {
  const factory NewsLoading() = _$NewsLoading;
}

/// @nodoc
abstract class $NewsErrorCopyWith<$Res> {
  factory $NewsErrorCopyWith(NewsError value, $Res Function(NewsError) then) =
      _$NewsErrorCopyWithImpl<$Res>;
}

/// @nodoc
class _$NewsErrorCopyWithImpl<$Res> extends _$NewsStateCopyWithImpl<$Res>
    implements $NewsErrorCopyWith<$Res> {
  _$NewsErrorCopyWithImpl(NewsError _value, $Res Function(NewsError) _then)
      : super(_value, (v) => _then(v as NewsError));

  @override
  NewsError get _value => super._value as NewsError;
}

/// @nodoc

class _$NewsError implements NewsError {
  const _$NewsError();

  @override
  String toString() {
    return 'NewsState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is NewsError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Iterable<NewsListItem> news) $default, {
    required TResult Function() loading,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Iterable<NewsListItem> news)? $default, {
    TResult Function()? loading,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(NewsData value) $default, {
    required TResult Function(NewsLoading value) loading,
    required TResult Function(NewsError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(NewsData value)? $default, {
    TResult Function(NewsLoading value)? loading,
    TResult Function(NewsError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class NewsError implements NewsState {
  const factory NewsError() = _$NewsError;
}
