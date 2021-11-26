import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'smart_duel_event_data.dart';

part 'duelist_event_data.g.dart';

@immutable
@JsonSerializable()
class DuelistEventData extends Equatable implements SmartDuelEventData {
  final String duelistId;
  final String? result;

  const DuelistEventData({
    required this.duelistId,
    this.result,
  });

  @override
  List<Object?> get props => [
        duelistId,
        result,
      ];

  @override
  bool get stringify => true;

  @override
  Map<String, dynamic> toJson() => _$DuelistEventDataToJson(this);

  factory DuelistEventData.fromJson(Map<String, dynamic> json) => _$DuelistEventDataFromJson(json);
}
