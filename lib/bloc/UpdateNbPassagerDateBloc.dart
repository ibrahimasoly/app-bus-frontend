import 'package:bloc/bloc.dart';

import '../services/VoyageService.dart';

abstract class NbPassagerDateEvent {}

class UpdatNbPassagerEtDateEvent extends NbPassagerDateEvent {
  final String lieuDepart;
  final String lieuArriver;
  final int nbpassager;
  final DateTime dateDepart;

  UpdatNbPassagerEtDateEvent(
      {required this.lieuDepart,
      required this.lieuArriver,
      required this.nbpassager,
      required this.dateDepart});
}

abstract class NbPassagerDateState {}

class UpdatNbPassagerEtDateState extends NbPassagerDateState {}

class InitialNbPassagerEtDateState extends NbPassagerDateState {}

class UpdateNbPassagerDateBloc
    extends Bloc<NbPassagerDateEvent, NbPassagerDateState> {
  VoyageService voyageService = VoyageService();
  UpdateNbPassagerDateBloc() : super(InitialNbPassagerEtDateState()) {
    on((UpdatNbPassagerEtDateEvent event, emit) {
      print("************* bonjour *********");
      voyageService.updateNbPassagerDate(event.lieuDepart, event.lieuArriver,
          event.nbpassager, event.dateDepart);
      emit(UpdatNbPassagerEtDateState());
    });
  }
}
