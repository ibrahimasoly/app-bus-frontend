import 'package:bloc/bloc.dart';

abstract class ChangerEvent {}

class ChangerVilleEvent extends ChangerEvent {}

abstract class ChangerState {}

class ChangerVilleState extends ChangerState {}

class InitialChangerVille extends ChangerState {}

class ChangerVilleBloc extends Bloc<ChangerEvent, ChangerState> {
  ChangerVilleBloc() : super(InitialChangerVille()) {
    on((ChangerVilleEvent event, emit) {
      emit(ChangerVilleState());
    });
  }
}
