import 'package:bloc/bloc.dart';

abstract class RadioButtonEvent {}

class RadioButtonChanged extends RadioButtonEvent {
  final String selectedValue;

  RadioButtonChanged(this.selectedValue);
}

abstract class RadioButtonState {
  final String selectedValue;

  RadioButtonState({required this.selectedValue});
}

class RadioButtonSucces extends RadioButtonState {
  RadioButtonSucces({required super.selectedValue});
}

class RadioButtonInitial extends RadioButtonState {
  RadioButtonInitial() : super(selectedValue: '');
}

class RadioButtonBloc extends Bloc<RadioButtonEvent, RadioButtonState> {
  RadioButtonBloc() : super(RadioButtonInitial()) {
    on((RadioButtonChanged event, emit) =>
        emit(RadioButtonSucces(selectedValue: event.selectedValue)));
  }
}
