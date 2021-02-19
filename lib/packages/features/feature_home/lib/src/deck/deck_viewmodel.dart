import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/core_data_manager_interface/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';
import 'package:smart_duel_disk/packages/core/core_logger/core_logger_interface/lib/core_logger_interface.dart';
import 'package:smart_duel_disk/packages/core/core_navigation/lib/core_navigation.dart';

@Injectable()
class DeckViewModel extends BaseViewModel {
  final RouterHelper _routerHelper;

  DeckViewModel(
    Logger logger,
    this._routerHelper,
  ) : super(
          logger,
        );

  Future<void> onPreBuiltDeckPressed(PreBuiltDeck preBuiltDeck) {
    return _routerHelper.showDeckBuilder(preBuiltDeck: preBuiltDeck);
  }

  Future<void> onSearchCardPressed() {
    return _routerHelper.showDeckBuilder();
  }
}
