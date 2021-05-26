import 'package:freezed_annotation/freezed_annotation.dart';

part 'duel_room_state.freezed.dart';

@freezed
abstract class DuelRoomState with _$DuelRoomState {
  const factory DuelRoomState.connecting() = DuelRoomConnecting;
  const factory DuelRoomState.connected() = DuelRoomConnected;
  const factory DuelRoomState.createRoom(String roomName) = DuelRoomCreate;
  const factory DuelRoomState.joinRoom(String roomName) = DuelRoomJoin;
  const factory DuelRoomState.ready() = DuelRoomReady;
  const factory DuelRoomState.error(String errorMessage) = DuelRoomError;
}
