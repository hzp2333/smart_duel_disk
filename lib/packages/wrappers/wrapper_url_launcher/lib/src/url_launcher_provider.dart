import 'package:injectable/injectable.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class UrlLauncherProvider {
  Future<void> launchUrl(String url);
}

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
