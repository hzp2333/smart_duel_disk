import 'package:file_picker/file_picker.dart';
import 'package:injectable/injectable.dart';

@module
abstract class FilePickerModule {
  @LazySingleton()
  FilePicker provideFilePicker() => FilePicker.platform;
}
