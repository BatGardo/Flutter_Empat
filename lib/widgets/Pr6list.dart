import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/Project6mod.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
  // Provider demo - consumer listener
    return Consumer<Project6Model>(
      builder: (context, model, child) {
        return ListView.builder(
          itemCount: model.tasks.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    const Checkbox(value: false, onChanged: null),
                    Expanded(
                      child: Text(
                        model.tasks[index],
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => model.removeTask(index),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
