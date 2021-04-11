import 'package:flutter/material.dart';

abstract class SnackBarService {
  GlobalKey<ScaffoldMessengerState> get messengerKey;
  void showSnackBar(String message);
  void hideSnackBar();
}
