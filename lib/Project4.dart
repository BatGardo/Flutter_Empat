import 'package:flutter/material.dart';

class Project4 extends StatefulWidget {
  const Project4({super.key, required this.title});
  final String title;

  @override
  State<Project4> createState() => _Project4State();
}

class _Project4State extends State<Project4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome to Project 3!'),
          ],
        ),
      ),
    );
  }
}
