import 'package:bustransport/UI/Widgets/BottomNavBarWidget.dart';
import 'package:flutter/material.dart';

class Ticketpage extends StatelessWidget {
  const Ticketpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavBarWidget(),
      body: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            color: Colors.blue,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [],
            ),
          )
        ],
      ),
    );
  }
}
