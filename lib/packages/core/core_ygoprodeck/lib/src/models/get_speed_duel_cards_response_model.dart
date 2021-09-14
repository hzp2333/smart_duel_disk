import 'package:freezed_annotation/freezed_annotation.dart';

import 'speed_duel_card_model.dart';

part 'get_speed_duel_cards_response_model.freezed.dart';
part 'get_speed_duel_cards_response_model.g.dart';

@freezed
class GetSpeedDuelCardsResponseModel with _$GetSpeedDuelCardsResponseModel {
  const factory GetSpeedDuelCardsResponseModel({
    @JsonKey(name: 'data') required List<SpeedDuelCardModel> speedDuelCards,
  }) = _GetSpeedDuelCardsResponseModel;

  factory GetSpeedDuelCardsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetSpeedDuelCardsResponseModelFromJson(json);
}
