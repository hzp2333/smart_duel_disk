import 'package:flutter/material.dart';
import 'package:smart_duel_disk/packages/features/feature_home/lib/src/news/models/social_media.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

class SocialMediaHeader extends StatelessWidget {
  final List<SocialMedia> socialMedia;

  const SocialMediaHeader({
    @required this.socialMedia,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: socialMedia.map((sm) => _SocialMediaHeaderItem(socialMedia: sm)).toList(),
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
