import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/rechercheBloc.dart';

class RechercheArriverWidget extends StatelessWidget {
  final String search;
  const RechercheArriverWidget({Key? key, required this.search})
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
              context.read<VoyageBloc>().add(Updatelist2(value: value)),
          decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: const Icon(
                Icons.location_on,
                color: Colors.grey,
              ),
              hintText: 'Vers: $search',
              hintStyle: const TextStyle(color: Colors.grey)),
        ),
      ),
    );
  }
}
