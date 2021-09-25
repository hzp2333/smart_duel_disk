import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_storage/lib/core_storage.dart';

@module
abstract class StorageModule {
  @preResolve
  @LazySingleton()
  Future<Box<DbYugiohCard>> provideYugiohCardBox() => Hive.openBox<DbYugiohCard>('DbYugiohCard');
}
