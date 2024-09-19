import 'package:bustransport/UI/Pages/Homepage.dart';
import 'package:bustransport/bloc/IncrementerBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class NbPassagerpage extends StatelessWidget {
  const NbPassagerpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.arrow_back)),
                const SizedBox(width: 20),
                Text(
                  "Choisir le nombre de passager",
                  style: Theme.of(context).textTheme.bodyLarge,
                )
              ],
            ),
            const Divider(
              height: 2,
              color: Colors.black26,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Passager"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        child: IconButton(
                          onPressed: () {
                            context
                                .read<IncrementerBloc>()
                                .add(SoutractionEvent());
                          },
                          icon: const Icon(Icons.remove),
                        ),
                      ),
                      BlocBuilder<IncrementerBloc, IncrementState>(
                        builder: (context, state) {
                          return SizedBox(
                            width: 40,
                            child: Center(
                              child: Text(state.index.toString()),
                            ),
                          );
                        },
                      ),
                      CircleAvatar(
                        child: IconButton(
                          onPressed: () {
                            context
                                .read<IncrementerBloc>()
                                .add(AdditionEvent());
                          },
                          icon: const Icon(Icons.add),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 500,
            ),
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => const Homepage());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: const Text(
                  'Confirmer',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
