import 'package:flutter_bloc/flutter_bloc.dart';

abstract class IncrementEvent {}

class AdditionEvent extends IncrementEvent {}

class SoutractionEvent extends IncrementEvent {}

abstract class IncrementState {
  final int index;

  IncrementState({required this.index});
}

class SuccesIncremenState extends IncrementState {
  SuccesIncremenState({required super.index});
}

class InitialIncrementState extends IncrementState {
  InitialIncrementState({required super.index});
}

class IncrementerBloc extends Bloc<IncrementEvent, IncrementState> {
  int v = 1;
  IncrementerBloc() : super(InitialIncrementState(index: 1)) {
    on((AdditionEvent event, emit) {
      if (v < 10) {
        v = v + 1;
        print(v);
        emit(SuccesIncremenState(index: v));
      }
    });
    on((SoutractionEvent event, emit) {
      if (v > 1) {
        v = v - 1;
        print(v);
        emit(SuccesIncremenState(index: v));
      }
    });
  }
}
