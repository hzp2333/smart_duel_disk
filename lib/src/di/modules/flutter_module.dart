import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

@module
abstract class FlutterModule {
  @LazySingleton()
  AssetBundle get provideAssetBundle => rootBundle;
}
