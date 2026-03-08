import 'dart:math';
import 'package:flutter/material.dart';
import '../../models/Project9/chart_model.dart';

class ChartProvider extends ChangeNotifier {
  final Random random = Random();

  final ChartModel model = ChartModel(
    values: [50, 50, 50, 50, 50, 50, 50],
    threshold: 50,
  );

  // For every animation bar separated Tween-animation
  late List<Animation<double>> heightAnimations;
  late List<Animation<Color?>> colorAnimations;

  // For storing previous values during animation
  late List<double> previousValues;

  ChartProvider() {
    previousValues = List.from(model.values);
    heightAnimations = List.filled(model.values.length, kAlwaysCompleteAnimation);
    colorAnimations = List.filled(model.values.length, kAlwaysCompleteColorAnimation);
  }

  // Create animations
  void createAnimations(AnimationController controller) {
    heightAnimations = [];
    colorAnimations = [];

    for (int i = 0; i < model.values.length; i++) {
      // Height
      heightAnimations.add(
        Tween<double>(
          begin: previousValues[i] * 3,
          end: model.values[i] * 3,
        ).animate(controller),
      );

      // Color
      colorAnimations.add(
        ColorTween(
          begin: previousValues[i] >= model.threshold ? Colors.green : Colors.red,
          end: model.values[i] >= model.threshold ? Colors.green : Colors.red,
        ).animate(controller),
      );
    }

    controller.forward(from: 0);
  }


  // Randomize
  void randomize(AnimationController controller) {
    previousValues = List.from(model.values);
    for (int i = 0; i < model.values.length; i++) {
      model.values[i] = random.nextInt(100).toDouble();
    }
    createAnimations(controller);
    notifyListeners();
  }
}

// Values for filling the animation list by default
final kAlwaysCompleteAnimation = AlwaysStoppedAnimation(0.0);
final kAlwaysCompleteColorAnimation = AlwaysStoppedAnimation<Color?>(Colors.green);
