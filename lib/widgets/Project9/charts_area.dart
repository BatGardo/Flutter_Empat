import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/Project9/chart_provider.dart';
import 'chart_column.dart';

class ChartsArea extends StatelessWidget {
  const ChartsArea({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ChartProvider>();

    return Container(
      height: 300,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(provider.model.values.length, (index) {
          return ChartColumn(
            heightAnimation: provider.heightAnimations[index],
            colorAnimation: provider.colorAnimations[index],
          );
        }),
      ),
    );
  }
}
