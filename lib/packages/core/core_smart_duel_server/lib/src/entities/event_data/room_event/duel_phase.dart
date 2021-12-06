import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:smart_duel_disk/packages/core/core_smart_duel_server/lib/core_smart_duel_server.dart';

part 'duel_phase.g.dart';

@immutable
@JsonSerializable()
class DuelPhase extends Equatable {
  final String duelistId;
  @JsonKey(unknownEnumValue: DuelPhaseType.unknown)
  final DuelPhaseType duelPhaseType;

  const DuelPhase({
    required this.duelistId,
    required this.duelPhaseType,
  });

  @override
  List<Object?> get props => [
        duelistId,
        duelPhaseType,
      ];

  @override
  bool? get stringify => true;

  factory DuelPhase.fromJson(Map<String, dynamic> json) => _$DuelPhaseFromJson(json);
}
