import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/generated/assets.gen.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';
import 'package:smart_duel_disk/packages/core/core_logger/lib/core_logger.dart';
import 'package:smart_duel_disk/packages/core/core_navigation/lib/core_navigation.dart';

@Injectable()
class PrivacyPolicyViewModel extends BaseViewModel {
  static const _tag = 'PrivacyPolicyViewModel';

  final AssetBundle _assetBundle;
  final AppRouter _router;

  PrivacyPolicyViewModel(
    this._assetBundle,
    this._router,
    Logger logger,
  ) : super(logger);

  Future<String> getContent() {
    logger.info(_tag, 'getContent()');

    return _assetBundle.loadString(Assets.html.privacyPolicy);
  }

  Future<bool> onUrlPressed(String url) async {
    logger.info(_tag, 'onUrlPressed($url)');

    try {
      await _router.launchUrl(url);
      return true;
    } catch (e) {
      return false;
    }
  }
}
