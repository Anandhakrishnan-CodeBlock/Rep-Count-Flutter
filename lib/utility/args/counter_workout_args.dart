class CounterWorkoutArgs {
  final Duration startDuration;
  final Duration relaxDuration;
  final int totalSets;
  final int repsPerSet;
  final Duration repCountDuration;

  CounterWorkoutArgs({
    required this.startDuration,
    required this.relaxDuration,
    required this.totalSets,
    required this.repsPerSet,
    required this.repCountDuration,
  });
}
