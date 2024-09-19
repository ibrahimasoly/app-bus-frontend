import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bustransport/services/VoyageService.dart';

import '../models/Voyage.dart';

abstract class ListDesVoyageEvent {}

class ChercheListVoyageEvent extends ListDesVoyageEvent {
  final String villeDepart;
  final String villeArriver;

  ChercheListVoyageEvent(
      {required this.villeDepart, required this.villeArriver});
}

abstract class ListDesVoyageState {}

class InitialeListvoyageState extends ListDesVoyageState {}

class SuccesListVoyageState extends ListDesVoyageState {
  final List<Voyage> VoyageList;

  SuccesListVoyageState({required this.VoyageList});
}

class LoadingListVoyageState extends ListDesVoyageState {}

class LoadingListVoyageState2 extends ListDesVoyageState {}

class ErreurListVoyageState extends ListDesVoyageState {
  final String message;

  ErreurListVoyageState({required this.message});
}

class ListDesVoyageBloc extends Bloc<ListDesVoyageEvent, ListDesVoyageState> {
  VoyageService voyageService = VoyageService();
  ListDesVoyageBloc() : super(InitialeListvoyageState()) {
    on((ChercheListVoyageEvent event, emit) async {
      print("******* Liste Event *****");
      emit(LoadingListVoyageState());
      await Future.delayed(const Duration(seconds: 3), () {});
      try {
        List<Voyage> v = await voyageService.listVoyage(
            event.villeDepart, event.villeArriver);
        emit(SuccesListVoyageState(VoyageList: v));
      } catch (e) {
        emit(ErreurListVoyageState(message: e.toString()));
      }
    });
  }
}
