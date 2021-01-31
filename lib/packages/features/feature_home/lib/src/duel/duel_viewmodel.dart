import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';
import 'package:smart_duel_disk/packages/core/core_navigation/lib/core_navigation.dart';

@Injectable()
class DuelViewModel extends BaseViewModel {
  final RouterHelper _router;

  DuelViewModel(
    this._router,
  );

  Future<void> onDrawCardDemoPressed() {
    return _router.showDrawCard();
  }

  Future<void> onSpeedDuelDemoPressed() async {
    return _router.showSpeedDuel();
  }
}
