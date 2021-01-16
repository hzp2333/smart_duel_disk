import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_assets/wrapper_assets_interface/lib/wrapper_assets_interface.dart';

@LazySingleton(as: AssetsProvider)
class AssetsProviderImpl implements AssetsProvider {
  @override
  String get cardBack => 'assets/illustrations/card_back.jpeg';
}
