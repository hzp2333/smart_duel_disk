import 'package:freezed_annotation/freezed_annotation.dart';

import 'news_list_item.dart';

part 'news_state.freezed.dart';

@freezed
abstract class NewsState with _$NewsState {
  const factory NewsState(Iterable<NewsListItem> news) = Data;
  const factory NewsState.loading() = Loading;
  const factory NewsState.error() = Error;
}
