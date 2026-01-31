import 'package:flutter/material.dart';

class Project5 extends StatefulWidget {
  const Project5({super.key, required this.title});
  final String title;

  @override
  State<Project5> createState() => _Project5State();
}

class _Project5State extends State<Project5> {
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
