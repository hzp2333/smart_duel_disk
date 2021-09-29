import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smart_duel_disk/generated/assets.gen.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';
import 'package:universal_io/io.dart';

class CardImage extends StatelessWidget {
  static final _cardBackPath = Assets.illustrations.cardBack.path;

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
      return Image.file(
        image!,
        fit: fit,
      );
    }

    return CachedNetworkImage(
      imageUrl: card.imageLargeUrl,
      fit: fit,
      placeholder: (_, __) => ImagePlaceholder(imageAssetId: _cardBackPath),
      // ignore: avoid_annotating_with_dynamic
      errorWidget: (_, __, dynamic ___) => ImagePlaceholder(imageAssetId: _cardBackPath),
    );
  }
}
