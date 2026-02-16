import 'package:flutter/material.dart';
import 'package:rep_count/features/counter/counter_workout_screen.dart';
import 'package:rep_count/features/counter/counter_profile_screen.dart';
import 'package:rep_count/features/timer/timer_workout_screen.dart';
import 'package:rep_count/features/timer/timer_profile_screen.dart';
import 'package:rep_count/navigation/bottom_navigation_widget.dart';
import 'package:rep_count/route/app_route_path_constants.dart';
import 'package:rep_count/utility/args/counter_workout_args.dart';
import 'package:rep_count/utility/args/timer_workout_args.dart';

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
      case RoutePaths.counterActionRoute:
        CounterWorkoutArgs counterArgs = args as CounterWorkoutArgs;
        return MaterialPageRoute(
            builder: (_) => CounterWorkoutScreen(
              args: counterArgs,
            ));
      case RoutePaths.timerActionRoute:
        TimerWorkoutArgs timerWorkoutArgs = args as TimerWorkoutArgs;
        return MaterialPageRoute(
            builder: (_) =>  TimerWorkoutScreen(
              args: timerWorkoutArgs,
            ));
      default:
        return null;
    }
  }
}
