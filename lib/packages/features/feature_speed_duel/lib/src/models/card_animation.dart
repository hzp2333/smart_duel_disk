import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

@immutable
abstract class CardAnimation extends Equatable {
  final String duelistId;
  final int cardId;
  final int copyNumber;
  final Color animationColor;
  final Duration waitTime;
  final Duration animationDuration;

  const CardAnimation({
    required this.duelistId,
    required this.cardId,
    required this.copyNumber,
    required this.animationColor,
    this.waitTime = Duration.zero,
    this.animationDuration = AppDurations.cardEventAnimationDuration,
  });

  @override
  List<Object> get props => [
        duelistId,
        cardId,
        copyNumber,
        animationColor,
        waitTime,
        animationDuration,
      ];

  @override
  bool get stringify => true;
}

class AttackAnimation extends CardAnimation {
  const AttackAnimation({
    required String duelistId,
    required int cardId,
    required int copyNumber,
    Duration waitTime = Duration.zero,
  }) : super(
          cardId: cardId,
          copyNumber: copyNumber,
          animationColor: AppColors.cardAnimationAttack,
          waitTime: waitTime,
          duelistId: duelistId,
        );
}
