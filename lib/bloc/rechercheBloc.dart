import 'package:bloc/bloc.dart';

import '../models/Voyage.dart';
import '../services/VoyageService.dart';






abstract class VoyageEvent{}
class AffichVoyageEvent extends VoyageEvent{}
class Updatelist extends VoyageEvent{
  final String value;

  Updatelist({required this.value});
}
class Updatelist2 extends VoyageEvent{
  final String value;

  Updatelist2({required this.value});
}

abstract class VoyageState{}

class VoyageInitialState extends VoyageState{}
class VoyageSuccesState extends VoyageState{
  final List<Voyage> voyage;

  VoyageSuccesState({required this.voyage});
}
class VoyageLoadingState extends VoyageState{}
class VoyageErreurState extends VoyageState{
 final String errorMessage;

 VoyageErreurState({required this.errorMessage});
}


class VoyageBloc extends Bloc<VoyageEvent, VoyageState>{
  VoyageService voyageService = VoyageService();

  VoyageBloc(): super(VoyageInitialState()){
    on((AffichVoyageEvent event, emit) async {
      print("********Bloc Event processing");
      emit(VoyageLoadingState());
      try{
        List<Voyage> v = await voyageService.afficherAll();
        emit(VoyageSuccesState(voyage: v));
      }catch(e){
        emit(VoyageErreurState(errorMessage: e.toString()));
      }
    });
    on((Updatelist event, emit)async {

      print("********Bloc Event processing ********************");
      emit(VoyageLoadingState());
      try {
        List<Voyage>   v = await voyageService.afficherAll();
        List<Voyage> v1 = v
            .where((element) =>
            element.lieuDepart!.toLowerCase().contains(event.value.toLowerCase()))
            .toList();
        emit(VoyageSuccesState(voyage: v1));
      }catch(e){
        emit(VoyageErreurState(errorMessage: e.toString()));
      }
    });
    on((Updatelist2 event, emit)async {

      print("********Bloc Event processing ********************");
      emit(VoyageLoadingState());
      try {
        List<Voyage>   v = await voyageService.afficherAll();
        List<Voyage> v1 = v
            .where((element) =>
            element.lieuArriver!.toLowerCase().contains(event.value.toLowerCase()))
            .toList();
        emit(VoyageSuccesState(voyage: v1));
      }catch(e){
        emit(VoyageErreurState(errorMessage: e.toString()));
      }
    });
  }

}