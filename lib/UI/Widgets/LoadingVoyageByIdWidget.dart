import 'package:flutter/material.dart';

import 'loadingContainerWidget.dart';

class LoadingVoyageByIdWidget extends StatelessWidget {
  const LoadingVoyageByIdWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          loadingContainerWidget(
            a: 20,
            b: 200,
          ),
          Row(
            children: [
              loadingContainerWidget(a: 20, b: 150),
              SizedBox(
                width: 10,
              ),
              loadingContainerWidget(a: 20, b: 150),
            ],
          ),
          loadingContainerWidget(a: 20, b: 150),
        ],
      ),
    );
  }
}
