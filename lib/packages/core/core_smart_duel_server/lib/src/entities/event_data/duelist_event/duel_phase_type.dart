import 'package:json_annotation/json_annotation.dart';

enum DuelPhaseType {
  @JsonValue('drawPhase')
  drawPhase,
  @JsonValue('standbyPhase')
  standbyPhase,
  @JsonValue('mainPhase1')
  mainPhase1,
  @JsonValue('battlePhase')
  battlePhase,
  @JsonValue('endPhase')
  endPhase,
  unknown,
}

extension DuelPhaseTypeExtensions on DuelPhaseType {
  String get shortName {
    switch (this) {
      case DuelPhaseType.drawPhase:
        return 'DP';
      case DuelPhaseType.standbyPhase:
        return 'SP';
      case DuelPhaseType.mainPhase1:
        return 'MP1';
      case DuelPhaseType.battlePhase:
        return 'BP';
      case DuelPhaseType.endPhase:
        return 'EP';
      case DuelPhaseType.unknown:
      default:
        return '';
    }
  }
}
