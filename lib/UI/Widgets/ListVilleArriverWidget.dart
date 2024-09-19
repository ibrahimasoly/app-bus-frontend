import 'package:bustransport/VariableGlobal/Verification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart'
    as get_transitions;

import '../../bloc/RecuperationVilleBloc.dart';
import '../../bloc/RecuperationVilleBloc2.dart';
import '../../bloc/rechercheBloc.dart';
import '../Pages/Datepage.dart';
import '../Pages/Homepage.dart';

class ListVilleArriverWidget extends StatelessWidget {
  const ListVilleArriverWidget({Key? key}) : super(key: key);

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
                  if (uniqueItems.contains(state.voyage[index].lieuArriver)) {
                    return const SizedBox.shrink();
                  } else {
                    uniqueItems.add(state.voyage[index].lieuArriver);
                    return ListTile(
                      leading: const Icon(
                        Icons.history,
                        color: Colors.grey,
                      ),
                      title: Text(
                        state.voyage[index].lieuArriver,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      onTap: () {
                        if (verification2.isEmpty) {
                          Get.to(
                            () => const Datepage(),
                            transition: get_transitions.Transition.rightToLeft,
                            duration: const Duration(seconds: 1),
                          );
                          verification2 = state.voyage[index].lieuArriver;
                        } else {
                          Get.to(
                            () => const Homepage(),
                            transition: get_transitions.Transition.leftToRight,
                            duration: const Duration(seconds: 1),
                          );
                          verification2 = state.voyage[index].lieuArriver;
                        }
                        context.read<RecuperationVilleBloc2>().add(
                            RecuperationVille2Event(
                                ville: state.voyage[index].lieuArriver));
                      },
                    );
                  }
                },
                separatorBuilder: (context, index) {
                  return uniqueItems.contains(state.voyage[index].lieuArriver)
                      ? const SizedBox.shrink()
                      : const Divider(
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
