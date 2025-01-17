import 'package:bloc_test_example/bloc/counter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';

void main() {
  group("Testing Counter BloC", () {
    blocTest<CounterBloc, int>(
      "Inisialisasi Counter Bloc",
      build: () => CounterBloc(),
      expect: () => [],
    );
    blocTest<CounterBloc, int>(
      "Add Event",
      build: () => CounterBloc(),
      act: (bloc) async {
        bloc.add(Add(2));
      },
      expect: () => [2],
    );
    blocTest<CounterBloc, int>(
      "Subtract Event",
      build: () => CounterBloc(),
      act: (bloc) async {
        bloc.add(Subtract(2));
      },
      expect: () => [-2],
    );
    blocTest<CounterBloc, int>(
      "Add & Subtract Event",
      build: () => CounterBloc(),
      act: (bloc) async {
        bloc.add(Add(2));
        bloc.add(Subtract(5));
        bloc.add(DoingNoting());
        bloc.add(Add(10));
      },
      expect: () => [2, -3, 7],
    );
  });
}
