import 'package:enum_to_string/enum_to_string.dart';
import 'package:injectable/injectable.dart';

abstract class EnumHelper {
  T fromString<T>(List<T> enumValues, String value);
  // ignore: avoid_annotating_with_dynamic
  String convertToString(dynamic enumItem, {bool camelCase = false});
}

@LazySingleton(as: EnumHelper)
class EnumHelperImpl implements EnumHelper {
  @override
  T fromString<T>(List<T> enumValues, String value) {
    return EnumToString.fromString(enumValues, value);
  }

  @override
  // ignore: avoid_annotating_with_dynamic
  String convertToString(dynamic enumItem, {bool camelCase = false}) {
    return EnumToString.convertToString(enumItem, camelCase: camelCase);
  }
}
