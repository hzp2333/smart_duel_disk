import 'package:file_picker/file_picker.dart';
import 'package:injectable/injectable.dart';

abstract class FilePickerProvider {
  Future<PlatformFile?> pickFile();
}

@LazySingleton(as: FilePickerProvider)
class FilePickerProviderImpl implements FilePickerProvider {
  final FilePicker _filePicker;

  FilePickerProviderImpl(
    this._filePicker,
  );

  @override
  Future<PlatformFile?> pickFile() async {
    final result = await _filePicker.pickFiles();
    final selectedFile = (result?.count ?? 0) == 0 ? null : result?.files.first;

    return selectedFile;
  }
}
