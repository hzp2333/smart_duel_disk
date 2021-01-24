import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/core_data_manager_interface/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/core/core_navigation/lib/core_navigation.dart';

@Injectable()
class DeckViewModel {
  final RouterHelper _routerHelper;

  DeckViewModel(
    this._routerHelper,
  );

  Future<void> onKaibaPreBuiltDeckPressed() {
    return _routerHelper.showDeckBuilder(preBuiltDeck: PreBuiltDeck.kaiba);
  }

  Future<void> onSearchCardPressed() {
    return _routerHelper.showDeckBuilder();
  }
}
