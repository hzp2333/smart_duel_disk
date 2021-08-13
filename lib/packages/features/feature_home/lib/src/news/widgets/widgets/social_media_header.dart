import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/packages/features/feature_home/lib/src/news/models/social_media.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

import '../../news_viewmodel.dart';

class SocialMediaHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: SocialMedia.values.map((sm) => _SocialMediaHeaderItem(socialMedia: sm)).toList(),
      ),
    );
  }
}

class _SocialMediaHeaderItem extends StatelessWidget {
  final SocialMedia socialMedia;

  const _SocialMediaHeaderItem({
    @required this.socialMedia,
  });

  IconData _getSocialMediaIcon() {
    switch (socialMedia) {
      case SocialMedia.youtube:
        return FontAwesomeIcons.youtube;
      case SocialMedia.twitter:
        return FontAwesomeIcons.twitter;
      case SocialMedia.discord:
        return FontAwesomeIcons.discord;
      default:
        throw 'Invalid social media.';
    }
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<NewsViewModel>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.newsSocialMediaSpacing,
      ),
      child: IconButton(
        onPressed: () => vm.onSocialMediaPressed(socialMedia),
        highlightColor: Colors.transparent,
        splashColor: AppColors.tabSplashColor,
        icon: Icon(
          _getSocialMediaIcon(),
          color: AppColors.primaryIconColor,
        ),
      ),
    );
  }
}
