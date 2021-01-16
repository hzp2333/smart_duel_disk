import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_navigation/lib/core_navigation.dart';

@Injectable()
class DrawCardViewModel {
  final RouterHelper _router;

  DrawCardViewModel(
    this._router,
  );

  Future<void> onCardDrawn() {
    return _router.closeScreen();
  }
}
