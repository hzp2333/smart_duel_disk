import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@immutable
class HomeTab {
  final String title;
  final IconData icon;
  final PageRouteInfo page;

  const HomeTab({
    @required this.title,
    @required this.icon,
    @required this.page,
  });
}
