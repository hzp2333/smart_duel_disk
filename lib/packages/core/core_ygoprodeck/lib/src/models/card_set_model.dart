import 'package:freezed_annotation/freezed_annotation.dart';

part 'card_set_model.freezed.dart';
part 'card_set_model.g.dart';

@freezed
class CardSetModel with _$CardSetModel {
  const factory CardSetModel({
    @JsonKey(name: 'set_name') required String setName,
    @JsonKey(name: 'set_code') required String setCode,
    @JsonKey(name: 'set_rarity') required String setRarity,
    @JsonKey(name: 'set_rarity_code') required String setRarityCode,
    @JsonKey(name: 'set_price') required String setPrice,
  }) = _CardSetModel;

  factory CardSetModel.fromJson(Map<String, dynamic> json) => _$CardSetModelFromJson(json);
}
