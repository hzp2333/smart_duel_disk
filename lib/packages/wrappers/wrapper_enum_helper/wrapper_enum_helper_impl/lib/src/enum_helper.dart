import 'package:enum_to_string/enum_to_string.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_enum_helper/wrapper_enum_helper_interface/lib/wrapper_enum_helper_interface.dart';

@LazySingleton(as: EnumHelper)
class EnumHelperImpl implements EnumHelper {
  @override
  T fromString<T>(List<T> enumValues, String value) {
    return EnumToString.fromString(enumValues, value);
  }

  @override
  String convertToString(dynamic enumItem, {bool camelCase = false}) {
    return EnumToString.convertToString(enumItem, camelCase: camelCase);
  }
}
