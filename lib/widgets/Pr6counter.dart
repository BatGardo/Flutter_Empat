import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/Project6mod.dart';

class TaskCounter extends StatelessWidget {
  const TaskCounter({super.key});

  @override
  Widget build(BuildContext context) {
  // Prodiver demo - consumer listener
    return Consumer<Project6Model>(
      builder: (context, model, child) {
        return Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.blue.shade100,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total tasks: ${model.tasks.length}"),
              const Icon(Icons.list),
            ],
          ),
        );
      },
    );
  }
}
