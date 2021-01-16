import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/core_data_manager_interface/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/core/core_ygoprodeck/core_ygoprodeck_interface/lib/core_ygoprodeck_interface.dart';

@LazySingleton(as: YugiohCardsDataManager)
class YugiohCardsDataManagerImpl implements YugiohCardsDataManager {
  final YgoProDeckApiProvider _ygoProDeckApiProvider;

  YugiohCardsDataManagerImpl(
    this._ygoProDeckApiProvider,
  );

  @override
  Future<Iterable<YugiohCard>> getSpeedDuelCards({bool includeSkillCards = false}) async {
    final cards = await _ygoProDeckApiProvider.getSpeedDuelCards();
    return includeSkillCards ? cards : cards.where((card) => card.type != CardType.skillCard);
  }
}
