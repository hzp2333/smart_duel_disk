import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_config/core_config_interface/lib/core_config_interface.dart';
import 'package:smart_duel_disk/packages/core/core_navigation/lib/core_navigation.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_url_launcher/wrapper_url_launcher_interface/lib/wrapper_url_launcher_interface.dart';

@LazySingleton(as: RouterHelper)
class RouterHelperImpl implements RouterHelper {
  final AppConfig _appConfig;
  final UrlLauncherProvider _urlLauncherProvider;

  RouterHelperImpl(
    this._appConfig,
    this._urlLauncherProvider,
  );

  //region News

  @override
  Future<void> showNewsDetails(String newsItemId, String newsItemAuthorId) async {
    try {
      final url = _appConfig.tweetUrl.replaceAll('{0}', newsItemAuthorId).replaceAll('{1}', newsItemId);
      await _urlLauncherProvider.launchUrl(url);
    } catch (exception) {
      debugPrint(exception.toString());
    }
  }

  //endregion

  //region Social Media

  @override
  Future<void> showYoutube() async {
    try {
      await _urlLauncherProvider.launchUrl(_appConfig.youtubeUrl);
    } catch (exception) {
      debugPrint(exception.toString());
    }
  }

  @override
  Future<void> showTwitter() async {
    try {
      await _urlLauncherProvider.launchUrl(_appConfig.twitterUrl);
    } catch (exception) {
      debugPrint(exception.toString());
    }
  }

  @override
  Future<void> showDiscord() async {
    try {
      await _urlLauncherProvider.launchUrl(_appConfig.discordUrl);
    } catch (exception) {
      debugPrint(exception.toString());
    }
  }

  //endregion
}
