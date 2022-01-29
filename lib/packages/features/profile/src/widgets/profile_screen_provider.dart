import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/src/di/di.dart';

import '../profile_viewmodel.dart';
import 'profile_screen.dart';

class ProfileScreenProvider extends StatelessWidget {
  const ProfileScreenProvider();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ProfileViewModel>(
          create: (_) => di.get<ProfileViewModel>(),
          dispose: (_, vm) => vm.dispose(),
        ),
      ],
      child: const ProfileScreen(),
    );
  }
}
