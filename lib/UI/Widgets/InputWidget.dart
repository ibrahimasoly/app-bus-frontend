import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class InputWidget extends StatelessWidget {
  final String label;
  final String hink;
  final Function(dynamic)? validator;
  final controller;
  const InputWidget(
      {Key? key,
      required this.label,
      required this.hink,
      this.validator,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              "$label*",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 10, left: 10),
            height: 65,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.grey[400],
            ),
            child: TextFormField(
              controller: controller,
              validator: (value) {},
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(top: 13),
                  border: InputBorder.none,
                  hintText: hink,
                  hintStyle:
                      GoogleFonts.robotoCondensed(color: Colors.grey[500])),
            ),
          ),
        ],
      ),
    );
  }
}
