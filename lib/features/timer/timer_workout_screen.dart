import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rep_count/utility/args/timer_workout_args.dart';
import 'package:rep_count/utility/stack_stack.dart';
import 'package:rep_count/utility/utility_methods.dart';

class TimerWorkoutScreen extends StatefulWidget {
  final TimerWorkoutArgs args;
  const TimerWorkoutScreen({super.key, required this.args});
  @override
  State<StatefulWidget> createState() => TimerWorkoutState();
}

class TimerWorkoutState extends State<TimerWorkoutScreen> {

  bool _isRunning = false;
  bool _isPaused = false;

  int _currentSet = 0;

  Timer? _timer;
  late Duration _remaining;
  final PhaseStack _phaseStack = PhaseStack();

  @override
  void initState() {
    _remaining = Duration(seconds: 0);
    final phaseList = getPhaseList(totalSets: widget.args.totalSets);
    _phaseStack.pushList(phaseList: phaseList);
    //_phaseStack.printStack();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: .center,
        children: [
          Text(formatDurationInMinutes(_remaining), style: TextStyle(fontSize: 32)),
          Text('$_currentSet', style: TextStyle(fontSize: 32)),
          SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: startClicked, child: const Text("Start")),
              const SizedBox(width: 12),
              ElevatedButton(
                onPressed: togglePauseResume,
                child: Text(_isPaused ? "Resume" : "Pause"),
              ),
              const SizedBox(width: 12),
              ElevatedButton(onPressed: resetClicked, child: const Text("Reset")),
            ],
          ),
        ],
      ),
    );
  }

  void start() {
    _remaining = widget.args.startDuration;
    startTimer();
  }

  void ready() {
    _remaining = Duration(seconds: 2);
    startTimer();
  }
  void workout() {
    _currentSet = _currentSet + 1;
    _remaining = widget.args.workoutDuration;
    startTimer();
  }
  void relax() {
    _remaining = widget.args.relaxDuration;
    startTimer();
  }
  void finished() {
    resetClicked();
  }

  void nextPhase() {
    print('Current Phase: ${_phaseStack.top()}');
    switch (_phaseStack.top()) {
      case TimerPhase.start:
        ready();
        break;
      case TimerPhase.ready:
        ready();
        break;
      case TimerPhase.workout:
        workout();
        break;
      case TimerPhase.relax:
        relax();
        break;
      case TimerPhase.finished:
        finished();
        break;
      case TimerPhase.pause:
        return;
      case TimerPhase.resume:
        return;
      case TimerPhase.reset:
        return;
    }
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_remaining.inSeconds > 0) {
        setState(() {
          _remaining -= const Duration(seconds: 1);
        });
      } else {
        stopTimer();
        /// Remove top from stack
        _phaseStack.pop();
        /// Check next phase from stack
        nextPhase();
      }
    });
  }

  /// Button controls
  void startClicked() {
    if (_isRunning) return;
    _isRunning = true;
    _isPaused = false;
    _remaining = widget.args.startDuration;
    startTimer();
  }

  void togglePauseResume() {
    if (!_isRunning) return;

    if (_isPaused) {
      _isPaused = false;
      startTimer();
    } else {
      _isPaused = true;
      stopTimer();
    }
    setState(() {});
  }

  void resetClicked() {
    stopTimer();
    setState(() {
      _currentSet = 0;
      _isRunning = false;
      _isPaused = false;
      _remaining = Duration(seconds: 0);
    });
  }

  void stopTimer() {
    _timer?.cancel();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}