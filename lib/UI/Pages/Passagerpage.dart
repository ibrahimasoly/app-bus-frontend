import 'package:bustransport/UI/Pages/Paymentpage.dart';
import 'package:bustransport/models/Passager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart'
    as get_transitions;
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../bloc/PasagerSaveBloc.dart';
import '../Widgets/NavTopWidget.dart';
import '../Widgets/VoyageByIdWidget.dart';

class Passagerpage extends StatelessWidget {
  Passagerpage({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  final TextEditingController nomController = TextEditingController();
  final TextEditingController prenomController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController telController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const NavTopWidget(),
              Container(
                  padding: const EdgeInsets.all(8),
                  child: const VoyageByIdWidget()),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Text("Passager",
                        style: Theme.of(context).textTheme.displayLarge),
                  ],
                ),
              ),
              const Divider(
                height: 2,
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Entrez votre email';
                          }
                          if (!value.contains('@')) {
                            return 'email non valide';
                          }
                        },
                        decoration: InputDecoration(
                          labelText: 'Adresse email',
                          labelStyle: TextStyle(color: Colors.grey[500]),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          contentPadding: const EdgeInsets.only(
                            left: 10,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: nomController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Entrez votre nom';
                          }
                        },
                        decoration: InputDecoration(
                          labelText: 'Nom',
                          labelStyle: TextStyle(color: Colors.grey[500]),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          contentPadding: const EdgeInsets.only(
                            left: 10,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: prenomController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Entrez votre prenom';
                          }
                        },
                        decoration: InputDecoration(
                          labelText: 'Prenom',
                          labelStyle: TextStyle(color: Colors.grey[500]),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          contentPadding: const EdgeInsets.only(
                            left: 10,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      IntlPhoneField(
                        controller: telController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          contentPadding: const EdgeInsets.only(
                            left: 10,
                          ),
                          labelText: 'Numero de telephone',
                          labelStyle: TextStyle(color: Colors.grey[500]),
                        ),
                        initialCountryCode: 'ML',
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                String nom = nomController.text;
                                String prenom = prenomController.text;
                                String email = emailController.text;
                                String tel = telController.text;
                                Passager passager = Passager(
                                  id: 0,
                                  nom: nom,
                                  prenom: prenom,
                                  email: email,
                                  tel: tel,
                                  reservers: [],
                                );
                                context
                                    .read<PasagerSaveBloc>()
                                    .add(SaveEvent(passager: passager));
                                Get.to(
                                  () => const Paymentpage(),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child:
                                const Text('Revoir les details des trajets')),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
