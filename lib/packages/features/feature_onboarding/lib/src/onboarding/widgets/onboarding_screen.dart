import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/generated/assets.gen.dart';
import 'package:smart_duel_disk/generated/locale_keys.g.dart';
import 'package:smart_duel_disk/packages/features/feature_onboarding/lib/src/onboarding/models/onboarding_state.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

import '../onboarding_viewmodel.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen();

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void initState() {
    super.initState();

    final vm = Provider.of<OnboardingViewModel>(context, listen: false);
    vm.init();
  }

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
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: AppColors.onboardingBackgroundGradient,
      ),
      child: Stack(
        children: [
          if (!kIsWeb) ...{
            const Positioned.fill(
              child: _AnimatedBackground(),
            ),
          },
          SafeArea(
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
                    child: _Footer(),
                  ),
                  _Disclaimer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AnimatedBackground extends StatelessWidget {
  const _AnimatedBackground();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned.fill(child: _CircuitBackground()),
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.7)),
          ),
        ),
        Positioned.fill(
          child: Lottie.asset(
            Assets.animations.starryBackground,
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}

class _CircuitBackground extends HookWidget {
  const _CircuitBackground();

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController();

    return RotatedBox(
      quarterTurns: 1,
      child: Lottie.asset(
        Assets.animations.circuitBackground,
        fit: BoxFit.fill,
        controller: controller,
        frameRate: FrameRate(60),
        onLoaded: (composition) {
          controller
            ..duration = composition.duration * 2
            ..repeat();
        },
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
        _CrownCorpLogo(),
        SizedBox(height: AppSizes.screenMarginSmall),
        _AppTitle(),
      ],
    );
  }
}

class _CrownCorpLogo extends StatelessWidget {
  const _CrownCorpLogo();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Assets.illustrations.crowncorpLogo.path,
      width: 250,
    );
  }
}

class _AppTitle extends StatelessWidget with ProviderMixin {
  const _AppTitle();

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

class _Footer extends HookWidget with ProviderMixin {
  const _Footer();

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<OnboardingViewModel>(context);
    final stringProvider = getStringProvider(context);

    final state = useStream(vm.onboardingState, initialData: const OnboardingConnecting());
    final data = state.data;

    if (data == null) {
      return _LoadingState(text: stringProvider.getString(LocaleKeys.onboarding_status_connectivity_check));
    }

    return data.when(
      ready: () => const _InitiateLinkButton(),
      connecting: () => _LoadingState(text: stringProvider.getString(LocaleKeys.onboarding_status_connectivity_check)),
      cachingCards: () => _LoadingState(text: stringProvider.getString(LocaleKeys.onboarding_status_cards_cache_check)),
      cachingCardImages: (progress) => _LoadingState(
        text: '${stringProvider.getString(LocaleKeys.onboarding_status_card_image_cache_check)}\n$progress',
      ),
    );
  }
}

class _LoadingState extends StatelessWidget {
  final String text;

  const _LoadingState({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0.0, 0.5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const LoadingIndicator(),
          const SizedBox(height: AppSizes.screenMarginLarge),
          Text(
            text,
            style: TextStyles.subtitle.copyWith(
              height: 2,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _InitiateLinkButton extends StatelessWidget with ProviderMixin {
  const _InitiateLinkButton();

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<OnboardingViewModel>(context);
    final stringProvider = getStringProvider(context);

    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.screenMarginSmall),
        child: PrimaryButton(
          text: stringProvider.getString(LocaleKeys.onboarding_initiate_link),
          onPressed: vm.onInitiateLinkPressed,
        ),
      ),
    );
  }
}

class _Disclaimer extends StatelessWidget with ProviderMixin {
  const _Disclaimer();

  @override
  Widget build(BuildContext context) {
    final stringProvider = getStringProvider(context);

    return Padding(
      padding: const EdgeInsets.only(top: 28.0),
      child: Text(
        stringProvider.getString(LocaleKeys.onboarding_fineprint),
        textAlign: TextAlign.center,
        style: TextStyles.onboardingFineprint,
      ),
    );
  }
}
