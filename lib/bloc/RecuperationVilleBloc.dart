import 'package:flutter_bloc/flutter_bloc.dart';

abstract class RecuperationEvent{}
class RecuperationVille1Event extends RecuperationEvent{
  final String ville;

  RecuperationVille1Event({required this.ville});
}


abstract class RecuperationState{}
class RecuperationVille1State extends RecuperationState{
  final String ville;

  RecuperationVille1State({required this.ville});
}

class ErreurState extends RecuperationState{
  final String errorMessage;

  ErreurState({required this.errorMessage});
}
class RecuperationInitialState extends RecuperationState{
  final String ville;

  RecuperationInitialState({required this.ville});
}

class RecuperationVilleBloc extends Bloc<RecuperationEvent, RecuperationState>{
  RecuperationVilleBloc(): super(RecuperationInitialState(ville: "ville")){
   on((RecuperationVille1Event event, emit) {
    try {
       emit(RecuperationVille1State(ville: event.ville));
     }catch(e){
      emit(ErreurState(errorMessage: e.toString()));
    }
   });
  }

}