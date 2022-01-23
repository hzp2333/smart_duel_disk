import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';
import 'package:smart_duel_disk/packages/core/core_logger/lib/src/logger.dart';

@Injectable()
class SignInViewModel extends BaseViewModel {
  static const _tag = 'SignInViewModel';

  SignInViewModel(
    Logger logger,
  ) : super(logger);
}
