import 'package:flutter/material.dart';
import 'package:rep_count/components/widget/profile_list_item_widget.dart';
import 'package:rep_count/route/app_route_path_constants.dart';
import 'package:rep_count/utility/args/timer_workout_args.dart';

class TimerScreen extends StatelessWidget {
  const TimerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Timer")),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: 15,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: ProfileListItemWidget(),
            onTap: () {
              Navigator.of(context).pushNamed(
                RoutePaths.timerActionRoute,
                arguments: TimerWorkoutArgs(
                  totalSets: 3,
                  startDuration: Duration(seconds: 8),
                  relaxDuration: Duration(seconds: 10),
                  workoutDuration: Duration(seconds: 30),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(RoutePaths.timerProfileRoute);
        },
        tooltip: 'Add',
        child: const Icon(Icons.add),
      ),
    );
  }
}