import 'package:flutter/material.dart';
import 'package:flutter_empat_main/Project2.dart';
import 'package:flutter_empat_main/Project3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Empat'),
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
          ],
        ),
      ),
    );
  }
}
