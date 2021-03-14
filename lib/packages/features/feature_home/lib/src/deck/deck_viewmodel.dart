import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/core_data_manager_interface/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';
import 'package:smart_duel_disk/packages/core/core_logger/core_logger_interface/lib/core_logger_interface.dart';
import 'package:smart_duel_disk/packages/core/core_messaging/core_messaging_interface/lib/src/snack_bar/snack_bar_service.dart';
import 'package:smart_duel_disk/packages/core/core_navigation/lib/core_navigation.dart';
import 'package:smart_duel_disk/src/localization/strings.al.dart';

@Injectable()
class DeckViewModel extends BaseViewModel {
  final RouterHelper _routerHelper;
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
