import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';
import 'package:smart_duel_disk/packages/core/core_logger/lib/core_logger.dart';

@Injectable()
class YugiohCardDetailViewModel extends BaseViewModel {
  late final CardCopy? _cardCopy;
  late final String? _tag;

  YugiohCardDetailViewModel(
    @factoryParam this._cardCopy,
    @factoryParam this._tag,
    Logger logger,
  ) : super(logger);

  CardCopy get cardCopy => _cardCopy!;
  String get tag => _tag!;
}
