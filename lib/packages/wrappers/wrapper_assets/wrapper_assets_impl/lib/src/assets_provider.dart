import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_assets/wrapper_assets_interface/lib/wrapper_assets_interface.dart';

@LazySingleton(as: AssetsProvider)
class AssetsProviderImpl implements AssetsProvider {
  @override
  String get cardBack => 'assets/illustrations/card_back.jpeg';

  @override
  String get speedDuelFieldBackground => 'assets/illustrations/speed_duel_field_background.png';

  @override
  String get iconAttributeDark => 'assets/icons/ic_attribute_dark.png';

  @override
  String get iconAttributeDivine => 'assets/icons/ic_attribute_divine.png';

  @override
  String get iconAttributeEarth => 'assets/icons/ic_attribute_earth.png';

  @override
  String get iconAttributeFire => 'assets/icons/ic_attribute_fire.png';

  @override
  String get iconAttributeLight => 'assets/icons/ic_attribute_light.png';

  @override
  String get iconAttributeWater => 'assets/icons/ic_attribute_water.png';

  @override
  String get iconAttributeWind => 'assets/icons/ic_attribute_wind.png';

  @override
  String get iconCardLevel => 'assets/icons/ic_card_level.png';

  @override
  String get iconCardTypeSpell => 'assets/icons/ic_card_type_spell.png';

  @override
  String get iconCardTypeTrap => 'assets/icons/ic_card_type_trap.png';
}
