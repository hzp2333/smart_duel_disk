import 'package:freezed_annotation/freezed_annotation.dart';

part 'connection_info_model.freezed.dart';
part 'connection_info_model.g.dart';

@freezed
class ConnectionInfoModel with _$ConnectionInfoModel {
  const factory ConnectionInfoModel({
    required String ipAddress,
    required String port,
  }) = _ConnectionInfoModel;

  factory ConnectionInfoModel.fromJson(Map<String, dynamic> json) => _$ConnectionInfoModelFromJson(json);
}
