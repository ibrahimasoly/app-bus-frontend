import 'package:bustransport/UI/Pages/Datepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Pages/Comptepage.dart';
import '../Pages/Homepage.dart';
import '../Pages/MalitelPaymentPage.dart';
import '../Pages/OrangePaymentPage.dart';
import '../Pages/Recherche2page.dart';
import '../Pages/Recherchepage.dart';
import '../Pages/Ticketpage.dart';

class RootView extends StatelessWidget {
  const RootView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          primary: Colors.orangeAccent,
          seedColor: Colors.orangeAccent,
          secondary: Colors.orangeAccent,
          background: Colors.grey[200],
        ),
        textTheme: TextTheme(
          bodyLarge: GoogleFonts.robotoCondensed(
              fontSize: 17, fontWeight: FontWeight.bold),
          bodyMedium: GoogleFonts.robotoCondensed(
            fontSize: 16,
          ),
          bodySmall: GoogleFonts.robotoCondensed(
              fontSize: 14, color: Colors.grey[600]),
          displayLarge: GoogleFonts.robotoCondensed(
              fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      routes: {
        "/": (context) => const Homepage(),
        "/recherche": (context) => const Recherchepage(),
        "/recherche2": (context) => const Recherche2page(),
        "/date": (context) => const Datepage(),
        "/Ticket": (context) => const Ticketpage(),
        "/Compte": (context) => const Comptepage(),
        "/Orange": (context) => const OrangePaymentPage(),
        "/Malitel": (context) => const MalitelPaymentPage()
      },
      initialRoute: '/',
    );
  }
}
