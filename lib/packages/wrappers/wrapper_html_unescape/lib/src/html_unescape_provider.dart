import 'package:html_unescape/html_unescape.dart';
import 'package:injectable/injectable.dart';

abstract class HtmlUnescapeProvider {
  String convert(String? text);
}

@LazySingleton(as: HtmlUnescapeProvider)
class HtmlUnescapeProviderImpl implements HtmlUnescapeProvider {
  final HtmlUnescape _htmlUnescape;

  HtmlUnescapeProviderImpl() : _htmlUnescape = HtmlUnescape();

  @override
  String convert(String? text) {
    return _htmlUnescape.convert(text!);
  }
}
