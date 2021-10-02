import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/core/core_file_manager/lib/src/file_manager.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_path_provider/lib/src/path_provider_wrapper.dart';
import 'package:universal_io/io.dart';

abstract class CardImageDataManager {
  Stream<int> cacheCardImages(Iterable<YugiohCard> cards);
  File? getCardImageFile(YugiohCard card);
}

@LazySingleton(as: CardImageDataManager)
class CardImageDataManagerImpl implements CardImageDataManager {
  final FileManager _fileManager;

  final String _cardImagesDirectory;

  CardImageDataManagerImpl(
    this._fileManager,
    PathProviderWrapper pathProvider,
  ) : _cardImagesDirectory = '${pathProvider.getApplicationDocumentsDirectory().path}/card_images';

  @override
  Stream<int> cacheCardImages(Iterable<YugiohCard> cards) async* {
    for (int i = 0; i < cards.length; i++) {
      yield i;

      final card = cards.elementAt(i);
      final filePath = _getCardImagePath(card);
      await _fileManager.downloadAndSaveFileIfNecessary(card.imageLargeUrl, filePath);
    }
  }

  @override
  File? getCardImageFile(YugiohCard card) {
    final filePath = _getCardImagePath(card);
    return _fileManager.getFile(filePath);
  }

  String _getCardImagePath(YugiohCard card) {
    return '$_cardImagesDirectory/${card.imageLargeUrl}';
  }
}
