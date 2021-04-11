import 'package:flutter/material.dart';

class ImagePlaceholder extends StatelessWidget {
  final String imageAssetId;
  final BoxFit boxFit;

  const ImagePlaceholder({
    @required this.imageAssetId,
    this.boxFit = BoxFit.contain,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(imageAssetId);
  }
}
