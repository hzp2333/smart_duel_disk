import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/src/di/di.dart';

import '../onboarding_viewmodel.dart';
import 'onboarding_screen.dart';

class OnboardingScreenProvider extends StatelessWidget {
  const OnboardingScreenProvider();

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => di.get<OnboardingViewModel>(),
      child: const OnboardingScreen(),
    );
  }
}
