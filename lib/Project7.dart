import 'package:flutter/material.dart';

class Project7 extends StatefulWidget {
  const Project7({super.key, required this.title});
  final String title;

  @override
  State<Project7> createState() => _Project7State();
}

class _Project7State extends State<Project7> {
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
            const Text('Welcome to Project 7!'),
          ],
        ),
      ),
    );
  }
}