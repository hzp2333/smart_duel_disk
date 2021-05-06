import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_html_unescape/wrapper_html_unescape_interface/lib/wrapper_html_unescape_interface.dart';
import 'package:html_unescape/html_unescape.dart';

@LazySingleton(as: HtmlUnescapeProvider)
class HtmlUnescapeProviderImpl implements HtmlUnescapeProvider {
  final HtmlUnescape _htmlUnescape;

  HtmlUnescapeProviderImpl() : _htmlUnescape = HtmlUnescape();

  @override
  String convert(String text) {
    return _htmlUnescape.convert(text);
  }
}
