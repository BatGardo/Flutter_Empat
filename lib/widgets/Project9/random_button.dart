import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/Project9/chart_provider.dart';

class RandomButton extends StatelessWidget {
  final AnimationController controller;

  const RandomButton({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => context.read<ChartProvider>().randomize(controller),
      child: const Text("Randomize"),
    );
  }
}
