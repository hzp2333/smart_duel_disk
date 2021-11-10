import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';

abstract class AreAllCardImagesCachedUseCase {
  Future<bool> call();
}

@LazySingleton(as: AreAllCardImagesCachedUseCase)
class AreAllCardImagesCachedUseCaseImpl implements AreAllCardImagesCachedUseCase {
  final DataManager _dataManager;

  AreAllCardImagesCachedUseCaseImpl(
    this._dataManager,
  );

  @override
  Future<bool> call() async {
    // Card image caching is currently not supported yet on web.
    if (kIsWeb) {
      return true;
    }

    final cards = await _dataManager.getSpeedDuelCards();
    final token = await _dataManager.getToken();
    final allCards = [...cards, token];

    for (final card in allCards) {
      final image = _dataManager.getCardImageFile(card);
      if (image == null) {
        return false;
      }
    }

    return true;
  }
}
