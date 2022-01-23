import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart' as firebase_ui;
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

import '../sign_in_viewmodel.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen();

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  void initState() {
    super.initState();

    final vm = Provider.of<SignInViewModel>(context, listen: false);
    vm.init();
  }

  @override
  Widget build(BuildContext context) {
    return firebase_ui.SignInScreen(
      headerBuilder: (_, __, ___) => const Center(
        child: CrownCorpLogo.signIn(),
      ),
      footerBuilder: (_, __) => const CrownCorpFineprint(),
      providerConfigs: const [
        firebase_ui.EmailProviderConfiguration(),
      ],
    );
  }
}
