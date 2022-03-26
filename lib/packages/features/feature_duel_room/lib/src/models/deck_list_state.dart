import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/core/entities/entities.dart';

part 'deck_list_state.freezed.dart';

@freezed
class DeckListState with _$DeckListState {
  const factory DeckListState.data({required Iterable<Deck> decks, required Iterable<YugiohCard> skillCards}) =
      DeckListData;
  const factory DeckListState.loading() = DeckListLoading;
}
