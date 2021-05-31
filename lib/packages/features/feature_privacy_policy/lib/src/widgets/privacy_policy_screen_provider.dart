import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/src/di/di.dart';

import '../privacy_policy_viewmodel.dart';
import 'privacy_policy_screen.dart';

class PrivacyPolicyScreenProvider extends StatelessWidget {
  const PrivacyPolicyScreenProvider();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<PrivacyPolicyViewModel>(
          create: (_) => di.get<PrivacyPolicyViewModel>(),
          dispose: (_, vm) => vm.dispose(),
        ),
      ],
      child: const PrivacyPolicyScreen(),
    );
  }
}
