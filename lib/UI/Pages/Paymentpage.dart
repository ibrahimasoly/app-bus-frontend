import 'package:bustransport/UI/Widgets/NavTopWidget.dart';
import 'package:bustransport/UI/Widgets/VoyageByIdWidget.dart';
import 'package:bustransport/bloc/PasagerSaveBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../VariableGlobal/Verification.dart';
import '../Widgets/ModePaymentWidget.dart';
import '../Widgets/PassagerDetailsWidget.dart';

class Paymentpage extends StatelessWidget {
  const Paymentpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const NavTopWidget(),
              const VoyageByIdWidget(),
              const SizedBox(
                height: 10,
              ),
              const PassagerDetailsWidget(),
              const SizedBox(
                height: 10,
              ),
              const ModePaymentWidget(),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Tickets (1 passager)"),
                          Text("${prix.toString()} FCFA")
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Totale",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Text(
                            "${prix.toString()} FCFA",
                            style: Theme.of(context).textTheme.bodyLarge,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () {
                      if (page != '') {
                        Navigator.pushNamed(context, "/$page");
                      } else {
                        Container();
                      }
                    },
                    child: const Text(
                      "Reserver",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
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
