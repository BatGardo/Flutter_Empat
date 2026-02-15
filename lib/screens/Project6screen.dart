import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/Project6mod.dart';
import '../widgets/Pr6input.dart';
import '../widgets/Pr6counter.dart';
import '../widgets/Pr6list.dart';

// 1) Побудувати нетривіальне дерево віджетів 
// 2) Продемонструвати використання класу ChangeNotifier 
// 3) Побудувати Модель стану, до якої будуть здійснюватись звернення 
// 4) Продемонструвати доступ до моделі: 
//      4.1) Через Consumer 
//      4.2) Через Provider.of()

class Project6Screen extends StatelessWidget {
  const Project6Screen({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Project6Model(),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(title),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Task Manager Layout",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                TaskInput(),
                SizedBox(height: 20),
                TaskCounter(),
                SizedBox(height: 20),
                Expanded(child: TaskList()),
              ],
            ),
          ),
        );
      },
    );
  }
}