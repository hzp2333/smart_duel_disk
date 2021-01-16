import 'package:freezed_annotation/freezed_annotation.dart';

part 'ban_list_info_model.freezed.dart';
part 'ban_list_info_model.g.dart';

@freezed
abstract class BanListInfoModel with _$BanListInfoModel {
  const factory BanListInfoModel({
    @JsonKey(name: 'ban_ocg') String banOcg,
    @JsonKey(name: 'ban_goat') String banGoat,
    @JsonKey(name: 'ban_tcg') String banTcg,
  }) = _BanListInfoModel;

  factory BanListInfoModel.fromJson(Map<String, dynamic> json) => _$BanListInfoModelFromJson(json);
}
