import 'package:flutter/material.dart';
import 'package:smart_duel_disk/src/app/app.dart';
import 'package:smart_duel_disk/src/di/di.dart';

Future<void> start() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initDependencies();

  runApp(SmartDuelDiskApp());
}
