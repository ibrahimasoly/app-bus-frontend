import 'package:bustransport/UI/Pages/Datepage.dart';
import 'package:bustransport/UI/Pages/ListDesVoyagepage.dart';
import 'package:bustransport/UI/Pages/NbPassagerpage.dart';
import 'package:bustransport/UI/Widgets/DateVilleWidget.dart';
import 'package:bustransport/UI/Widgets/TextVilleWidget.dart';
import 'package:bustransport/VariableGlobal/Verification.dart';
import 'package:bustransport/bloc/ChangerVilleBloc.dart';
import 'package:bustransport/bloc/IncrementerBloc.dart';
import 'package:bustransport/bloc/ListDesVoyageBloc.dart';
import 'package:bustransport/bloc/RecuperationVilleBloc.dart';
import 'package:bustransport/bloc/UpdateNbPassagerDateBloc.dart';
import 'package:bustransport/bloc/recuperationDateBloc.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart'
    as get_transitions;
import 'package:intl/intl.dart';

import '../../bloc/RecuperationVilleBloc2.dart';
import '../Widgets/BottomNavBarWidget.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String ville1 = "";
    String ville2 = "";
    int passagernb = 1;
    DateTime date = DateTime.now();
    return Scaffold(
        bottomNavigationBar: const BottomNavBarWidget(),
        body: SingleChildScrollView(
          child: Container(
            color: const Color.fromARGB(171, 157, 131, 100),
            child: Column(
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/bus.jpg'), fit: BoxFit.cover),
                  ),
                  child: const Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'Vers ou?',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.blue),
                      )),
                ),
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20))),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                Get.to(() => const NbPassagerpage(),
                                    transition:
                                        get_transitions.Transition.downToUp);
                              },
                              icon: const Icon(Icons.person)),
                          BlocBuilder<IncrementerBloc, IncrementState>(
                            builder: (context, state) {
                              passagernb = state.index;
                              return Text(state.index.toString());
                            },
                          )
                        ],
                      ),
                      Stack(
                        children: [
                          Column(
                            children: [
                              BlocBuilder<RecuperationVilleBloc,
                                  RecuperationState>(
                                builder: (context, state) {
                                  if (state is RecuperationVille1State) {
                                    ville1 = state.ville;
                                    print(ville1);
                                    return TextVilleWidget(
                                      icon: Icons.my_location,
                                      text: ville1,
                                      fondWeight: FontWeight.bold,
                                      color: Colors.black,
                                      path: '/recherche',
                                    );
                                  } else if (state is ErreurState) {
                                    return Center(
                                      child: Text(state.errorMessage),
                                    );
                                  } else {
                                    return const TextVilleWidget(
                                      icon: Icons.my_location,
                                      text: "De: ville",
                                      fondWeight: FontWeight.normal,
                                      color: Colors.grey,
                                      path: '/recherche',
                                    );
                                  }
                                },
                              ),
                              BlocBuilder<RecuperationVilleBloc2,
                                  Recuperation2State>(
                                builder: (context, state) {
                                  if (state is RecuperationVille2State) {
                                    ville2 = state.ville;
                                    print(ville2);
                                    return TextVilleWidget(
                                      icon: Icons.location_on,
                                      text: ville2,
                                      fondWeight: FontWeight.bold,
                                      color: Colors.black,
                                      path: '/recherche2',
                                    );
                                  } else if (state is Erreur2State) {
                                    return Center(
                                      child: Text(state.errorMessage),
                                    );
                                  } else {
                                    return const TextVilleWidget(
                                      icon: Icons.location_on,
                                      text: "Vers: Ville",
                                      fondWeight: FontWeight.normal,
                                      color: Colors.grey,
                                      path: '/recherche2',
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      BlocBuilder<DateBloc, RecuperationDateSate>(
                        builder: (context, state) {
                          if (state is DateState) {
                            date = state.date;
                            print(date);
                            return Row(
                              children: [
                                DateVilleWidget(
                                  icon: Icons.calendar_today,
                                  fondWeight: FontWeight.bold,
                                  text: DateFormat.EEEE()
                                      .add_MMM()
                                      .add_d()
                                      .format(state.date),
                                  color: Colors.black,
                                ),
                              ],
                            );
                          } else if (state is ErreurDateState) {
                            return Center(
                              child: Text(state.errorMessage),
                            );
                          } else {
                            return const Row(
                              children: [
                                DateVilleWidget(
                                  icon: Icons.calendar_today,
                                  fondWeight: FontWeight.normal,
                                  text: 'Date de depart',
                                  color: Colors.grey,
                                ),
                              ],
                            );
                          }
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 10, left: 3, bottom: 10, top: 10),
                        child: Container(
                            height: 50,
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  if (ville1 != "" && ville2 != "") {
                                    Get.to(() => const ListDesVoyagepage(),
                                        transition: get_transitions
                                            .Transition.rightToLeft);
                                    context
                                        .read<UpdateNbPassagerDateBloc>()
                                        .add(UpdatNbPassagerEtDateEvent(
                                            lieuDepart: ville1,
                                            lieuArriver: ville2,
                                            nbpassager: passagernb,
                                            dateDepart: date));

                                    context.read<ListDesVoyageBloc>().add(
                                          ChercheListVoyageEvent(
                                            villeDepart: ville1,
                                            villeArriver: ville2,
                                          ),
                                        );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                child: const Text(
                                  'Recherche',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
