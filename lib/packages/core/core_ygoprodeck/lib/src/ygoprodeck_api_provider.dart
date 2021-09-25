import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_logger/lib/core_logger.dart';
import 'package:smart_duel_disk/packages/core/core_ygoprodeck/lib/core_ygoprodeck.dart';

import 'api/ygoprodeck_api.dart';

abstract class YgoProDeckApiProvider {
  Future<SpeedDuelCardModel> getSpeedDuelCard(int id);
  Future<Iterable<SpeedDuelCardModel>> getSpeedDuelCards();
}

@LazySingleton(as: YgoProDeckApiProvider)
class YgoProDeckApiProviderImpl implements YgoProDeckApiProvider {
  static const _tag = 'YgoProDeckApiProviderImpl';

  final YgoProDeckRestClient _restClient;
  final Logger _logger;

  YgoProDeckApiProviderImpl(
    this._restClient,
    this._logger,
  );

  @override
  Future<SpeedDuelCardModel> getSpeedDuelCard(int id) async {
    _logger.info(_tag, 'getSpeedDuelCard(id: $id)');

    final response = await _restClient.getSpeedDuelCard(id: id);
    return response.speedDuelCards.first;
  }

  @override
  Future<Iterable<SpeedDuelCardModel>> getSpeedDuelCards() async {
    _logger.info(_tag, 'getSpeedDuelCards()');

    final response = await _restClient.getSpeedDuelCards();
    return response.speedDuelCards;
  }
}
