import 'package:freezed_annotation/freezed_annotation.dart';

part 'card_image_model.freezed.dart';
part 'card_image_model.g.dart';

@freezed
abstract class CardImageModel with _$CardImageModel {
  const factory CardImageModel({
    @required @JsonKey(name: 'cardmarket_price') int id,
    @required @JsonKey(name: 'image_url') String imageUrl,
    @required @JsonKey(name: 'image_url_small') String imageUrlSmall,
  }) = _CardImageModel;

  factory CardImageModel.fromJson(Map<String, dynamic> json) => _$CardImageModelFromJson(json);
}
