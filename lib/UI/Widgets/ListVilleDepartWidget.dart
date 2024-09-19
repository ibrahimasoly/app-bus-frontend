import 'package:bustransport/bloc/RecuperationVilleBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart'
    as get_transitions;

import '../../bloc/rechercheBloc.dart';
import '../Pages/Homepage.dart';
import '../Pages/Recherche2page.dart';
import '../../VariableGlobal/Verification.dart';

class ListVilleDepartWidget extends StatelessWidget {
  const ListVilleDepartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VoyageBloc, VoyageState>(
      builder: (context, state) {
        if (state is VoyageLoadingState) {
          return const Center(
            heightFactor: 10,
            child: CircularProgressIndicator(),
          );
        } else if (state is VoyageErreurState) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else if (state is VoyageSuccesState) {
          Set<String> uniqueItems = {};
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListView.separated(
                itemBuilder: (context, index) {
                  if (uniqueItems.contains(state.voyage[index].lieuDepart)) {
                    return const SizedBox.shrink();
                  } else {
                    uniqueItems.add(state.voyage[index].lieuDepart);
                    return ListTile(
                      leading: const Icon(
                        Icons.history,
                        color: Colors.grey,
                      ),
                      title: Text(
                        state.voyage[index].lieuDepart,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      onTap: () {
                        if (verification.isEmpty) {
                          Get.to(
                            () => const Recherche2page(),
                            transition: get_transitions.Transition.rightToLeft,
                            duration: const Duration(seconds: 1),
                          );
                          verification = state.voyage[index].lieuDepart;
                        } else {
                          Get.to(
                            () => const Homepage(),
                            transition: get_transitions.Transition.leftToRight,
                            duration: const Duration(seconds: 1),
                          );
                          verification = state.voyage[index].lieuDepart;
                        }
                        context.read<RecuperationVilleBloc>().add(
                            RecuperationVille1Event(
                                ville: state.voyage[index].lieuDepart));
                        context.read<VoyageBloc>().add(AffichVoyageEvent());
                      },
                    );
                  }
                },
                separatorBuilder: (context, index) {
                  return uniqueItems.contains(state.voyage[index].lieuDepart)
                      ? SizedBox.shrink()
                      : Divider(
                          height: 2,
                        );
                },
                itemCount: state.voyage.length,
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
