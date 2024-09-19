import 'package:bustransport/UI/Widgets/ListVilleDepartWidget.dart';
import 'package:bustransport/UI/Widgets/RechercheDepartWidget.dart';
import 'package:bustransport/VariableGlobal/Verification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class Recherchepage extends StatelessWidget {
  const Recherchepage({Key? key}) : super(key: key);

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
                    icon: Icon(Icons.arrow_back)),
                Text(
                  "Depart",
                  style: GoogleFonts.robotoCondensed(
                      fontSize: 18, fontWeight: FontWeight.bold),
                )
              ],
            ),
            RechercheDepartWidget(
              search: verification,
            ),
            const ListVilleDepartWidget(),
          ],
        ),
      ),
    );
  }
}
