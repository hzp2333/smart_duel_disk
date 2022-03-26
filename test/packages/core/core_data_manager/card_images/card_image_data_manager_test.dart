import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/src/card_images/card_image_data_manager.dart';
import 'package:universal_io/io.dart';

import '../../../../testing/mocks/shared.mocks.dart';

void main() {
  late CardImageDataManager _dataManager;

  late MockFileManager _fileManager;
  late MockDirectory _directory;

  const _appDocDirectory = 'appDocDirectory';
  const _largeImageUrl = 'https://www.card-image123.jpg';

  const _card = YugiohCard(
    id: 123,
    description: 'desc',
    imageLargeUrl: _largeImageUrl,
    imageSmallUrl: 'small',
    name: 'name',
    race: CardRace.andrew,
    type: CardType.effectMonster,
  );

  setUp(() {
    _fileManager = MockFileManager();
    _directory = MockDirectory();

    when(_directory.path).thenReturn(_appDocDirectory);

    _dataManager = CardImageDataManagerImpl(
      _fileManager,
      _directory,
    );
  });

  group('When getCardImageFile is called', () {
    const filePath = '$_appDocDirectory/card_images/$_largeImageUrl';
    final file = File(filePath);

    setUp(() {
      when(_fileManager.getFile(filePath)).thenAnswer((_) => Future.value(file));
    });

    test('then the image file is fetched from the file manager', () {
      _dataManager.getCardImageFile(_card);

      verify(_fileManager.getFile(filePath)).called(1);
    });

    test('then the image file is returned', () async {
      final result = await _dataManager.getCardImageFile(_card);

      expect(result, file);
    });
  });
}
