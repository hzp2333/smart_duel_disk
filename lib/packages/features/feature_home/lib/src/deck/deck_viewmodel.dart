import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';
import 'package:smart_duel_disk/packages/core/core_logger/lib/core_logger.dart';
import 'package:smart_duel_disk/packages/core/core_messaging/lib/core_messaging.dart';
import 'package:smart_duel_disk/packages/core/core_navigation/lib/core_navigation.dart';
import 'package:smart_duel_disk/src/localization/strings.al.dart';

@Injectable()
class DeckViewModel extends BaseViewModel {
  final AppRouter _routerHelper;
  final SnackBarService _snackBarService;

  DeckViewModel(
    Logger logger,
    this._routerHelper,
    this._snackBarService,
  ) : super(
          logger,
        );

  Future<void> onPreBuiltDeckPressed(PreBuiltDeck preBuiltDeck) {
    return _routerHelper.showDeckBuilder(preBuiltDeck: preBuiltDeck);
  }

  Future<void> onSearchCardPressed() {
    return _routerHelper.showDeckBuilder();
  }

  void onBuildDeckPressed() {
    _snackBarService.showSnackBar(Strings.featureNotAvailableYetDescription.get('Creating a personal deck'));
  }
}
