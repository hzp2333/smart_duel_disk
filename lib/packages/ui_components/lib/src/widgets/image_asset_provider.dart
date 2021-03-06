import 'package:flutter/material.dart';

class ImageAssetProvider extends StatelessWidget {
  final String assetName;
  final Color color;
  final double size;

  const ImageAssetProvider({
    @required this.assetName,
    this.color,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      assetName,
      color: color,
      width: size,
      height: size,
    );
  }
}
