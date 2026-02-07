import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rep_count/utility/utility_methods.dart';

class CountdownWithProgress extends StatefulWidget {
  final Duration startDuration;
  final Duration workDuration;
  final Duration breakDuration;
  final int totalSets;

  const CountdownWithProgress({
    super.key,
    required this.startDuration,
    required this.workDuration,
    required this.breakDuration,
    required this.totalSets,
  });

  @override
  State<CountdownWithProgress> createState() => _CountdownWithProgressState();
}

class _CountdownWithProgressState extends State<CountdownWithProgress>
    with TickerProviderStateMixin {
  late AnimationController _progressController;

  Timer? _timer;

  TimerPhase phase = TimerPhase.starting;
  late Duration _remaining;

  int currentSet = 1;
  bool isRunning = false;
  bool isPaused = false;

  Duration get _currentDuration {
    switch (phase) {
      case TimerPhase.starting:
        return widget.startDuration;
      case TimerPhase.workout:
        return widget.workDuration;
      case TimerPhase.breakTime:
        return widget.breakDuration;
      default:
        return Duration.zero;
    }
  }

  @override
  void initState() {
    super.initState();

    _remaining = widget.startDuration;

    _progressController = AnimationController(vsync: this)
      ..addListener(() => setState(() {}));
  }

  // ---------------- PUBLIC CONTROLS ----------------

  void start() {
    if (isRunning) return;
    isRunning = true;
    isPaused = false;
    phase = TimerPhase.starting;
    _remaining = widget.startDuration;
    _runPhase();
  }

  void togglePauseResume() {
    if (!isRunning) return;

    if (isPaused) {
      isPaused = false;
      _runPhase(resume: true);
    } else {
      isPaused = true;
      _timer?.cancel();
      _progressController.stop();
    }
    setState(() {});
  }

  void reset() {
    _timer?.cancel();
    _progressController.reset();

    setState(() {
      phase = TimerPhase.starting;
      currentSet = 1;
      isRunning = false;
      isPaused = false;
      _remaining = widget.startDuration;
    });
  }

  // ---------------- CORE ENGINE ----------------

  void _runPhase({bool resume = false}) {
    _timer?.cancel();

    _progressController
      ..duration = _currentDuration
      ..forward(from: resume ? _progressController.value : 0);


    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_remaining.inSeconds > 0) {
        setState(() => _remaining -= const Duration(seconds: 1));
      } else {
        _timer?.cancel();
        _nextPhase();
      }
    });
  }

  void _nextPhase() {
    switch (phase) {
      case TimerPhase.starting:
        phase = TimerPhase.ready;
        _remaining = const Duration(seconds: 1);
        _runPhase();
        break;

      case TimerPhase.ready:
        phase = TimerPhase.workout;
        _remaining = widget.workDuration;
        _runPhase();
        break;

      case TimerPhase.workout:
        if (currentSet < widget.totalSets) {
          phase = TimerPhase.breakTime;
          _remaining = widget.breakDuration;
        } else {
          phase = TimerPhase.finished;
          _remaining = const Duration(seconds: 2);
        }
        _runPhase();
        break;

      case TimerPhase.breakTime:
        currentSet++;
        phase = TimerPhase.workout;
        _remaining = widget.workDuration;
        _runPhase();
        break;

      case TimerPhase.finished:
        reset(); // 🔥 Auto reset to starting state
        break;
    }
  }

  // ---------------- UI HELPERS ----------------

  String formatDuration(Duration d) {
    final m = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final s = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return "$m:$s";
  }

  String phaseText() {
    switch (phase) {
      case TimerPhase.starting:
        return "LET START";
      case TimerPhase.ready:
        return "READY";
      case TimerPhase.workout:
        return "SET $currentSet / ${widget.totalSets}";
      case TimerPhase.breakTime:
        return "BREAK";
      case TimerPhase.finished:
        return "CONGRATULATIONS!";
    }
  }

  // ---------------- UI ----------------

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          phaseText(),
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: phase == TimerPhase.breakTime
                ? Colors.black
                : Theme.of(context).primaryColor,
          ),
        ),

        const SizedBox(height: 20),

        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: 280,
              width: 280,
              child: CircularProgressIndicator(
                strokeWidth: 12,
                value: phase == TimerPhase.finished
                    ? 1
                    : 1 - _progressController.value,
              ),
            ),
            Text(
              formatDuration(_remaining),
              style: const TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

        const SizedBox(height: 30),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: start, child: const Text("Start")),
            const SizedBox(width: 12),
            ElevatedButton(
              onPressed: togglePauseResume,
              child: Text(isPaused ? "Resume" : "Pause"),
            ),
            const SizedBox(width: 12),
            ElevatedButton(onPressed: reset, child: const Text("Reset")),
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _progressController.dispose();
    super.dispose();
  }
}

enum TimerPhase {
  starting,
  ready,
  workout,
  breakTime,
  finished,
}