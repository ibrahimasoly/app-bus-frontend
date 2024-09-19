import 'package:flutter/material.dart';

class TrierWidget extends StatelessWidget {
  const TrierWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: const Row(
              children: [
                Icon(Icons.sort),
                Text('Trier par prix ou temps'),
              ],
            ),
          ),
          CircleAvatar(
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.ballot),
            ),
          )
        ],
      ),
    );
  }
}
