import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:smart_duel_disk/packages/core/core_smart_duel_server/lib/core_smart_duel_server.dart';

import 'duel_phase_type.dart';

part 'duelist_event_data.g.dart';

@immutable
@JsonSerializable()
class DuelistEventData extends Equatable implements SmartDuelEventData {
  final String duelistId;
  final DuelPhaseType? phase;
  final String? result;
  final int? lifepoints;

  const DuelistEventData({
    required this.duelistId,
    this.phase,
    this.result,
    this.lifepoints,
  });

  @override
  List<Object?> get props => [
        duelistId,
        phase,
        result,
        lifepoints,
      ];

  @override
  bool get stringify => true;

  @override
  Map<String, dynamic> toJson() => _$DuelistEventDataToJson(this);

  factory DuelistEventData.fromJson(Map<String, dynamic> json) => _$DuelistEventDataFromJson(json);
}
