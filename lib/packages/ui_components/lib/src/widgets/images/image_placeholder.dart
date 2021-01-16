import 'package:flutter/material.dart';

class ImagePlaceholder extends StatelessWidget {
  final String imageAssetId;

  const ImagePlaceholder({
    @required this.imageAssetId,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(imageAssetId);
  }
}
