import 'package:flutter/material.dart';

import 'loadingContainerWidget.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return const ListTile(
          title: Card(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      loadingContainerWidget(
                        a: 20,
                        b: 200,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      loadingContainerWidget(
                        a: 20,
                        b: 100,
                      ),
                      loadingContainerWidget(
                        a: 20,
                        b: 100,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      loadingContainerWidget(
                        a: 20,
                        b: 100,
                      ),
                      loadingContainerWidget(
                        a: 20,
                        b: 100,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      loadingContainerWidget(
                        a: 20,
                        b: 60,
                      ),
                      loadingContainerWidget(
                        a: 20,
                        b: 60,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
      itemCount: 9,
    );
  }
}
