import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/core_data_manager_interface/lib/core_data_manager_interface.dart';

part 'deck_builder_state.freezed.dart';

@freezed
abstract class DeckBuilderState with _$DeckBuilderState {
  const factory DeckBuilderState(Iterable<YugiohCard> speedDuelCards) = Data;
  const factory DeckBuilderState.loading() = Loading;
  const factory DeckBuilderState.noData() = NoData;
  const factory DeckBuilderState.error() = Error;
}
