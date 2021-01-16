import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_navigation/lib/core_navigation.dart';

@Injectable()
class DeckViewModel {
  final RouterHelper _routerHelper;

  DeckViewModel(
    this._routerHelper,
  );

  Future<void> onSearchCardPressed() {
    return _routerHelper.showDeckBuilder();
  }
}
