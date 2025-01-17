part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent {
  const CounterEvent();
}

class Add extends CounterEvent {
  final int amount;
  const Add(this.amount);
}

class Subtract extends CounterEvent {
  final int amount;
  const Subtract(this.amount);
}

class DoingNoting extends CounterEvent {
  const DoingNoting();
}
