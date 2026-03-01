import 'package:flutter/material.dart';
import '../../models/Project8/Project8mod.dart';

class Project8Card extends StatelessWidget {
  final Project8Model project;

  Project8Card({required this.project});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(project.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(project.description),
          ],
        ),
      ),
    );
  }
}
