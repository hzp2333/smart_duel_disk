import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';
import 'package:smart_duel_disk/packages/core/core_logger/core_logger_interface/lib/src/logger.dart';
import 'package:smart_duel_disk/packages/core/core_navigation/lib/core_navigation.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_assets/wrapper_assets_interface/lib/wrapper_assets_interface.dart';

@Injectable()
class PrivacyPolicyViewModel extends BaseViewModel {
  static const _tag = 'PrivacyPolicyViewModel';

  final AssetsProvider _assetsProvider;
  final AssetBundle _assetBundle;
  final RouterHelper _router;

  PrivacyPolicyViewModel(
    this._assetsProvider,
    this._assetBundle,
    this._router,
    Logger logger,
  ) : super(logger);

  Future<String> getContent() {
    logger.info(_tag, 'getContent()');

    return _assetBundle.loadString(_assetsProvider.privacyPolicy);
  }

  void onUrlPressed(String url) {
    logger.info(_tag, 'onUrlPressed($url)');

    _router.launchUrl(url);
  }
}
