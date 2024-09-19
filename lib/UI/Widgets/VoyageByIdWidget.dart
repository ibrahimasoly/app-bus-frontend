import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../VariableGlobal/Verification.dart';
import '../../bloc/VoyageByIdBloc.dart';
import 'LoadingVoyageByIdWidget.dart';

class VoyageByIdWidget extends StatelessWidget {
  const VoyageByIdWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: UnderlineInputBorder(borderRadius: BorderRadius.circular(5)),
      child: BlocBuilder<VoyageByIdBloc, VoyageByIdState>(
        builder: (context, state) {
          if (state is LoadingVoyageByIdState) {
            return const LoadingVoyageByIdWidget();
          } else if (state is SuccesVoyageByIdState) {
            prix = state.voyage.bus.prix;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.task_alt, color: Colors.blueGrey),
                      Text("Voyage Information",
                          style: GoogleFonts.robotoCondensed(
                              color: Colors.blueGrey)),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(DateFormat.EEEE()
                          .add_MMM()
                          .add_d()
                          .format(state.voyage.dateDepart)),
                      Text(
                        "  ${DateFormat('HH:mm a z').format(state.voyage.heurDepart)} - ${DateFormat('HH:mm a z').format(state.voyage.heurArriver)}",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "${state.voyage.lieuDepart} > ",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Text(
                        state.voyage.lieuArriver,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else if (state is ErreurVoyageByIdState) {
            return Text(state.message);
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
