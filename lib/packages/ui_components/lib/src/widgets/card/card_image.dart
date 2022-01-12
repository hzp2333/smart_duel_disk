import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smart_duel_disk/generated/assets.gen.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';
import 'package:universal_io/io.dart';

class CardImage extends StatelessWidget {
  static final _cardBackPath = Assets.illustrations.cardBack.path;
  static final _placeHolder = ImagePlaceholder(imageAssetId: _cardBackPath);

  final YugiohCard card;
  final File? image;
  final BoxFit fit;

  const CardImage({
    required this.card,
    required this.image,
    this.fit = BoxFit.contain,
  });

  @override
  Widget build(BuildContext context) {
    if (image != null) {
      // This can be used for web, but it ruins Hero animations.
      // return Image.memory(File(image!.path).readAsBytesSync());
      return Image.file(
        image!,
        frameBuilder: (_, child, frame, ___) => frame == null ? _placeHolder : child,
      );
    }

    return CachedNetworkImage(
      imageUrl: card.imageLargeUrl,
      fit: fit,
      placeholder: (_, __) => _placeHolder,
      // ignore: avoid_annotating_with_dynamic
      errorWidget: (_, __, dynamic ___) => _placeHolder,
    );
  }
}
