import 'package:bloc/bloc.dart';

import '../models/Voyage.dart';
import '../services/VoyageService.dart';

abstract class VoyageByIdEvent {}

class AfficheVoyageByIdEvent extends VoyageByIdEvent {
  final int id;

  AfficheVoyageByIdEvent({required this.id});
}

abstract class VoyageByIdState {}

class SuccesVoyageByIdState extends VoyageByIdState {
  final Voyage voyage;

  SuccesVoyageByIdState({required this.voyage});
}

class LoadingVoyageByIdState extends VoyageByIdState {}

class ErreurVoyageByIdState extends VoyageByIdState {
  final String message;

  ErreurVoyageByIdState({required this.message});
}

class InitialVoyageByIdState extends VoyageByIdState {}

class VoyageByIdBloc extends Bloc<VoyageByIdEvent, VoyageByIdState> {
  VoyageService voyageService = VoyageService();
  VoyageByIdBloc() : super(InitialVoyageByIdState()) {
    on((AfficheVoyageByIdEvent event, emit) async {
      print("*********** AfficheVoyageByIdEvent ********");
      emit(LoadingVoyageByIdState());
      await Future.delayed(const Duration(seconds: 3));
      try {
        Voyage voyage = await voyageService.voyageById(event.id);
        emit(SuccesVoyageByIdState(voyage: voyage));
      } catch (e) {
        emit(ErreurVoyageByIdState(message: e.toString()));
      }
    });
  }
}
