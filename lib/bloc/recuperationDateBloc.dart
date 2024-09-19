import 'package:bloc/bloc.dart';

abstract class RecuperationDateEvent {}

class DateEvent extends RecuperationDateEvent {
  DateTime date;

  DateEvent({required this.date});
}

abstract class RecuperationDateSate {}

class DateState extends RecuperationDateSate {
  DateTime date;

  DateState({required this.date});
}

class ErreurDateState extends RecuperationDateSate {
  final String errorMessage;

  ErreurDateState({required this.errorMessage});
}

class InitialDateState extends RecuperationDateSate {
  final String ville;

  InitialDateState({required this.ville});
}

class DateBloc extends Bloc<RecuperationDateEvent, RecuperationDateSate> {
  DateBloc() : super(InitialDateState(ville: '')) {
    on((DateEvent event, emit) {
      emit(DateState(date: event.date));
    });
  }
}
