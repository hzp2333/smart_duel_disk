import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart' as firebase_ui;

class SignInScreen extends StatelessWidget {
  const SignInScreen();

  @override
  Widget build(BuildContext context) {
    return const firebase_ui.SignInScreen(
      providerConfigs: [
        firebase_ui.EmailProviderConfiguration(),
      ],
    );
  }
}
