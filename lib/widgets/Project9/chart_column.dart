import 'package:flutter/material.dart';

class ChartColumn extends StatelessWidget {
  final Animation<double> heightAnimation;
  final Animation<Color?> colorAnimation;
  final double width;

  const ChartColumn({
    super.key,
    required this.heightAnimation,
    required this.colorAnimation,
    this.width = 40,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: heightAnimation,
      builder: (context, child) {
        return Container(
          width: width,
          height: heightAnimation.value,
          color: colorAnimation.value,
        );
      },
    );
  }
}
