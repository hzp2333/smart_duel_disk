import 'package:flutter/material.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

class Section extends StatelessWidget {
  final String title;
  final Widget child;

  const Section({
    @required this.title,
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionTitle(title: title),
        const SizedBox(height: AppDimensions.sectionTitleChildSeparator),
        child,
      ],
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle({
    @required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyles.deckSectionTitle,
    );
  }
}
