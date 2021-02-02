import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';
import 'package:smart_duel_disk/packages/core/core_logger/core_logger_interface/lib/core_logger_interface.dart';
import 'package:smart_duel_disk/packages/core/core_navigation/lib/core_navigation.dart';

@Injectable()
class DrawCardViewModel extends BaseViewModel {
  final RouterHelper _router;

  DrawCardViewModel(
    Logger logger,
    this._router,
  ) : super(
          logger,
        );

  Future<void> onCardDrawn() {
    return _router.closeScreen();
  }
}
