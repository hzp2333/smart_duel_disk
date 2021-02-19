import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';
import 'package:smart_duel_disk/packages/core/core_logger/core_logger_interface/lib/src/logger.dart';

@Injectable()
class HomeViewModel extends BaseViewModel {
  HomeViewModel(
    Logger logger,
  ) : super(
          logger,
        );
}
