import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_duel_disk/packages/core/core_ygoprodeck/core_ygoprodeck_interface/lib/src/models/ban_list_info_model.dart';
import 'package:smart_duel_disk/packages/core/core_ygoprodeck/core_ygoprodeck_interface/lib/src/models/card_image_model.dart';
import 'package:smart_duel_disk/packages/core/core_ygoprodeck/core_ygoprodeck_interface/lib/src/models/card_price_model.dart';
import 'package:smart_duel_disk/packages/core/core_ygoprodeck/core_ygoprodeck_interface/lib/src/models/card_set_model.dart';

part 'speed_duel_card_model.freezed.dart';
part 'speed_duel_card_model.g.dart';

@freezed
abstract class SpeedDuelCardModel with _$SpeedDuelCardModel {
  const factory SpeedDuelCardModel({
    @required @JsonKey(name: 'id') int id,
    @required @JsonKey(name: 'name') String name,
    @required @JsonKey(name: 'type') String type,
    @required @JsonKey(name: 'desc') String desc,
    @required @JsonKey(name: 'race') String race,
    @required @JsonKey(name: 'card_images') List<CardImageModel> cardImages,
    @JsonKey(name: 'card_sets') List<CardSetModel> cardSets,
    @JsonKey(name: 'card_prices') List<CardPriceModel> cardPrices,
    @JsonKey(name: 'atk') int atk,
    @JsonKey(name: 'def') int def,
    @JsonKey(name: 'level') int level,
    @JsonKey(name: 'attribute') String attribute,
    @JsonKey(name: 'archetype') String archetype,
    @JsonKey(name: 'banlist_info') BanListInfoModel banListInfo,
  }) = _SpeedDuelCardModel;

  factory SpeedDuelCardModel.fromJson(Map<String, dynamic> json) => _$SpeedDuelCardModelFromJson(json);
}
