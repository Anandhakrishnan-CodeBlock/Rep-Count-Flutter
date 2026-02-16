String formatDurationInHours(Duration d) {
  final h = d.inHours.toString().padLeft(2, '0');
  final m = d.inMinutes.remainder(60).toString().padLeft(2, '0');
  final s = d.inSeconds.remainder(60).toString().padLeft(2, '0');
  return "$h : $m : $s";
}

String formatDurationInMinutes(Duration d) {
  final m = d.inMinutes.remainder(60).toString().padLeft(2, '0');
  final s = d.inSeconds.remainder(60).toString().padLeft(2, '0');
  return "$m:$s";
}

String formatDurationInSeconds(Duration d) {
  final s = d.inSeconds.remainder(60).toString().padLeft(2, '0');
  return s;
}

List<TimerPhase> getPhaseList({required int totalSets}) {
  List<TimerPhase> phaseList = [];

  /// get total no of set and run loop
  for (int i = 0; i < totalSets; i++) {
    /// add phases = Start -> Ready -> Workout -> Break ->
    /// Start -> Ready -> Workout -> Break and so on
    phaseList.add(.start);
    phaseList.add(.ready);
    phaseList.add(.workout);
    phaseList.add(.relax);
  }
  /// Remove last (Break) and add Finish
  phaseList.removeAt(phaseList.length - 1);
  phaseList.add(.finished);
  return phaseList.reversed.toList();

  /// Sample need to be Ex: Start -> Ready -> Workout -> Break -> Ready -> Workout -> Finish
}

enum TimerPhase {
  start,
  ready,
  workout,
  relax,
  finished,
  pause,
  resume,
  reset,
}
