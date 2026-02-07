import 'package:flutter/material.dart';
import 'package:rep_count/components/widget/countdown_with_progress_widget.dart';

class TimerActionScreen extends StatefulWidget {
  const TimerActionScreen({super.key});
  @override
  State<StatefulWidget> createState() => TimerActionState();
}

class TimerActionState extends State<TimerActionScreen> {

  final totalSets = 3;
  final startDuration = Duration(seconds: 6);
  final workDuration = Duration(seconds: 30);
  final breakDuration = Duration(seconds: 10);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: .center,
        children: [
          CountdownWithProgress(
            startDuration: startDuration,
            workDuration: workDuration,
            breakDuration: breakDuration,
            totalSets: totalSets,
          )
        ],
      ),
    );
  }
}