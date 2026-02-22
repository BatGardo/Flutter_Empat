import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/Project7/Project7mod.dart';

class AsyncDemo extends StatelessWidget {
  const AsyncDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Async Functions Demo:',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).textTheme.bodyLarge?.color,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {
                  Provider.of<Project7Model>(context, listen: false)
                      .demonstrateThenMethod();
                },
                icon: const Icon(Icons.timer),
                label: const Text('.then()'),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {
                  Provider.of<Project7Model>(context, listen: false)
                      .demonstrateAwaitMethod();
                },
                icon: const Icon(Icons.hourglass_bottom),
                label: const Text('await'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}