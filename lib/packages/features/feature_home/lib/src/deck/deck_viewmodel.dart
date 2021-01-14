import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/core_data_manager_interface/lib/core_data_manager_interface.dart';

@Injectable()
class DeckViewModel {
  final DataManager _dataManager;

  DeckViewModel(
    this._dataManager,
  ) {
    _dataManager.getSpeedDuelCards().then(print);
  }
}
