import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';
import 'package:smart_duel_disk/packages/core/core_logger/lib/core_logger.dart';

@Injectable()
class HomeViewModel extends BaseViewModel {
  HomeViewModel(
    Logger logger,
  ) : super(
          logger,
        );
}
