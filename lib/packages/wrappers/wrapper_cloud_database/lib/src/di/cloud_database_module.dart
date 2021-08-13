import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@module
abstract class CloudDatabaseModule {
  @LazySingleton()
  FirebaseFirestore provideFirebaseFirestore() => FirebaseFirestore.instance;
}
