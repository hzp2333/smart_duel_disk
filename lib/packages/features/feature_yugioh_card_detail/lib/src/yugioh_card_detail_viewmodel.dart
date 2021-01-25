import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/core_data_manager_interface/lib/core_data_manager_interface.dart';

@Injectable()
class YugiohCardDetailViewModel {
  final YugiohCard _yugiohCard;
  final int _index;

  YugiohCardDetailViewModel(
    @factoryParam this._yugiohCard,
    @factoryParam this._index,
  );

  YugiohCard get yugiohCard => _yugiohCard;
  String get heroTag => '${_yugiohCard.id} - $_index';
}
