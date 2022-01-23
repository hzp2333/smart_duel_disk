import 'package:flutter/material.dart';
import 'package:smart_duel_disk/generated/assets.gen.dart';

class CrownCorpLogo extends StatelessWidget {
  final double _width;

  const CrownCorpLogo.onboarding() : _width = 250;

  const CrownCorpLogo.signIn() : _width = 250;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Assets.illustrations.crowncorpLogo.path,
      width: _width,
      fit: BoxFit.fitWidth,
    );
  }
}
