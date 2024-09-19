import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/rechercheBloc.dart';

class TextVilleWidget extends StatelessWidget {
  final  icon;
  final fondWeight;
  final String text;
  final color;
  final String path;
  const TextVilleWidget({Key? key, required this.icon, required this.text, required this.fondWeight, required this.color, required this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10, bottom: 10),
      child:  InkWell(
        onTap: (){
          context.read<VoyageBloc>().add(AffichVoyageEvent());
          Navigator.pushNamed(context, path);
        },
        child: Container(
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey[200]
            ),
            child:   Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                  children: [
                     Icon(
                        icon,
                        color: Colors.grey
                    ),
                    const SizedBox(width: 8),
                    Text(
                      text,
                      style:  TextStyle(fontWeight: fondWeight, color: color),
                    ),
                  ]
              ),
            )
        ),
      ),
    );
  }
}
