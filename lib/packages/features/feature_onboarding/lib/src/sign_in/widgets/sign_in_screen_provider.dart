import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/src/di/di.dart';

import '../sign_in_viewmodel.dart';
import 'sign_in_screen.dart';

class SignInScreenProvider extends StatelessWidget {
  const SignInScreenProvider();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<SignInViewModel>(
          create: (_) => di.get<SignInViewModel>(),
          dispose: (_, vm) => vm.dispose(),
        ),
      ],
      child: const SignInScreen(),
    );
  }
}
