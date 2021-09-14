import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:smart_duel_disk/packages/core/core_storage/lib/core_storage.dart';
import 'package:smart_duel_disk/packages/core/core_storage/lib/src/duel/duel_storage_provider.dart';

import '../../../../testing/mocks/shared.mocks.dart';

void main() {
  late DuelStorageProvider _storageProvider;

  late MockSharedPreferencesProvider _sharedPreferencesProvider;

  const _connectionInfoKey = 'connectionInfo';
  const _onlineDuelRoomKey = 'onlineDuelRoom';

  const _connectionInfoJson = '{"ipAddress":"192.168.0.106","port":"8080"}';
  const _connectionInfoModel = ConnectionInfoModel(
    ipAddress: '192.168.0.106',
    port: '8080',
  );

  setUp(() {
    _sharedPreferencesProvider = MockSharedPreferencesProvider();

    _storageProvider = DuelStorageProviderImpl(
      _sharedPreferencesProvider,
    );
  });

  group('When the connection info is fetched', () {
    test('and there is no connection info, then null is returned', () {
      when(_sharedPreferencesProvider.getString(_connectionInfoKey)).thenReturn(null);

      final result = _storageProvider.getConnectionInfo();

      expect(result, null);
    });

    test('and there is connection info, then a connection info model is returned', () {
      when(_sharedPreferencesProvider.getString(_connectionInfoKey)).thenReturn(_connectionInfoJson);

      final result = _storageProvider.getConnectionInfo();

      expect(result, _connectionInfoModel);
    });
  });

  test('When the connection info model is saved, then the connection info is stored', () async {
    when(_sharedPreferencesProvider.setString(_connectionInfoKey, _connectionInfoJson))
        .thenAnswer((_) => Future.value(true));

    await _storageProvider.saveConnectionInfo(_connectionInfoModel);

    verify(_sharedPreferencesProvider.setString(_connectionInfoKey, _connectionInfoJson)).called(1);
  });

  group('When a check is done to see if the online duel room should be used', () {
    test('then the value is returned', () {
      when(_sharedPreferencesProvider.getBool(_onlineDuelRoomKey, defaultValue: true)).thenReturn(true);

      final result = _storageProvider.useOnlineDuelRoom();

      expect(result, true);
    });
  });

  test('When whether the online duel room should be used or not is saved, then the value is stored', () async {
    when(_sharedPreferencesProvider.setBool(_onlineDuelRoomKey, value: true)).thenAnswer((_) => Future.value(true));

    await _storageProvider.saveUseOnlineDuelRoom(value: true);

    verify(_sharedPreferencesProvider.setBool(_onlineDuelRoomKey, value: true)).called(1);
  });
}
