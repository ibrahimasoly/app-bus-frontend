import 'package:bustransport/bloc/recuperationDateBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart'
    as get_transitions;

import 'Homepage.dart';

class Datepage extends StatefulWidget {
  const Datepage({Key? key}) : super(key: key);

  @override
  State<Datepage> createState() => _DatepageState();
}

class _DatepageState extends State<Datepage> {
  DateTime selectedDate = DateTime.now();
  bool t = false;
  @override
  Widget build(BuildContext context) {
    final date = selectedDate;
    final verif = t;
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
                  "Choisir la date",
                  style: Theme.of(context).textTheme.bodyLarge,
                )
              ],
            ),
            const Divider(
              height: 2,
              color: Colors.black26,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 60,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                      onPressed: pickDateRange,
                      child: const Text('Choisir la date')),
                ),
                Container(
                  height: 35,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey[200]),
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    DateFormat.EEEE().add_MMM().add_d().format(date),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 500,
            ),
            Container(
              height: 50,
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  if (verif == true) {
                    Get.to(
                      () => const Homepage(),
                      transition: get_transitions.Transition.fade,
                      duration: const Duration(seconds: 1),
                    );
                  }
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
            ),
          ],
        ),
      ),
    );
  }

  Future pickDateRange() async {
    DateTime? newDate = await showDatePicker(
      context: context,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      initialDate: selectedDate,
    );
    if (newDate == null) {
      return;
    } else if (newDate != selectedDate) {
      setState(() {
        selectedDate = newDate;
        t = true;
        print("$newDate et $selectedDate");
        context.read<DateBloc>().add(DateEvent(date: selectedDate));
      });
    }
  }
}
