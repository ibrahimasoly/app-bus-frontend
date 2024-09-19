import 'package:bustransport/bloc/ChangerVilleBloc.dart';
import 'package:bustransport/bloc/IncrementerBloc.dart';
import 'package:bustransport/bloc/ListDesVoyageBloc.dart';
import 'package:bustransport/bloc/NavBarBottomBloc.dart';
import 'package:bustransport/bloc/RecuperationVilleBloc.dart';
import 'package:bustransport/bloc/UpdateNbPassagerDateBloc.dart';
import 'package:bustransport/bloc/VoyageByIdBloc.dart';
import 'package:bustransport/bloc/rechercheBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'UI/route/RootView.dart';
import 'bloc/IsLoadingBloc.dart';
import 'bloc/PasagerSaveBloc.dart';
import 'bloc/RadioButtonBloc.dart';
import 'bloc/RecuperationVilleBloc2.dart';
import 'bloc/recuperationDateBloc.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => VoyageBloc()),
      BlocProvider(create: (context) => RecuperationVilleBloc()),
      BlocProvider(create: (context) => RecuperationVilleBloc2()),
      BlocProvider(create: (context) => DateBloc()),
      BlocProvider(create: (context) => ListDesVoyageBloc()),
      BlocProvider(create: (context) => NavBarIndexBottomBloc()),
      BlocProvider(create: (context) => IncrementerBloc()),
      BlocProvider(create: (context) => UpdateNbPassagerDateBloc()),
      BlocProvider(create: (context) => ChangerVilleBloc()),
      BlocProvider(create: (context) => VoyageByIdBloc()),
      BlocProvider(create: (context) => PasagerSaveBloc()),
      BlocProvider(create: (context) => IsLoadingBloc()),
      BlocProvider(create: (context) => RadioButtonBloc()),
    ], child: const RootView());
  }
}
