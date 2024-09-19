import 'package:bustransport/UI/Widgets/ListVilleArriverWidget.dart';
import 'package:bustransport/UI/Widgets/RechercheArriverWidget.dart';
import 'package:bustransport/VariableGlobal/Verification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class Recherche2page extends StatelessWidget {
  const Recherche2page({Key? key}) : super(key: key);

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
                  "Arriver",
                  style: GoogleFonts.robotoCondensed(
                      fontSize: 18, fontWeight: FontWeight.bold),
                )
              ],
            ),
            RechercheArriverWidget(
              search: verification2,
            ),
            const ListVilleArriverWidget(),
          ],
        ),
      ),
    );
  }
}
