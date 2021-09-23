/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

import 'package:flutter/widgets.dart';

class $AssetsAnimationsGen {
  const $AssetsAnimationsGen();

  String get circuitBackground => 'assets/animations/circuit_background.json';
  String get starryBackground => 'assets/animations/starry_background.json';
}

class $AssetsHtmlGen {
  const $AssetsHtmlGen();

  String get privacyPolicy => 'assets/html/privacy_policy.html';
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  AssetGenImage get icAttributeDark => const AssetGenImage('assets/icons/ic_attribute_dark.png');
  AssetGenImage get icAttributeDivine => const AssetGenImage('assets/icons/ic_attribute_divine.png');
  AssetGenImage get icAttributeEarth => const AssetGenImage('assets/icons/ic_attribute_earth.png');
  AssetGenImage get icAttributeFire => const AssetGenImage('assets/icons/ic_attribute_fire.png');
  AssetGenImage get icAttributeLight => const AssetGenImage('assets/icons/ic_attribute_light.png');
  AssetGenImage get icAttributeWater => const AssetGenImage('assets/icons/ic_attribute_water.png');
  AssetGenImage get icAttributeWind => const AssetGenImage('assets/icons/ic_attribute_wind.png');
  AssetGenImage get icCardLevel => const AssetGenImage('assets/icons/ic_card_level.png');
  AssetGenImage get icCardTypeSpell => const AssetGenImage('assets/icons/ic_card_type_spell.png');
  AssetGenImage get icCardTypeTrap => const AssetGenImage('assets/icons/ic_card_type_trap.png');
}

class $AssetsIllustrationsGen {
  const $AssetsIllustrationsGen();

  AssetGenImage get cardBack => const AssetGenImage('assets/illustrations/card_back.jpeg');
  AssetGenImage get crowncorpLogo => const AssetGenImage('assets/illustrations/crowncorp_logo.png');
  $AssetsIllustrationsDuelistsGen get duelists => const $AssetsIllustrationsDuelistsGen();
  AssetGenImage get speedDuelFieldBackground =>
      const AssetGenImage('assets/illustrations/speed_duel_field_background.png');
}

class $AssetsIllustrationsDuelistsGen {
  const $AssetsIllustrationsDuelistsGen();

  AssetGenImage get duelistKaiba => const AssetGenImage('assets/illustrations/duelists/duelist_kaiba.png');
  AssetGenImage get duelistMai => const AssetGenImage('assets/illustrations/duelists/duelist_mai.png');
  AssetGenImage get duelistYugi => const AssetGenImage('assets/illustrations/duelists/duelist_yugi.png');
}

class Assets {
  Assets._();

  static const $AssetsAnimationsGen animations = $AssetsAnimationsGen();
  static const $AssetsHtmlGen html = $AssetsHtmlGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsIllustrationsGen illustrations = $AssetsIllustrationsGen();
}

class AssetGenImage extends AssetImage {
  const AssetGenImage(String assetName) : super(assetName);

  Image image({
    Key? key,
    ImageFrameBuilder? frameBuilder,
    ImageLoadingBuilder? loadingBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? width,
    double? height,
    Color? color,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    FilterQuality filterQuality = FilterQuality.low,
  }) {
    return Image(
      key: key,
      image: this,
      frameBuilder: frameBuilder,
      loadingBuilder: loadingBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      width: width,
      height: height,
      color: color,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      filterQuality: filterQuality,
    );
  }

  String get path => assetName;
}
