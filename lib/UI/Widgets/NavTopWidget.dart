import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../VariableGlobal/Verification.dart';

class NavTopWidget extends StatelessWidget {
  const NavTopWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back)),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  ville1,
                  style:
                      GoogleFonts.robotoCondensed(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 30,
                ),
                Text(
                  ville2,
                  style:
                      GoogleFonts.robotoCondensed(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  DateFormat.EEEE()
                      .add_MMM()
                      .add_d()
                      .format(datDepart)
                      .toString(),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  ",   $nbPassager Passager",
                  style: Theme.of(context).textTheme.bodySmall,
                )
              ],
            )
          ],
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.share)),
      ],
    );
  }
}
