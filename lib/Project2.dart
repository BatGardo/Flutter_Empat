import 'package:flutter/material.dart';

class Project2 extends StatefulWidget {
  const Project2({super.key, required this.title});
  final String title;

  @override
  State<Project2> createState() => _Project2State();
}

class _Project2State extends State<Project2> {
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
            const Text('Welcome to Project 2!'),
          ],
        ),
      ),
    );
  }
}
