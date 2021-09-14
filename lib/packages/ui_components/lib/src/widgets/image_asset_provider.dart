import 'package:flutter/material.dart';

class ImageAssetProvider extends StatelessWidget {
  final String? assetName;
  final Color? color;
  final double? size;
  final BoxFit? fit;

  const ImageAssetProvider({
    required this.assetName,
    this.color,
    this.size,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      assetName!,
      color: color,
      width: size,
      height: size,
      fit: fit,
    );
  }
}
