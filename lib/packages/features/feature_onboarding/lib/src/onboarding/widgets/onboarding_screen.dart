import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/generated/locale_keys.g.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_assets/lib/wrapper_assets.dart';

import '../onboarding_viewmodel.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen();

  @override
  Widget build(BuildContext context) {
    return const StatusBarOverrider(
      child: Scaffold(
        body: _Body(),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: AppColors.onboardingBackgroundGradient,
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.screenMarginLarge),
          child: Column(
            children: const [
              Expanded(
                flex: 9,
                child: _Header(),
              ),
              Expanded(
                flex: 8,
                child: _Actions(),
              ),
              _Footer(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: const [
        _CompanyLogo(),
        SizedBox(height: AppSizes.screenMarginSmall),
        _AppName(),
      ],
    );
  }
}

class _CompanyLogo extends StatelessWidget {
  const _CompanyLogo();

  @override
  Widget build(BuildContext context) {
    final assetsProvider = Provider.of<AssetsProvider>(context);

    return Image.asset(
      assetsProvider.iconCrownCorp,
      width: 250,
    );
  }
}

class _AppName extends StatelessWidget with ProviderMixin {
  const _AppName();

  @override
  Widget build(BuildContext context) {
    final stringProvider = getStringProvider(context);

    return Center(
      child: Text(
        stringProvider.getString(LocaleKeys.onboarding_app_title),
        textAlign: TextAlign.center,
        style: TextStyles.onboardingAppTile,
      ),
    );
  }
}

class _Actions extends StatelessWidget with ProviderMixin {
  const _Actions();

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<OnboardingViewModel>(context);
    final stringProvider = getStringProvider(context);

    return Align(
      alignment: Alignment.bottomCenter,
      child: PrimaryButton(
        text: stringProvider.getString(LocaleKeys.onboarding_initiate_link),
        onPressed: vm.onInitiateLinkPressed,
      ),
    );
  }
}

class _Footer extends StatelessWidget with ProviderMixin {
  const _Footer();

  @override
  Widget build(BuildContext context) {
    final stringProvider = getStringProvider(context);

    return Padding(
      padding: const EdgeInsets.only(top: AppSizes.onboardingFooterMarginTop),
      child: Text(
        stringProvider.getString(LocaleKeys.onboarding_fineprint),
        textAlign: TextAlign.center,
        style: TextStyles.onboardingFineprint,
      ),
    );
  }
}
