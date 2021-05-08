import 'package:flutter/material.dart';

// ignore: avoid_classes_with_only_static_members
class AppElevations {
  static const newsCardElevation = 3.0;

  static final blackShadow = BoxShadow(
    color: Colors.black.withOpacity(0.5),
    blurRadius: 20.0,
    spreadRadius: 8,
    offset: const Offset(0, 4),
  );
}
