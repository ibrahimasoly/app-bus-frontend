import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart'
    as get_transitions;

import '../Pages/Datepage.dart';

class DateVilleWidget extends StatelessWidget {
  final icon;
  final fondWeight;
  final String text;
  final color;
  const DateVilleWidget({
    Key? key,
    required this.icon,
    required this.fondWeight,
    required this.text,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10, bottom: 10),
      child: InkWell(
        onTap: () {
          Get.to(
            () => const Datepage(),
            transition: get_transitions.Transition.downToUp,
            duration: const Duration(seconds: 1),
          );
        },
        child: Container(
            height: 50,
            width: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey[200]),
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(children: [
                Icon(icon, color: Colors.grey),
                const SizedBox(width: 8),
                Text(
                  text,
                  style: TextStyle(color: color, fontWeight: fondWeight),
                ),
              ]),
            )),
      ),
    );
  }
}
