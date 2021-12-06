import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:smart_duel_disk/packages/core/core_smart_duel_server/lib/core_smart_duel_server.dart';

part 'card_event_data.g.dart';

@immutable
@JsonSerializable()
class CardEventData extends Equatable implements SmartDuelEventData {
  final String duelistId;
  final int cardId;
  final int copyNumber;
  final String? zoneName;
  final String? cardPosition;

  const CardEventData({
    required this.duelistId,
    required this.cardId,
    required this.copyNumber,
    this.zoneName,
    this.cardPosition,
  });

  @override
  List<Object?> get props => [
        duelistId,
        cardId,
        copyNumber,
        cardPosition,
        zoneName,
      ];

  @override
  bool get stringify => true;

  @override
  Map<String, dynamic> toJson() => _$CardEventDataToJson(this);

  factory CardEventData.fromJson(Map<String, dynamic> json) => _$CardEventDataFromJson(json);
}
