import 'package:flutter/material.dart';
import 'dart:math';

double degreeToRadian(double degree) {
  return degree * (-pi / 180);
}

class StackedBackground extends StatelessWidget {
  const StackedBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.antiAlias,
      fit: StackFit.expand,
      children: [
        Positioned(
          bottom: -68,
          right: -62,
          child: Transform.rotate(
            angle: degreeToRadian(35),
            child: Icon(
              Icons.calculate_outlined,
              size: 272,
              color: Theme.of(context).colorScheme.secondaryFixedDim,
            ),
          ),
        ),
        Positioned(
          bottom: -68,
          left: -50,
          child: Transform.rotate(
            angle: degreeToRadian(20),
            child: Icon(
              Icons.square_foot_rounded,
              size: 272,
              color: Theme.of(context).colorScheme.secondaryFixedDim,
            ),
          ),
        ),
        child,
      ],
    );
  }
}
