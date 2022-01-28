import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/packages/core/authentication/authentication.dart';
import 'package:smart_duel_disk/packages/core/core_logger/lib/core_logger.dart';
import 'package:smart_duel_disk/packages/core/core_navigation/lib/core_navigation.dart';
import 'package:smart_duel_disk/src/di/di.dart';

import '../sign_in_viewmodel.dart';
import 'sign_in_screen.dart';

class SignInScreenProvider extends StatelessWidget {
  final SignInCallback? onSignedIn;

  const SignInScreenProvider({
    this.onSignedIn,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<SignInViewModel>(
          create: (_) => SignInViewModel(
            onSignedIn,
            di.get<AuthenticationService>(),
            di.get<AppRouter>(),
            di.get<Logger>(),
          ),
          dispose: (_, vm) => vm.dispose(),
        ),
      ],
      child: const SignInScreen(),
    );
  }
}
