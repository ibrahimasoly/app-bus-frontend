import 'package:bloc/bloc.dart';
import 'package:bustransport/models/Passager.dart';
import 'package:bustransport/services/PassagerService.dart';

abstract class PasagerSaveEvent {}

class SaveEvent extends PasagerSaveEvent {
  final Passager passager;
  SaveEvent({required this.passager});
}

abstract class PasagerSaveState {}

class SuccesSaveState extends PasagerSaveState {
  final Passager passager;
  SuccesSaveState({required this.passager});
}

class LoadingSaveState extends PasagerSaveState {}

class ErrorSaveState extends PasagerSaveState {
  String message;
  ErrorSaveState({required this.message});
}

class InitialSaveState extends PasagerSaveState {}

class PasagerSaveBloc extends Bloc<PasagerSaveEvent, PasagerSaveState> {
  PassagerService passagerService = PassagerService();
  PasagerSaveBloc() : super(InitialSaveState()) {
    on((SaveEvent event, emit) async {
      print("************ passagerEvent ***********");
      emit(LoadingSaveState());
      try {
        Passager passager = await passagerService.save(event.passager);
        emit(SuccesSaveState(passager: passager));
      } catch (e) {
        emit(ErrorSaveState(message: e.toString()));
      }
    });
  }
}
