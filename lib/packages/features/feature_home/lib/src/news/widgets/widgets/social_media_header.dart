import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_duel_disk/packages/features/feature_home/lib/src/news/models/social_media.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

class SocialMediaHeader extends StatelessWidget {
  static final _socialMedia = List<SocialMedia>.unmodifiable(<SocialMedia>[
    const SocialMedia(icon: FontAwesomeIcons.youtube),
    const SocialMedia(icon: FontAwesomeIcons.twitter),
    const SocialMedia(icon: FontAwesomeIcons.discord),
  ]);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: _socialMedia.map((sm) => _SocialMediaHeaderItem(socialMedia: sm)).toList(),
      ),
    );
  }
}

class _SocialMediaHeaderItem extends StatelessWidget {
  final SocialMedia socialMedia;

  const _SocialMediaHeaderItem({
    @required this.socialMedia,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.newsSocialMediaSpacing,
      ),
      child: IconButton(
        onPressed: () {},
        highlightColor: Colors.transparent,
        splashColor: AppColors.splashColor,
        icon: Icon(
          socialMedia.icon,
          color: AppColors.iconColor,
        ),
      ),
    );
  }
}
