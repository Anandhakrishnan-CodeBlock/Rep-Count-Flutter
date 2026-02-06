import 'package:flutter/material.dart';
import 'package:rep_count/features/counter_profile/counter_profile_screen.dart';
import 'package:rep_count/features/timer_profile/timer_profile_screen.dart';
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
      case RoutePaths.counterProfileRoute:
        return MaterialPageRoute(
            builder: (_) =>  const CounterProfileScreen());
      case RoutePaths.timerProfileRoute:
        return MaterialPageRoute(
            builder: (_) =>  const TimerProfileScreen());
      default:
        return null;
    }
  }
}
