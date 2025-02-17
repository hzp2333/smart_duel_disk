import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/generated/locale_keys.g.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

import '../privacy_policy_viewmodel.dart';

class PrivacyPolicyScreen extends StatelessWidget with ProviderMixin {
  const PrivacyPolicyScreen();

  @override
  Widget build(BuildContext context) {
    final stringProvider = getStringProvider(context);

    return Scaffold(
      appBar: SddAppBar(
        title: stringProvider.getString(LocaleKeys.privacy_policy_title),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<PrivacyPolicyViewModel>(context);

    return FutureBuilder<String>(
      future: vm.getContent(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox.shrink();
        }

        return SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppSizes.screenMargin),
            child: HtmlWidget(
              snapshot.data!,
              onTapUrl: vm.onUrlPressed,
            ),
          ),
        );
      },
    );
  }
}
