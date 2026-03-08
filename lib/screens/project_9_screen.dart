import 'package:flutter/material.dart';
import 'package:flutter_empat_main/widgets/Project9/charts_area.dart';
import 'package:flutter_empat_main/widgets/Project9/random_button.dart';
import '../providers/Project9/chart_provider.dart';
import 'package:provider/provider.dart';

// 1) Реалізувати анімацію
//     1.1) Приклад: рухлива стовпчата діаграма 
// 2) Продемонструвати використання Animation, AnimationController, Tween 
// 3) У створеній анімації реалізувати зміну кольору або іншу трансформацію певного параметра. 
// 4) Анімація повинна реалізовувати певний рух, зміну положення. Цей рух можна зациклити

class ChartScreen extends StatefulWidget {
  const ChartScreen({super.key});

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<ChartProvider>();
      provider.randomize(controller);
      provider.createAnimations(controller);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Spacer(flex: 2),

          const ChartsArea(),

          const SizedBox(height: 40),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RandomButton(controller: controller),
            ],
          ),

          const Spacer(flex: 3),
        ],
      ),
    );
  }
}