import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/helpers/card_event_animation_handler.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/play_card.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/speed_duel_models.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';
import 'package:smart_duel_disk/src/di/di.dart';

class CardAnimationContainer extends StatefulWidget {
  final PlayCard? playCard;
  final Widget child;

  const CardAnimationContainer({
    required this.playCard,
    required this.child,
  });

  @override
  _CardAnimationContainerState createState() => _CardAnimationContainerState();
}

class _CardAnimationContainerState extends State<CardAnimationContainer> with SingleTickerProviderStateMixin {
  late Color _animationColor;
  late AnimationController _animationController;

  late StreamSubscription<CardAnimation> _cardAnimationSubscription;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(vsync: this, upperBound: 8.0);
    _resetAnimationColor();

    // TODO: find a better way to inject this dependency.
    // Can't use Provider because the dependency might not exist in the context.
    // Maybe provide it at root level? But then the entire app can access it...
    final cardEventAnimationHandler = di.get<CardEventAnimationHandler>();
    _cardAnimationSubscription = cardEventAnimationHandler.cardAnimations.listen(_onCardAnimation);
  }

  void _resetAnimationColor() {
    _animationColor = Colors.transparent;
  }

  Future<void> _onCardAnimation(CardAnimation cardAnimation) async {
    if (cardAnimation.cardId == widget.playCard!.yugiohCard.id &&
        cardAnimation.copyNumber == widget.playCard!.copyNumber &&
        cardAnimation.duelistId == widget.playCard!.duelistId &&
        mounted) {
      await _playAnimation(cardAnimation);
    }
  }

  Future<void> _playAnimation(CardAnimation cardAnimation) async {
    try {
      // Set the animation color and duration.
      _animationColor = cardAnimation.animationColor;
      _animationController.duration = cardAnimation.animationDuration;

      // Reset the animation controller in case an animation was still playing.
      _animationController.reset();

      // Wait for a given duration and then play the animation forward.
      await Future.delayed(cardAnimation.waitTime, () async {
        if (mounted) await _animationController.forward();
      });

      // Play the animation backward to the start point.
      if (mounted) await _animationController.animateBack(0.0);

      if (mounted) setState(() => _resetAnimationColor());
    } catch (e) {
      // Silently ignore.
    }
  }

  @override
  void didUpdateWidget(covariant CardAnimationContainer oldWidget) {
    super.didUpdateWidget(oldWidget);

    _resetAnimationColor();
  }

  @override
  void dispose() {
    _cardAnimationSubscription.cancel();
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (_, child) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSizes.cardAnimationBorderRadius),
            boxShadow: [
              BoxShadow(
                color: _animationColor,
                blurRadius: _animationController.value,
                spreadRadius: _animationController.value,
              ),
            ],
          ),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
