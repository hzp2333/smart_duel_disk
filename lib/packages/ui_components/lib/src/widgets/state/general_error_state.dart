import 'package:flutter/material.dart';
import 'package:smart_duel_disk/src/localization/strings.al.dart';

import '../../../ui_components.dart';

class GeneralErrorState extends StatelessWidget {
  final String description;
  final bool canRetry;
  final VoidCallback retryAction;

  const GeneralErrorState({
    @required this.description,
    this.canRetry = false,
    this.retryAction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimensions.screenMargin),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              description,
              textAlign: TextAlign.center,
            ),
            if (canRetry && retryAction != null) ...{
              const SizedBox(height: AppDimensions.descriptionButtonSpacing),
              ElevatedButton(
                onPressed: retryAction,
                style: ElevatedButton.styleFrom(
                  primary: AppColors.primaryAccentColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppDimensions.generalBorderRadius),
                  ),
                ),
                child: Text(Strings.generalErrorTryAgain.get()),
              ),
            },
          ],
        ),
      ),
    );
  }
}
