import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../core_smart_duel_server_interface.dart';

part 'card_event_data.g.dart';

@immutable
@JsonSerializable()
class CardEventData extends Equatable implements SmartDuelEventData {
  final String cardId;
  final String zoneName;
  final String cardPosition;

  const CardEventData({
    @required this.cardId,
    @required this.zoneName,
    this.cardPosition,
  });

  @override
  List<Object> get props => [
        cardId,
        cardPosition,
        zoneName,
      ];

  @override
  bool get stringify => true;

  @override
  Map<String, dynamic> toJson() => _$CardEventDataToJson(this);

  factory CardEventData.fromJson(Map<String, dynamic> json) => _$CardEventDataFromJson(json);
}
