import 'package:flutter/material.dart';
import '../../models/Project8/Project8mod.dart';

class BottomNavBarProject8 extends StatelessWidget {
  final void Function(Project8Model) onNavigate;

  const BottomNavBarProject8({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Project 6'),
        BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Project 7'),
        BottomNavigationBarItem(icon: Icon(Icons.layers), label: 'Project 8'),
      ],
      onTap: (index) {
        switch (index) {
          case 0:
            onNavigate(Project8Model(name: 'Project 6', description: 'Nested Example 6'));
            break;
          case 1:
            onNavigate(Project8Model(name: 'Project 7', description: 'Nested Example 7'));
            break;
          case 2:
            onNavigate(Project8Model(name: 'Project 8', description: 'Nested Example 8'));
            break;
        }
      },
    );
  }
}
