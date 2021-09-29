import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:universal_io/io.dart';

import 'di/file_manager_module.dart';

abstract class FileManager {
  File? getFile(String filePath);
  Future<void> downloadAndSaveFileIfNecessary(String urlPath, String filePath);
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
  Future<void> downloadAndSaveFileIfNecessary(String urlPath, String filePath) async {
    if (_isFileCached(filePath)) {
      return;
    }

    await _dio.download(urlPath, filePath);
  }

  bool _isFileCached(String filePath) {
    final file = File(filePath);
    return file.existsSync();
  }
}
