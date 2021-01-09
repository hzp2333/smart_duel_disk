import 'package:flutter/material.dart';

import '../../../ui_components.dart';

class GeneralLoadingState extends StatelessWidget {
  const GeneralLoadingState();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(AppColors.primaryAccentColor),
      ),
    );
  }
}
