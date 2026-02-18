import 'package:flutter/material.dart';
import 'package:rep_count/components/widget/profile_list_item_widget.dart';
import 'package:rep_count/constants/image_constants.dart';
import 'package:rep_count/route/app_route_path_constants.dart';
import 'package:rep_count/theme/fonts_weight.dart';
import 'package:rep_count/utility/args/timer_workout_args.dart';

class TimerScreen extends StatelessWidget {
  const TimerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            snap: false,
            floating: false,
            expandedHeight: 160.0,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                'Timer Workout'
              ),
              titlePadding: const EdgeInsets.only(left: 20, bottom: 20),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(14.0),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Exercises',
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                  ),
                  Text(
                    '6 Total',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          SliverList.builder(
            itemCount: 6,
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
        ],
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
