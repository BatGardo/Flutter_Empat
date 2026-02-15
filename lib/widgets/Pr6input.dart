import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/Project6mod.dart';

class TaskInput extends StatefulWidget {
  const TaskInput({super.key});

  @override
  State<TaskInput> createState() => _TaskInputState();
}

class _TaskInputState extends State<TaskInput> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            decoration: const InputDecoration(
              labelText: "Enter task",
              border: OutlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(width: 10),
        // Provider demo - only for call
        ElevatedButton(
          onPressed: () {
            if (_controller.text.isNotEmpty) {
              Provider.of<Project6Model>(context, listen: false)
                  .addTask(_controller.text);
              _controller.clear();
            }
          },
          child: const Text("Add"),
        ),
      ],
    );
  }
}
