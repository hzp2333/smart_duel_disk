import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:smart_duel_disk/packages/core/core_smart_duel_server/lib/core_smart_duel_server.dart';

@immutable
class DeclarePhaseDialogParameters extends Equatable {
  final DuelPhaseType currentDuelPhaseType;

  const DeclarePhaseDialogParameters({
    required this.currentDuelPhaseType,
  });

  @override
  List<Object?> get props => [
        currentDuelPhaseType,
      ];

  @override
  bool get stringify => true;
}
