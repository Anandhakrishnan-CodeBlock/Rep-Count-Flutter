import 'package:rep_count/utility/utility_methods.dart';

class PhaseStack {

  final List<TimerPhase> _stack = [];

  // ───────────────── Stack Operations ─────────────────

  void push(TimerPhase timerPhase) {
    _stack.add(timerPhase);
  }

  void pop() {
    if (isEmpty) {
      throw StateError('Cannot pop from an empty stack.');
    }
    _stack.removeLast();
  }

  TimerPhase top() {
    if (isEmpty) {
      throw StateError('Cannot get top from an empty stack.');
    }
    return _stack[stackSize - 1];
  }

  void pushList({required List<TimerPhase> phaseList}){
    for (int i = 0; i < phaseList.length; i++) {
      _stack.add(phaseList[i]);
    }
  }

  // ───────────────── Helpers ─────────────────

  bool get isEmpty => _stack.isEmpty;
  bool get isNotEmpty => _stack.isNotEmpty;
  int get stackSize => _stack.length;

  // ───────────────── Debug / Print ─────────────────

  void printStack() {
    for (int i = 0; i < _stack.length; i++) {
      print("$i -> ${_stack[i]}");
    }
  }

  @override
  String toString() => _stack.toString();
}