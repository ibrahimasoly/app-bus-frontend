import 'package:bloc/bloc.dart';

abstract class Recuperation2Event{}
class RecuperationVille2Event extends Recuperation2Event{
  final String ville;

  RecuperationVille2Event({required this.ville});
}

abstract class Recuperation2State{}
class RecuperationVille2State extends Recuperation2State{
  final String ville;

  RecuperationVille2State({required this.ville});
}
class Erreur2State extends Recuperation2State{
  final String errorMessage;

  Erreur2State({required this.errorMessage});
}
class RecuperationInitialState extends Recuperation2State{
  final String ville;

  RecuperationInitialState({required this.ville});
}


class RecuperationVilleBloc2 extends Bloc<Recuperation2Event, Recuperation2State>{
  RecuperationVilleBloc2(): super(RecuperationInitialState(ville: "ville")){
    on((RecuperationVille2Event event, emit) {
      try {
        emit(RecuperationVille2State(ville: event.ville));
      }catch(e){
        emit(Erreur2State(errorMessage: e.toString()));
      }
    });
  }

}