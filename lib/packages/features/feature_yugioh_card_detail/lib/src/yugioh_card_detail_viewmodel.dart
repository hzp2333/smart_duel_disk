import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';
import 'package:smart_duel_disk/packages/core/core_logger/lib/core_logger.dart';

@Injectable()
class YugiohCardDetailViewModel extends BaseViewModel {
  final YugiohCard _yugiohCard;
  final int _index;

  YugiohCardDetailViewModel(
    Logger logger,
    @factoryParam this._yugiohCard,
    @factoryParam this._index,
  ) : super(
          logger,
        );

  YugiohCard get yugiohCard => _yugiohCard;
  String get heroTag => '${_yugiohCard.id} - $_index';
}
