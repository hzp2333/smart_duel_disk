import 'package:flutter/material.dart';

import '../../../ui_components.dart';

class GeneralLoadingState extends StatelessWidget {
  const GeneralLoadingState();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: LoadingIndicator(),
    );
  }
}

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator();

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(AppColors.primaryAccentColor),
    );
  }
}
