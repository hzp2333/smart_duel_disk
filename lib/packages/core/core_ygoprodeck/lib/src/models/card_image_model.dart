import 'package:freezed_annotation/freezed_annotation.dart';

part 'card_image_model.freezed.dart';
part 'card_image_model.g.dart';

@freezed
class CardImageModel with _$CardImageModel {
  const factory CardImageModel({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'image_url') required String imageUrl,
    @JsonKey(name: 'image_url_small') required String imageUrlSmall,
  }) = _CardImageModel;

  factory CardImageModel.fromJson(Map<String, dynamic> json) => _$CardImageModelFromJson(json);
}
