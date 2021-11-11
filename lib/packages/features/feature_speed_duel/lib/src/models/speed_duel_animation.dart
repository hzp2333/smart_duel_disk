import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone_type.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

@immutable
abstract class SpeedDuelAnimation extends Equatable {
  final String duelistId;
  final Color animationColor;
  final Duration waitTime;
  final Duration animationDuration;

  const SpeedDuelAnimation({
    required this.duelistId,
    required this.animationColor,
    this.waitTime = Duration.zero,
    this.animationDuration = AppDurations.speedDuelEventAnimationDuration,
  });

  @override
  List<Object> get props => [
        duelistId,
        animationColor,
        waitTime,
        animationDuration,
      ];

  @override
  bool get stringify => true;
}

//region Card animations

abstract class CardAnimation extends SpeedDuelAnimation {
  final int cardId;
  final int copyNumber;

  const CardAnimation({
    required String duelistId,
    required Color animationColor,
    required this.cardId,
    required this.copyNumber,
    Duration waitTime = Duration.zero,
    Duration animationDuration = AppDurations.speedDuelEventAnimationDuration,
  }) : super(
          duelistId: duelistId,
          animationColor: animationColor,
          waitTime: waitTime,
          animationDuration: animationDuration,
        );

  @override
  List<Object> get props => [
        duelistId,
        cardId,
        copyNumber,
        animationColor,
        waitTime,
        animationDuration,
      ];
}

class AttackAnimation extends CardAnimation {
  const AttackAnimation({
    required String duelistId,
    required int cardId,
    required int copyNumber,
    Duration waitTime = Duration.zero,
  }) : super(
          duelistId: duelistId,
          cardId: cardId,
          copyNumber: copyNumber,
          animationColor: AppColors.cardAnimationAttack,
          waitTime: waitTime,
        );
}

class DeclareAnimation extends CardAnimation {
  const DeclareAnimation({
    required String duelistId,
    required int cardId,
    required int copyNumber,
  }) : super(
          duelistId: duelistId,
          cardId: cardId,
          copyNumber: copyNumber,
          animationColor: AppColors.cardAnimationDeclare,
        );
}

//endregion

//region Zone animations

abstract class ZoneAnimation extends SpeedDuelAnimation {
  final ZoneType zoneType;

  const ZoneAnimation({
    required String duelistId,
    required Color animationColor,
    required this.zoneType,
    Duration waitTime = Duration.zero,
    Duration animationDuration = AppDurations.speedDuelEventAnimationDuration,
  }) : super(
          duelistId: duelistId,
          animationColor: animationColor,
          waitTime: waitTime,
          animationDuration: animationDuration,
        );

  @override
  List<Object> get props => [
        duelistId,
        zoneType,
        animationColor,
        waitTime,
        animationDuration,
      ];
}

class ShuffleAnimation extends ZoneAnimation {
  const ShuffleAnimation({
    required String duelistId,
  }) : super(
          duelistId: duelistId,
          animationColor: AppColors.zoneAnimationShuffle,
          zoneType: ZoneType.deck,
        );
}

//endregion
