import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/rechercheBloc.dart';

class RechercheDepartWidget extends StatelessWidget {
  final String search;
  const RechercheDepartWidget({Key? key, required this.search})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.black),
            color: Colors.grey[200]),
        child: TextField(
          onChanged: (value) =>
              context.read<VoyageBloc>().add(Updatelist(value: value)),
          decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: const Icon(
                Icons.my_location,
                color: Colors.grey,
              ),
              hintText: 'De: $search',
              hintStyle: const TextStyle(color: Colors.grey)),
        ),
      ),
    );
  }
}
