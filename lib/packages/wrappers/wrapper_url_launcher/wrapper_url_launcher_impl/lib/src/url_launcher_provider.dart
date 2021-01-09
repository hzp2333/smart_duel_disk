import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_url_launcher/wrapper_url_launcher_interface/lib/wrapper_url_launcher_interface.dart';
import 'package:url_launcher/url_launcher.dart';

@LazySingleton(as: UrlLauncherProvider)
class UrlLauncherProviderImpl implements UrlLauncherProvider {
  @override
  Future<void> launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url.';
    }
  }
}
