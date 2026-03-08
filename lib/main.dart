import 'package:flutter/material.dart';
import 'package:flutter_empat_main/Project2.dart';
import 'package:flutter_empat_main/Project3.dart';
import 'package:flutter_empat_main/Project4.dart';
import 'package:flutter_empat_main/Project5.dart';
import 'package:flutter_empat_main/models/Project7/Project7mod.dart';
import 'package:flutter_empat_main/providers/Project9/chart_provider.dart';
import 'package:flutter_empat_main/screens/Project6screen.dart';
import 'package:flutter_empat_main/screens/Project7screen.dart';
import 'package:flutter_empat_main/screens/Project8screen.dart';
import 'package:flutter_empat_main/screens/project_9_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => Project7Model(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Project7Model>(
      builder: (context, model, _) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.blue,
              brightness: Brightness.dark,
            ),
            useMaterial3: true,
          ),
          themeMode: model.isDarkMode ? ThemeMode.dark : ThemeMode.light,

          // Named routes
          initialRoute: '/',
          routes: {
            '/': (context) => const MyHomePage(title: 'Main Page'),
            '/project8': (context) => const Project8Screen(),
            '/chart': (context) => const ChartScreen(),
          },
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class Person {
  // Private fields
  String _firstName;
  String _lastName;
  String _whoEdited;

  // Constructor
  Person({
    required String firstName,
    required String lastName,
    String whoEdited = '',
  }) : _firstName = firstName,
       _lastName = lastName,
       _whoEdited = whoEdited;

  // Getters
  String get fullName => '$_firstName $_lastName';
  String get whoEdited => _whoEdited;

  // Setters
  set whoEdited(String editor) {
    _whoEdited = editor;
  }
}

class _MyHomePageState extends State<MyHomePage> {
  // Named parameter
  final Person _author = Person(firstName: 'Ihor', lastName: 'Syniaiev');
  final TextEditingController _whoEditedController = TextEditingController();
  String lastResult = 'No project opened yet';
  @override
  void dispose() {
    _whoEditedController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: const Text(
                'Hi, this is the main page for navigation between projects.',
              ),
            ),
            Text('This project was created by ${_author.fullName}.'),
            TextField(
              controller: _whoEditedController,
              decoration: const InputDecoration(
                labelText: 'Enter your name if you edited this file',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _author.whoEdited = _whoEditedController.text;
                });
              },
              child: const Text('Submit'),
            ),
            Text('Last edited by: ${_author.whoEdited}'),
          ],
        ),
      ),
      // Buttons for navigation
      floatingActionButton: Center(
        child: Wrap(
          spacing: 10,
          runSpacing: 10,
          direction: Axis.horizontal,
          children: [
            const SizedBox(height: 10),
            FloatingActionButton.extended(
              heroTag: 'project2',
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Project2(title: 'Project 2'),
                  ),
                );
              },
              label: const Text('Project 2'),
              icon: const Icon(Icons.arrow_forward),
            ),
            FloatingActionButton.extended(
              heroTag: 'project3',
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Project3(title: 'Project 3'),
                  ),
                );
              },
              label: const Text('Project 3'),
              icon: const Icon(Icons.arrow_forward),
            ),
            FloatingActionButton.extended(
              heroTag: 'project4',
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Project4(title: 'Project 4'),
                  ),
                );
              },
              label: const Text('Project 4'),
              icon: const Icon(Icons.arrow_forward),
            ),
            FloatingActionButton.extended(
              heroTag: 'project5',
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Project5(title: 'Project 5'),
                  ),
                );
              },
              label: const Text('Project 5'),
              icon: const Icon(Icons.arrow_forward),
            ),
            FloatingActionButton.extended(
              heroTag: 'project6',
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Project6Screen(title: 'Project 6'),
                  ),
                );
              },
              label: const Text('Project 6'),
              icon: const Icon(Icons.arrow_forward),
            ),
            FloatingActionButton.extended(
              heroTag: 'project7',
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const Project7Screen(title: 'Project 7'),
                  ),
                );
              },
              label: const Text('Project 7'),
              icon: const Icon(Icons.arrow_forward),
            ),
            FloatingActionButton.extended(
              heroTag: 'project8_named',
              onPressed: () async {
                final result = await Navigator.pushNamed(context, '/project8');

                if (result != null) {
                  setState(() {
                    lastResult = result.toString();
                  });
                }
              },
              label: const Text('Project 8 (Named)'),
              icon: const Icon(Icons.arrow_forward),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Last result: $lastResult',
                style: const TextStyle(fontSize: 16),
              ),
            ),
            FloatingActionButton.extended(
              heroTag: 'chart',
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ChangeNotifierProvider(
                      create: (_) => ChartProvider(),
                      child: const ChartScreen(),
                    ),
                  ),
                );

                if (result != null) {
                  setState(() {
                    lastResult = result.toString();
                  });
                }
              },
              label: const Text('Chart'),
              icon: const Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
    );
  }
}
