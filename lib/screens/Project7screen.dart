import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/Project7/Project7mod.dart';
import '../widgets/Project7/Pr7input.dart';
import '../widgets/Project7/Pr7counter.dart';
import '../widgets/Project7/Pr7list.dart';
import '../widgets/Project7/Pr7asyncDemo.dart';
import '../widgets/Project7/Pr7postsLoader.dart';
import '../widgets/Project7/Pr7postsDisplay.dart';

// 1) Реалізувати можливість зміни теми (темна/світла) за допомогою Shared Preferences 
// 2) Продемонструвати використання асинхронних функцій 
//     2.1) Обробка Future результату за допомогою .then() 
//     2.2) Обробка Future результату за допомогою ключового слова await 
// 3) Виконання http запитів на віддалений ресурс 
//     3.1) Написати функцію parseJson() для обробки отриманого JSON

class Project7Screen extends StatelessWidget {
  const Project7Screen({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
        centerTitle: true,
        actions: [
          Consumer<Project7Model>(
            builder: (context, model, _) {
              return IconButton(
                icon: Icon(
                  model.isDarkMode ? Icons.light_mode : Icons.dark_mode,
                ),
                onPressed: () {
                  model.toggleTheme();
                },
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Task Manager Layout",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
            ),
            const SizedBox(height: 16),
            const TaskInput(),
            const SizedBox(height: 20),
            const TaskCounter(),
            const SizedBox(height: 20),
            const Expanded(child: TaskList()),
            const SizedBox(height: 20),
            const AsyncDemo(),
            const SizedBox(height: 20),
            const PostsLoader(),
            const SizedBox(height: 20),
            const Expanded(child: PostsDisplay()),
          ],
        ),
      ),
    );
  }
}