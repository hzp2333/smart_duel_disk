import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/core/core_storage/lib/core_storage.dart';

import '../../../../testing/mocks/shared.mocks.dart';

void main() {
  late DuelDataManager _dataManager;

  late MockAppConfig _appConfig;
  late MockDuelStorageProvider _duelStorageProvider;

  const _onlineServerAddress = 'https://smart.duel.server';
  const _onlinePort = '443';
  const _onlineConnectionInfo = ConnectionInfo(ipAddress: _onlineServerAddress, port: _onlinePort);

  const _localIpAddress = '192.168.0.106';
  const _localPort = '8080';
  const _localConnectionInfo = ConnectionInfo(ipAddress: _localIpAddress, port: _localPort);
  const _localConnectionInfoModel = ConnectionInfoModel(ipAddress: _localIpAddress, port: _localPort);

  setUp(() {
    _appConfig = MockAppConfig();
    _duelStorageProvider = MockDuelStorageProvider();

    when(_appConfig.smartDuelServerAddress).thenReturn(_onlineServerAddress);
    when(_appConfig.smartDuelServerPort).thenReturn(_onlinePort);

    when(_duelStorageProvider.useOnlineDuelRoom()).thenReturn(true);

    _dataManager = DuelDataManagerImpl(
      _appConfig,
      _duelStorageProvider,
    );
  });

  group('When the connection info is fetched', () {
    group('and the online connection info should be used', () {
      test('then the online server address is fetched', () {
        when(_duelStorageProvider.useOnlineDuelRoom()).thenReturn(true);

        _dataManager.getConnectionInfo();

        verify(_appConfig.smartDuelServerAddress).called(1);
      });

      test('then the online port is fetched', () {
        when(_duelStorageProvider.useOnlineDuelRoom()).thenReturn(true);

        _dataManager.getConnectionInfo();

        verify(_appConfig.smartDuelServerPort).called(1);
      });

      test('then the online connection info is returned', () {
        when(_duelStorageProvider.useOnlineDuelRoom()).thenReturn(true);

        final result = _dataManager.getConnectionInfo();

        expect(result, _onlineConnectionInfo);
      });
    });

    group('and the local connection info should be used', () {
      test('then the local connection info is fetched', () {
        when(_duelStorageProvider.useOnlineDuelRoom()).thenReturn(false);
        when(_duelStorageProvider.getConnectionInfo()).thenReturn(null);

        _dataManager.getConnectionInfo();

        verify(_duelStorageProvider.getConnectionInfo()).called(1);
      });

      test('and there is no local connection info, then null is returned', () {
        when(_duelStorageProvider.useOnlineDuelRoom()).thenReturn(false);
        when(_duelStorageProvider.getConnectionInfo()).thenReturn(null);

        final result = _dataManager.getConnectionInfo();

        expect(result, null);
      });

      test('and there is local connection info, then it is returned', () {
        when(_duelStorageProvider.useOnlineDuelRoom()).thenReturn(false);
        when(_duelStorageProvider.getConnectionInfo()).thenReturn(_localConnectionInfoModel);

        final result = _dataManager.getConnectionInfo();

        expect(result, _localConnectionInfo);
      });
    });
  });

  test('When the connection info is saved, then it is stored', () async {
    await _dataManager.saveConnectionInfo(_localConnectionInfo);

    verify(_duelStorageProvider.saveConnectionInfo(_localConnectionInfoModel)).called(1);
  });

  group('When a check is done to see if the online duel room should be used', () {
    test('then the value from the storage is fetched', () {
      _dataManager.useOnlineDuelRoom();

      verify(_duelStorageProvider.useOnlineDuelRoom()).called(1);
    });

    test('then the value from the storage is returned', () {
      when(_duelStorageProvider.useOnlineDuelRoom()).thenReturn(true);

      final result = _dataManager.useOnlineDuelRoom();

      expect(result, true);
    });
  });

  test('When whether the online duel room should be used or not is saved, then the value is stored', () async {
    await _dataManager.saveUseOnlineDuelRoom(value: true);

    verify(_duelStorageProvider.saveUseOnlineDuelRoom(value: true)).called(1);
  });
}
