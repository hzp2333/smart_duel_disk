import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';

abstract class StringProvider {
  String getString(String key, [List<String>? args]);
}

@LazySingleton(as: StringProvider)
class StringProviderImpl implements StringProvider {
  @override
  String getString(String key, [List<String>? args]) {
    return key.tr(args: args);
  }
}
