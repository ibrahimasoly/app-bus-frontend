import 'package:bloc/bloc.dart';

import '../VariableGlobal/Verification.dart';

enum LoadingButtonState {
  idle,
  loading,
}

// Événements du bouton
abstract class LoadingButtonEvent {}

class LoadingButtonPressed extends LoadingButtonEvent {}

// Bloc du bouton
class IsLoadingBloc extends Bloc<LoadingButtonEvent, LoadingButtonState> {
  IsLoadingBloc() : super(LoadingButtonState.idle) {
    on((event, emit) async {
      emit(LoadingButtonState.loading);
      await Future.delayed(Duration(seconds: 4));
      emit(LoadingButtonState.idle);
    });
  }
}
