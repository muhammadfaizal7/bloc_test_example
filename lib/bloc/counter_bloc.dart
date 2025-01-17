import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterEvent>((event, emit) {
      if (event is Add) {
        emit(state + event.amount);
      } else if (event is Subtract) {
        emit(state - event.amount);
      } else if (event is DoingNoting) {}
    });
  }
}
