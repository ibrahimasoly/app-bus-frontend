import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/PasagerSaveBloc.dart';

class PassagerDetailsWidget extends StatelessWidget {
  const PassagerDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            spreadRadius: 2,
            blurRadius: 2,
            color: Colors.grey.withOpacity(0.5),
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Details Du Passager",
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
          const Divider(
            height: 2,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocBuilder<PasagerSaveBloc, PasagerSaveState>(
              builder: (context, state) {
                if (state is LoadingSaveState) {
                  return const CircularProgressIndicator();
                } else if (state is SuccesSaveState) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${state.passager.prenom} ${state.passager.nom}",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blue,
                          ),
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.blueGrey[200],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              children: [
                                Icon(Icons.airplane_ticket),
                                Text("Votre ticket sera envoyer à:")
                              ],
                            ),
                            Text(state.passager.email)
                          ],
                        ),
                      )
                    ],
                  );
                } else if (state is ErrorSaveState) {
                  return Text(state.message.toString());
                } else {
                  return Container();
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
