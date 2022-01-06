import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:universal_io/io.dart';

import 'di/file_manager_module.dart';

abstract class FileManager {
  File? getFile(String filePath);
  Future<void> downloadAndSaveFile(String urlPath, String filePath);
}

@LazySingleton(as: FileManager)
class FileManagerImpl implements FileManager {
  final Dio _dio;

  FileManagerImpl(
    @Named(fileManagerDioName) this._dio,
  );

  @override
  File? getFile(String filePath) {
    return _isFileCached(filePath) ? File(filePath) : null;
  }

  @override
  Future<void> downloadAndSaveFile(String urlPath, String filePath) async {
    if (_isFileCached(filePath)) {
      return;
    }

    try {
      await _dio.download(urlPath, filePath);
    } catch (e) {
      await _deleteFile(filePath);
    }
  }

  Future<void> _deleteFile(String filePath, {bool cancelOnFailure = false}) async {
    final file = getFile(filePath);
    if (file == null) {
      return;
    }

    try {
      await file.delete();
    } catch (e) {
      if (!cancelOnFailure) {
        await _deleteFile(filePath, cancelOnFailure: true);
      }
    }
  }

  bool _isFileCached(String filePath) {
    final file = File(filePath);
    return file.existsSync();
  }
}
