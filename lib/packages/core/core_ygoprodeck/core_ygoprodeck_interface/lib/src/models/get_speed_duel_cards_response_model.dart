import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_duel_disk/packages/core/core_ygoprodeck/core_ygoprodeck_interface/lib/src/models/speed_duel_card_model.dart';

part 'get_speed_duel_cards_response_model.freezed.dart';
part 'get_speed_duel_cards_response_model.g.dart';

@freezed
abstract class GetSpeedDuelCardsResponseModel with _$GetSpeedDuelCardsResponseModel {
  const factory GetSpeedDuelCardsResponseModel({
    @required @JsonKey(name: 'data') List<SpeedDuelCardModel> speedDuelCards,
  }) = _GetSpeedDuelCardsResponseModel;

  factory GetSpeedDuelCardsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetSpeedDuelCardsResponseModelFromJson(json);
}
