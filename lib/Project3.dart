import 'package:flutter/material.dart';

class Project3 extends StatefulWidget {
  const Project3({super.key, required this.title});
  final String title;

  @override
  State<Project3> createState() => _Project3State();
}

class _Project3State extends State<Project3> {
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
