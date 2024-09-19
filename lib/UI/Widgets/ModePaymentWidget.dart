import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../VariableGlobal/Verification.dart';
import '../../bloc/RadioButtonBloc.dart';

class ModePaymentWidget extends StatelessWidget {
  const ModePaymentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          blurRadius: 5,
          spreadRadius: 2,
          offset: Offset(0, 4),
        )
      ]),
      child: BlocBuilder<RadioButtonBloc, RadioButtonState>(
          builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Selectionnez un mode de payment",
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            const Divider(
              height: 2,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Radio(
                    visualDensity: VisualDensity.comfortable,
                    value: "Orange",
                    groupValue: state.selectedValue,
                    onChanged: (value) {
                      context
                          .read<RadioButtonBloc>()
                          .add(RadioButtonChanged(value!));
                      page = value;
                      print(page);
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(70),
                        image: const DecorationImage(
                          image: AssetImage('images/img_2.png'),
                          fit: BoxFit.cover,
                        )),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Radio(
                    visualDensity: VisualDensity.comfortable,
                    value: "Malitel",
                    groupValue: state.selectedValue,
                    onChanged: (value) {
                      context
                          .read<RadioButtonBloc>()
                          .add(RadioButtonChanged(value!));
                      page = value;
                      print(page);
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(70),
                        image: const DecorationImage(
                          image: AssetImage('images/img_1.png'),
                          fit: BoxFit.cover,
                        )),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
