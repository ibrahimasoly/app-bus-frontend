import 'package:bustransport/bloc/IsLoadingBloc.dart';
import 'package:bustransport/bloc/VoyageByIdBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart'
    as get_transitions;
import 'package:intl/intl.dart';

import '../../VariableGlobal/Verification.dart';
import '../Widgets/NavTopWidget.dart';
import '../Widgets/VoyageByIdWidget.dart';
import 'Passagerpage.dart';

class VoyageByIdpage extends StatelessWidget {
  const VoyageByIdpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BlocBuilder<VoyageByIdBloc, VoyageByIdState>(
        builder: (context, state) {
          if (state is LoadingVoyageByIdState) {
            return const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text("Chargement..."),
            );
          } else if (state is SuccesVoyageByIdState) {
            prix = state.voyage.bus.prix;
            return Container(
              padding: const EdgeInsets.all(15),
              height: 80,
              color: Colors.white,
              child: BlocBuilder<IsLoadingBloc, LoadingButtonState>(
                builder: (context, state1) {
                  return SizedBox(
                    height: 30,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      onPressed: state1 == LoadingButtonState.loading
                          ? null
                          : () async {
                              context
                                  .read<IsLoadingBloc>()
                                  .add(LoadingButtonPressed());
                              await Future.delayed(const Duration(seconds: 3));
                              Get.to(() => Passagerpage(),
                                  transition: get_transitions.Transition.zoom);
                            },
                      child: state1 == LoadingButtonState.loading
                          ? const CircularProgressIndicator()
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Accéder aux détails des passagers",
                                    textAlign: TextAlign.start),
                                Text("${state.voyage.bus.prix} FCFA")
                              ],
                            ),
                    ),
                  );
                },
              ),
            );
          } else if (state is ErreurVoyageByIdState) {
            return Text(state.message);
          } else {
            return Container();
          }
        },
      ),
      body: const SafeArea(
        child: Column(
          children: [
            NavTopWidget(),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VoyageByIdWidget(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
