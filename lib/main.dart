import 'package:flutter/material.dart';
import 'package:rep_count/route/app_route_generator.dart';
import 'package:rep_count/route/app_route_path_constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rep Counter',

      //Setting default routing for splash screen
      // Initializing the routing
      initialRoute: RoutePaths.initialRoute,
      onGenerateRoute: AppRouteGenerator.generateRoute,
    );
  }
}
