import 'package:flutter/material.dart';
import '../models/Project8/Project8mod.dart';
import '../widgets/Project8/Project8card.dart';
import '../widgets/Project8/BottomNavBarProject8.dart';

// 1) Перехід на віджет по імені класу 
// 2) Перехід на віджет по "іменованій навігації" 
// 3) Передача параметрів у віджет, який буде відкрито (через конструктор) 
// 4) Повернення параметрів назад при виході з віджета 
// 5) Nested-навігація. Можливий варіант
//     за допомогою BottomNavigationBar

class Project8Screen extends StatefulWidget {
  const Project8Screen({super.key});

  @override
  State<Project8Screen> createState() => _Project8ScreenState();
}

class _Project8ScreenState extends State<Project8Screen> {
  // 3) Parameter for nested navigation by constructor
  Project8Model currentProject = Project8Model(name: 'Project 8', description: 'Flutter Navigation Demo');

  // 4) Returned parameter from nested navigation
  String resultFromNested = 'Nothing yet';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(currentProject.name)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Project8Card(project: currentProject),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Return parameter back to MyHomePage
              Navigator.pop(context, 'Edited project ${currentProject.name}');
            },
            child: const Text('Return to Main with Result'),
          ),
          const SizedBox(height: 20),
          Text('Nested result: $resultFromNested'),
        ],
      ),
      bottomNavigationBar: BottomNavBarProject8(
        onNavigate: (Project8Model proj) {
          // Nested navigator with parameter
          setState(() {
            currentProject = proj;
            resultFromNested = 'Switched to ${proj.name}';
          });
        },
      ),
    );
  }
}
