import 'package:flutter/material.dart';
import 'package:smart_duel_disk/generated/locale_keys.g.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

class CrownCorpFineprint extends StatelessWidget with ProviderMixin {
  const CrownCorpFineprint();

  @override
  Widget build(BuildContext context) {
    final stringProvider = getStringProvider(context);

    return Padding(
      padding: const EdgeInsets.only(top: 28.0),
      child: Text(
        stringProvider.getString(LocaleKeys.onboarding_fineprint),
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.grey[400],
          fontSize: 13.0,
        ),
      ),
    );
  }
}
