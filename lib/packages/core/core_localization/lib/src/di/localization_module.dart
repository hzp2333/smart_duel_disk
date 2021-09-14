import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/generated/codegen_loader.g.dart';

@module
abstract class LocalizationModule {
  @LazySingleton()
  CodegenLoader get provideCodegenLoader => const CodegenLoader();
}
