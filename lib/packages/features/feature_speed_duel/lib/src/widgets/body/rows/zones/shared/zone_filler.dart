import 'package:flutter/material.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';

class ZoneFiller extends StatelessWidget {
  const ZoneFiller();

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: AppDimensions.yugiohCardAspectRatio,
      child: SizedBox(height: context.playCardHeight),
    );
  }
}
