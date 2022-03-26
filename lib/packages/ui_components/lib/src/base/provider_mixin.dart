import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';
import 'package:smart_duel_disk/packages/core/core_localization/lib/core_localization.dart';

mixin ProviderMixin {
  T getViewModel<T extends BaseViewModel>(BuildContext context, {bool listen = true}) =>
      Provider.of<T>(context, listen: listen);
  StringProvider getStringProvider(BuildContext context) => Provider.of<StringProvider>(context);
}
