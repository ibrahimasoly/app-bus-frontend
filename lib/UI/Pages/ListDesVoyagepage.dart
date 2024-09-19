import 'dart:async';

import 'package:bustransport/UI/Widgets/ListCardVoyageWidget.dart';
import 'package:bustransport/UI/Widgets/LoadingWidget.dart';
import 'package:bustransport/UI/Widgets/NavTopWidget.dart';
import 'package:bustransport/bloc/ListDesVoyageBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart'
    as get_transitions;
import 'package:intl/intl.dart';

import '../../VariableGlobal/Verification.dart';
import '../../bloc/VoyageByIdBloc.dart';
import '../Widgets/TrierWidget.dart';
import 'VoyageByIdpage.dart';

class ListDesVoyagepage extends StatelessWidget {
  const ListDesVoyagepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<ListDesVoyageBloc, ListDesVoyageState>(
          builder: (context, state) {
            if (state is LoadingListVoyageState) {
              return const LoadingWidget();
            } else if (state is SuccesListVoyageState) {
              ville1 = state.VoyageList[0].lieuDepart;
              ville2 = state.VoyageList[0].lieuArriver;
              datDepart = state.VoyageList[0].dateDepart;
              nbPassager = state.VoyageList[0].nbpassager;
              return Column(
                children: [
                  const NavTopWidget(),
                  const TrierWidget(),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.VoyageList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: ListCardVoyageWidget(
                            nom: state.VoyageList[index].bus.marque,
                            heurDpart: state.VoyageList[index].heurDepart,
                            heurArriver: state.VoyageList[index].heurArriver,
                            villeDepart: state.VoyageList[index].lieuDepart,
                            villeArriver: state.VoyageList[index].lieuArriver,
                            nbPassager: state.VoyageList[index].nbpassager,
                            prix: state.VoyageList[index].bus.prix *
                                state.VoyageList[index].nbpassager,
                            place: state.VoyageList[index].bus.capasite,
                          ),
                          onTap: () {
                            Get.to(() => VoyageByIdpage(),
                                transition:
                                    get_transitions.Transition.topLevel);
                            context.read<VoyageByIdBloc>().add(
                                AfficheVoyageByIdEvent(
                                    id: state.VoyageList[index].id));
                          },
                        );
                      },
                    ),
                  ),
                ],
              );
            } else if (state is ErreurListVoyageState) {
              return Text(state.message);
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
