import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';

import 'api/ygoprodeck_api.dart';
import 'extensions/speed_duel_card_model_extensions.dart';

abstract class YgoProDeckApiProvider {
  Future<Iterable<YugiohCard>> getSpeedDuelCards();
  Future<YugiohCard> getToken();
}

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
