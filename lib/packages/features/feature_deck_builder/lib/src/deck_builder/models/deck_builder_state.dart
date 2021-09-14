import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';

import 'deck_builder_section.dart';

part 'deck_builder_state.freezed.dart';

@freezed
class DeckBuilderState with _$DeckBuilderState {
  const factory DeckBuilderState.filtered(Iterable<YugiohCard> cards) = DeckBuilderFiltered;
  const factory DeckBuilderState.preBuilt(Iterable<DeckBuilderSection> sections) = DeckBuilderPreBuilt;
  const factory DeckBuilderState.loading() = DeckBuilderLoading;
  const factory DeckBuilderState.noData() = DeckBuilderNoData;
  const factory DeckBuilderState.error() = DeckBuilderError;
}
