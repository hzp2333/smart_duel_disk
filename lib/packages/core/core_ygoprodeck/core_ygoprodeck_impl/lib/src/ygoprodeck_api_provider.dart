import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/core_data_manager_interface/lib/src/yugioh_cards/entities/yugioh_card.dart';
import 'package:smart_duel_disk/packages/core/core_ygoprodeck/core_ygoprodeck_impl/lib/src/api/ygoprodeck_api.dart';
import 'package:smart_duel_disk/packages/core/core_ygoprodeck/core_ygoprodeck_interface/lib/core_ygoprodeck_interface.dart';

@LazySingleton(as: YgoProDeckApiProvider)
class YgoProDeckApiProviderImpl implements YgoProDeckApiProvider {
  final YgoProDeckRestClient _restClient;

  YgoProDeckApiProviderImpl(
    this._restClient,
  );

  @override
  Future<Iterable<YugiohCard>> getSpeedDuelCards() async {
    final response = await _restClient.getSpeedDuelCards();
    return response.speedDuelCards.map((card) => card.toEntity());
  }

  @override
  Future<YugiohCard> getToken() async {
    final response = await _restClient.getToken();
    return response.speedDuelCards.first.toEntity();
  }
}
