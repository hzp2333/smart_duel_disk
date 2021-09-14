import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgAssetProvider extends StatelessWidget {
  final String assetName;
  final Color? color;
  final double? size;

  const SvgAssetProvider({
    required this.assetName,
    this.color,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      color: color,
      width: size,
      height: size,
    );
  }
}
