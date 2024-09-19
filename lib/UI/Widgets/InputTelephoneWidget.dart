import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class InputTelephoneWidget extends StatelessWidget {
  final String label;
  final String hink;
  final String Function(String?)? validators;
  final controller;
  const InputTelephoneWidget(
      {Key? key,
      required this.label,
      required this.hink,
      this.validators,
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
            padding: const EdgeInsets.only(top: 25),
            height: 65,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.grey[400],
            ),
            child: IntlPhoneField(
              controller: controller,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(top: 13),
                border: InputBorder.none,
                hintText: hink,
                hintStyle: GoogleFonts.robotoCondensed(
                  color: Colors.grey[500],
                ),
              ),
              initialCountryCode: 'ML',
            ),
          ),
        ],
      ),
    );
  }
}
