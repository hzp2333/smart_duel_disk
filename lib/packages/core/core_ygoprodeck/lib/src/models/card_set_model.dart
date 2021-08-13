import 'package:freezed_annotation/freezed_annotation.dart';

part 'card_set_model.freezed.dart';
part 'card_set_model.g.dart';

@freezed
abstract class CardSetModel with _$CardSetModel {
  const factory CardSetModel({
    @required @JsonKey(name: 'set_name') String setName,
    @required @JsonKey(name: 'set_code') String setCode,
    @required @JsonKey(name: 'set_rarity') String setRarity,
    @required @JsonKey(name: 'set_rarity_code') String setRarityCode,
    @required @JsonKey(name: 'set_price') String setPrice,
  }) = _CardSetModel;

  factory CardSetModel.fromJson(Map<String, dynamic> json) => _$CardSetModelFromJson(json);
}
