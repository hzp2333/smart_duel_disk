import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_duel_disk/packages/features/feature_home/lib/src/news/models/social_media.dart';

import 'widgets/social_media_header.dart';

class NewsScreen extends StatelessWidget {
  static final _socialMedia = List<SocialMedia>.unmodifiable(<SocialMedia>[
    const SocialMedia(icon: FontAwesomeIcons.youtube),
    const SocialMedia(icon: FontAwesomeIcons.twitter),
    const SocialMedia(icon: FontAwesomeIcons.discord),
  ]);

  const NewsScreen();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        children: [
          SocialMediaHeader(socialMedia: _socialMedia),
        ],
      ),
    );
  }
}
