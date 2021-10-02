import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';

abstract class CacheCardImagesUseCase {
  Future<Stream<String>> call();
}

@LazySingleton(as: CacheCardImagesUseCase)
class CacheCardImagesUseCaseImpl implements CacheCardImagesUseCase {
  final DataManager _dataManager;

  CacheCardImagesUseCaseImpl(
    this._dataManager,
  );

  @override
  Future<Stream<String>> call() async {
    final cards = await _dataManager.getSpeedDuelCards();
    final token = await _dataManager.getToken();

    final allCards = [...cards, token];
    final amountOfCards = allCards.length;

    return _dataManager.cacheCardImages(allCards).map((index) => '${index + 1} / $amountOfCards');
  }
}
