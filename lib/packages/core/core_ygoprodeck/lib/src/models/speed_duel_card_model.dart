import 'package:freezed_annotation/freezed_annotation.dart';

import 'ban_list_info_model.dart';
import 'card_image_model.dart';
import 'card_price_model.dart';
import 'card_set_model.dart';

part 'speed_duel_card_model.freezed.dart';
part 'speed_duel_card_model.g.dart';

@freezed
class SpeedDuelCardModel with _$SpeedDuelCardModel {
  const factory SpeedDuelCardModel({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'type') required String type,
    @JsonKey(name: 'desc') required String desc,
    @JsonKey(name: 'race') required String race,
    @JsonKey(name: 'card_images') required List<CardImageModel> cardImages,
    @JsonKey(name: 'card_sets') List<CardSetModel>? cardSets,
    @JsonKey(name: 'card_prices') List<CardPriceModel>? cardPrices,
    @JsonKey(name: 'atk') int? atk,
    @JsonKey(name: 'def') int? def,
    @JsonKey(name: 'level') int? level,
    @JsonKey(name: 'attribute') String? attribute,
    @JsonKey(name: 'archetype') String? archetype,
    @JsonKey(name: 'banlist_info') BanListInfoModel? banListInfo,
  }) = _SpeedDuelCardModel;

  factory SpeedDuelCardModel.fromJson(Map<String, dynamic> json) => _$SpeedDuelCardModelFromJson(json);
}
