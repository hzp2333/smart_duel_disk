import 'package:json_annotation/json_annotation.dart';

enum RoomError {
  @JsonValue('roomNotFound')
  roomNotFound,
  @JsonValue('tooManyPlayers')
  tooManyPlayers,
  unknown,
}

extension RoomErrorExtensions on RoomError? {
  String get stringValue {
    switch (this) {
      case RoomError.roomNotFound:
        return 'room not found';
      case RoomError.tooManyPlayers:
        return 'too many players';
      default:
        return 'unknown reason';
    }
  }
}
