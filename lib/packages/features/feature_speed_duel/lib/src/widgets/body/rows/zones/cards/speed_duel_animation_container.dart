import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/speed_duel_models.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

class SpeedDuelAnimationContainer extends StatefulWidget {
  final Stream<SpeedDuelAnimation> animationStream;
  final Widget child;

  const SpeedDuelAnimationContainer({
    required this.animationStream,
    required this.child,
  });

  @override
  _SpeedDuelAnimationContainerState createState() => _SpeedDuelAnimationContainerState();
}

class _SpeedDuelAnimationContainerState extends State<SpeedDuelAnimationContainer> with SingleTickerProviderStateMixin {
  late Color _animationColor;
  late AnimationController _animationController;

  late StreamSubscription<SpeedDuelAnimation> _animationSubscription;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(vsync: this, upperBound: 8.0);
    _resetAnimationColor();

    _animationSubscription = widget.animationStream.listen(_playAnimation);
  }

  void _resetAnimationColor() {
    _animationColor = Colors.transparent;
  }

  Future<void> _playAnimation(SpeedDuelAnimation animation) async {
    try {
      // Set the animation color and duration.
      _animationColor = animation.animationColor;
      _animationController.duration = animation.animationDuration;

      // Reset the animation controller in case an animation was still playing.
      _animationController.reset();

      // Wait for a given duration and then play the animation forward.
      await Future.delayed(animation.waitTime, () async {
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
  void didUpdateWidget(covariant SpeedDuelAnimationContainer oldWidget) {
    super.didUpdateWidget(oldWidget);

    _resetAnimationColor();
  }

  @override
  void dispose() {
    _animationSubscription.cancel();
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
