import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/play_card.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone.dart';

@immutable
class PlayCardDialogParameters extends Equatable {
  final PlayCard playCard;
  final Zone? newZone;
  final bool showActions;

  const PlayCardDialogParameters({
    required this.playCard,
    required this.newZone,
    required this.showActions,
  });

  @override
  List<Object?> get props => [
        playCard,
        newZone,
        showActions,
      ];

  @override
  bool get stringify => true;
}
