import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:universal_io/io.dart';

abstract class FileManager {
  File? getFile(String filePath);
  Future<void> downloadAndSaveFile(String urlPath, String filePath);
}

@LazySingleton(as: FileManager)
class FileManagerImpl implements FileManager {
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
      // Dio is not used here because I couldn't find a way to detect when a download is incomplete,
      // which means that sometimes images were cut off or couldn't even be loaded at all.
      final uri = Uri.tryParse(urlPath);
      if (uri == null) {
        return;
      }

      final response = await http.get(uri);
      if (response.bodyBytes.lengthInBytes == 0) {
        return;
      }

      final file = File(filePath);
      await file.create(recursive: true);
      await file.writeAsBytes(response.bodyBytes);
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
