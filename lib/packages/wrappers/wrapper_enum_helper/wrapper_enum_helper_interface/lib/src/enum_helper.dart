abstract class EnumHelper {
  T fromString<T>(List<T> enumValues, String value);
  String convertToString(dynamic enumItem, {bool camelCase = false});
}
