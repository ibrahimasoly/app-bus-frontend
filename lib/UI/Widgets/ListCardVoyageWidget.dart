import 'package:bustransport/bloc/VoyageByIdBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart'
    as get_transitions;
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../VariableGlobal/Verification.dart';
import '../Pages/VoyageByIdpage.dart';

class ListCardVoyageWidget extends StatelessWidget {
  final String nom;
  final DateTime heurDpart;
  final DateTime heurArriver;
  final String villeDepart;
  final String villeArriver;
  final int nbPassager;
  final int prix;
  final int place;
  const ListCardVoyageWidget({
    Key? key,
    required this.nom,
    required this.heurDpart,
    required this.heurArriver,
    required this.villeDepart,
    required this.villeArriver,
    required this.nbPassager,
    required this.prix,
    required this.place,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: UnderlineInputBorder(borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  nom,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const Icon(Icons.qr_code)
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  DateFormat('HH:mm a z').format(heurDpart),
                  style:
                      GoogleFonts.robotoCondensed(fontWeight: FontWeight.bold),
                ),
                Text(
                  DateFormat('HH:mm')
                      .format(heurDpart.add(const Duration(minutes: 5))),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  DateFormat('HH:mm a z').format(heurArriver),
                  style:
                      GoogleFonts.robotoCondensed(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  villeDepart,
                ),
                Text(villeArriver),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("$nbPassager passager"),
                Text(
                  "$place places",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  "$prix FCFA",
                  style:
                      GoogleFonts.robotoCondensed(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
