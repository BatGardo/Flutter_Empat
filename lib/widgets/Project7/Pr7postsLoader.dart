import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/Project7/Project7mod.dart';

class PostsLoader extends StatelessWidget {
  const PostsLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'HTTP Requests Demo:',
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
                      .loadPostsWithThen();
                },
                icon: const Icon(Icons.cloud_download),
                label: const Text('HTTP .then()'),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {
                  Provider.of<Project7Model>(context, listen: false)
                      .loadPostsWithAwait();
                },
                icon: const Icon(Icons.cloud_download),
                label: const Text('HTTP await'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}