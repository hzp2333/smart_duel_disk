import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/core_data_manager_interface/lib/core_data_manager_interface.dart';

@Injectable()
class YugiohCardDetailViewModel {
  final YugiohCard _yugiohCard;

  YugiohCardDetailViewModel(
    this._yugiohCard,
  );

  YugiohCard get yugiohCard => _yugiohCard;
}
