import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/wrappers/file_picker/file_picker.dart';
import 'package:universal_io/io.dart';

import '../core_file_manager.dart';

abstract class FileManager {
  Future<File?> getFile(String filePath);
  Future<File> pickYugiohDeck();
  Future<void> downloadAndSaveFile(String urlPath, String filePath);
}

@LazySingleton(as: FileManager)
class FileManagerImpl implements FileManager {
  static const _yugiohDeckExtension = 'ydk';

  final FilePickerProvider _filePicker;

  FileManagerImpl(
    this._filePicker,
  );

  @override
  Future<File?> getFile(String filePath) async {
    return await _isFileCached(filePath) ? File(filePath) : null;
  }

  @override
  Future<File> pickYugiohDeck() {
    return _pickFile([_yugiohDeckExtension]);
  }

  Future<File> _pickFile(Iterable<String> allowedExtensions) async {
    final platformFile = await _filePicker.pickFile();
    if (platformFile == null) {
      throw const NoFileSelectedException();
    }

    if (platformFile.extension == null || !allowedExtensions.contains(platformFile.extension)) {
      throw const InvalidExtensionException();
    }

    final file = await getFile(platformFile.path!);
    if (file == null) {
      throw const FileNotFoundException();
    }

    return file;
  }

  @override
  Future<void> downloadAndSaveFile(String urlPath, String filePath) async {
    if (await _isFileCached(filePath)) {
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
    final file = await getFile(filePath);
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

  Future<bool> _isFileCached(String filePath) {
    final file = File(filePath);
    return file.exists();
  }
}
