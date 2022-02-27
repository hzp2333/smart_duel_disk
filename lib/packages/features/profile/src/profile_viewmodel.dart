import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/generated/locale_keys.g.dart';
import 'package:smart_duel_disk/packages/core/authentication/authentication.dart';
import 'package:smart_duel_disk/packages/core/core_config/lib/core_config.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';
import 'package:smart_duel_disk/packages/core/core_localization/lib/core_localization.dart';
import 'package:smart_duel_disk/packages/core/core_logger/lib/src/logger.dart';
import 'package:smart_duel_disk/packages/core/core_messaging/lib/core_messaging.dart';

@Injectable()
class ProfileViewModel extends BaseViewModel {
  static const _tag = 'ProfileViewModel';

  static const _debounceDuration = Duration(milliseconds: 500);

  final AuthenticationService _authService;
  final SnackBarService _snackBarService;
  final StringProvider _stringProvider;
  final DelayProvider _delayProvider;

  Stream<String?> get username => _authService.authState.map((user) => user?.displayName);

  Timer? _debounceTimer;

  ProfileViewModel(
    Logger logger,
    this._authService,
    this._snackBarService,
    this._stringProvider,
    this._delayProvider,
  ) : super(logger);

  Future<void> onUsernameSubmitted(String? username) async {
    if ((_debounceTimer?.isActive ?? false) || (username == _authService.getUser().displayName)) {
      return;
    }

    logger.info(_tag, 'onUsernameSubmitted(username: $username)');

    _debounceTimer = _delayProvider.timer(_debounceDuration, () {});

    if (username == null || username.isEmpty) {
      _snackBarService.showSnackBar(_stringProvider.getString(LocaleKeys.profile_form_no_username));
      return;
    }

    if (username.length < 3 || username.length > 12) {
      _snackBarService.showSnackBar(_stringProvider.getString(LocaleKeys.profile_form_invalid_username));
      return;
    }

    try {
      await _authService.updateUsername(username);

      _snackBarService.showSnackBar(_stringProvider.getString(LocaleKeys.profile_update_username_success));
    } catch (e, stackTrace) {
      logger.error(_tag, 'onUsernameSubmitted(username: $username)', e, stackTrace);

      _snackBarService.showSnackBar(_stringProvider.getString(LocaleKeys.profile_update_username_failure));
    }
  }

  @override
  void dispose() {
    logger.info(_tag, 'dispose()');

    super.dispose();
  }
}
