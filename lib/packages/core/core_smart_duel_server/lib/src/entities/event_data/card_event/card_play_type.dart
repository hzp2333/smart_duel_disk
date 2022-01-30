import 'package:json_annotation/json_annotation.dart';

enum CardPlayType {
  @JsonValue('normalSummon')
  normalSummon,
  @JsonValue('specialSummon')
  specialSummon,
  @JsonValue('set')
  set,
  @JsonValue('activate')
  activate,
  @JsonValue('draw')
  draw,
  other,
}
