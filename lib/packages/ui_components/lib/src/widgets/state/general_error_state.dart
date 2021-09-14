import 'package:flutter/material.dart';
import 'package:smart_duel_disk/generated/locale_keys.g.dart';
import '../../../ui_components.dart';

class GeneralErrorState extends StatelessWidget with ProviderMixin {
  final String description;
  final bool canRetry;
  final VoidCallback? retryAction;

  const GeneralErrorState({
    required this.description,
    this.canRetry = false,
    this.retryAction,
  });

  @override
  Widget build(BuildContext context) {
    final stringProvider = getStringProvider(context);

    return Padding(
      padding: const EdgeInsets.all(AppSizes.screenMargin),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              description,
              textAlign: TextAlign.center,
            ),
            if (canRetry && retryAction != null) ...{
              const SizedBox(height: AppSizes.screenMargin),
              ElevatedButton(
                onPressed: retryAction,
                style: ElevatedButton.styleFrom(
                  primary: AppColors.primaryAccentColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSizes.generalBorderRadius),
                  ),
                ),
                child: Text(
                  stringProvider.getString(LocaleKeys.general_error_try_again),
                ),
              ),
            },
          ],
        ),
      ),
    );
  }
}
