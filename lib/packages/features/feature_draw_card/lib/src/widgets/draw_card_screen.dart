import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/packages/features/feature_draw_card/lib/src/draw_card_viewmodel.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_assets/wrapper_assets_interface/lib/wrapper_assets_interface.dart';

class DrawCardScreen extends StatefulWidget {
  const DrawCardScreen();

  @override
  _DrawCardScreenState createState() => _DrawCardScreenState();
}

class _DrawCardScreenState extends State<DrawCardScreen> {
  static const _animationDuration = Duration(milliseconds: 500);

  Widget _cardImage;

  bool _isAnimating = true;
  bool _isAnimationStarted = false;

  @override
  void initState() {
    super.initState();

    final assetsProvider = Provider.of<AssetsProvider>(context, listen: false);
    _cardImage = _CardImage(imageAssetId: assetsProvider.cardBack);

    _startAnimation();
  }

  void _startAnimation() {
    Future.delayed(const Duration(), () {
      setState(() => _isAnimationStarted = true);
      Future.delayed(_animationDuration, () {
        setState(() => _isAnimating = false);
      });
    });
  }

  Future<void> _onCardDrawn() {
    setState(() => _cardImage = const SizedBox.shrink());

    final vm = Provider.of<DrawCardViewModel>(context, listen: false);
    return vm.onCardDrawn();
  }

  @override
  Widget build(BuildContext context) {
    final assetsProvider = Provider.of<AssetsProvider>(context);

    final screenHeight = MediaQuery.of(context).size.height;
    final animatingRightOffset = screenHeight * 2;
    final animatingLeftOffset = animatingRightOffset * -1;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.center,
        children: [
          _CardDragTarget(onCardDrawn: _onCardDrawn),
          if (_isAnimating) ...{
            AnimatedPositioned(
              duration: _animationDuration,
              curve: Curves.fastOutSlowIn,
              left: _isAnimationStarted ? 0 : animatingLeftOffset,
              right: _isAnimationStarted ? 0 : animatingRightOffset,
              child: _CardImage(imageAssetId: assetsProvider.cardBack),
            ),
          } else ...{
            _CardDraggable(cardImage: _cardImage),
          }
        ],
      ),
    );
  }
}

class _CardDragTarget extends StatelessWidget {
  final VoidCallback onCardDrawn;

  const _CardDragTarget({
    @required this.onCardDrawn,
  });

  @override
  Widget build(BuildContext context) {
    return DragTarget<String>(
      builder: (_, __, ___) => const SizedBox.expand(),
      onAccept: (_) => onCardDrawn(),
      onLeave: (_) => onCardDrawn(),
    );
  }
}

class _CardDraggable extends StatelessWidget {
  final Widget cardImage;

  const _CardDraggable({
    @required this.cardImage,
  });

  @override
  Widget build(BuildContext context) {
    return Draggable<String>(
      axis: Axis.horizontal,
      maxSimultaneousDrags: 1,
      childWhenDragging: const SizedBox.shrink(),
      onDragStarted: HapticFeedback.heavyImpact,
      feedback: cardImage,
      data: '',
      child: cardImage,
    );
  }
}

class _CardImage extends StatelessWidget {
  final String imageAssetId;

  const _CardImage({
    @required this.imageAssetId,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.height;

    return RotatedBox(
      quarterTurns: 1,
      child: Image.asset(
        imageAssetId,
        width: screenWidth,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
