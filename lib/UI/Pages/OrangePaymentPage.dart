import 'package:bustransport/UI/Pages/InfoTicketPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart'
    as get_transitions;

import 'Ticketpage.dart';

class OrangePaymentPage extends StatelessWidget {
  const OrangePaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Form(
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {},
                    decoration: const InputDecoration(
                      labelText: 'Tel',
                      labelStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: const Text(
                                'Votre payment a ete effectuer avec succes'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Non'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.to(() => InfoTicketPage(),
                                      transition:
                                          get_transitions.Transition.fade);
                                },
                                child: Text('Consulter le ticket'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Text('payer'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
