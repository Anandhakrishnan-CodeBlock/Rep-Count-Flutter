import 'package:flutter/material.dart';
import 'package:rep_count/navigation/bottom_navigation_widget.dart';
import 'package:rep_count/route/app_route_path_constants.dart';

/// This file use to configure route configurations,
/// And set up corresponding screen to the ScreenClass file,

class AppRouteGenerator {
  static MaterialPageRoute? generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case RoutePaths.initialRoute:
        return MaterialPageRoute(
            builder: (_) =>  const BottomNavigationWidget());
      default:
        return null;
    }
  }
}
