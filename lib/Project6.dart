import 'package:flutter/material.dart';

class Project6 extends StatefulWidget {
  const Project6({super.key, required this.title});
  final String title;

  @override
  State<Project6> createState() => _Project6State();
}

class _Project6State extends State<Project6> {
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