import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';
import 'package:smart_duel_disk/packages/core/core_navigation/lib/core_navigation.dart';

@Injectable()
class DrawCardViewModel extends BaseViewModel {
  final RouterHelper _router;

  DrawCardViewModel(
    this._router,
  );

  Future<void> onCardDrawn() {
    return _router.closeScreen();
  }
}
