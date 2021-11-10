import 'package:universal_io/io.dart';

/*
 * path_provider is not available for web. This stub is a workaround
 * that can be used until we have a way to cache card images
 * on the web.
 */

Future<Directory?> getApplicationDocumentsDirectory() async => null;

Future<Directory?> getTemporaryDirectory() async => null;
