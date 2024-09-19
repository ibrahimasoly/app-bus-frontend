import 'package:bloc/bloc.dart';

abstract class NavBarBottomEvent {}

class NavIndexEvent extends NavBarBottomEvent {
  final int indexEvent;

  NavIndexEvent({required this.indexEvent});
}

abstract class NavBarBottomState {
  final int indexState;

  NavBarBottomState({required this.indexState});
}

class NavIndexState extends NavBarBottomState {
  NavIndexState({required super.indexState});
}

class NavIndexInitial extends NavBarBottomState {
  NavIndexInitial({required super.indexState});
}

class NavBarIndexBottomBloc extends Bloc<NavBarBottomEvent, NavBarBottomState> {
  NavBarIndexBottomBloc() : super(NavIndexInitial(indexState: 0)) {
    on((NavIndexEvent event, emit) {
      emit(NavIndexState(indexState: event.indexEvent));
    });
  }
}
