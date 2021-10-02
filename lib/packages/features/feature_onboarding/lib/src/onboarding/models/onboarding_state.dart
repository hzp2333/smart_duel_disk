import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_state.freezed.dart';

@freezed
class OnboardingState with _$OnboardingState {
  const factory OnboardingState.connecting() = OnboardingConnecting;
  const factory OnboardingState.cachingCards() = OnboardingCachingCards;
  const factory OnboardingState.cachingCardImages(String progress) = OnboardingCachingCardImages;
  const factory OnboardingState.ready() = OnboardingReady;
}
