import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class loadingContainerWidget extends StatelessWidget {
  final double a;
  final double b;
  const loadingContainerWidget({
    Key? key,
    required this.a,
    required this.b,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.white70,
        period: const Duration(seconds: 2),
        child: Container(
          height: a,
          width: b,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(3),
          ),
        ),
      ),
    );
  }
}
