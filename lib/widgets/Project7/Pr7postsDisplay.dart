import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/Project7/Project7mod.dart';

class PostsDisplay extends StatelessWidget {
  const PostsDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Project7Model>(
      builder: (context, model, _) {
        if (model.isLoadingPosts) {
          return const Center(child: CircularProgressIndicator());
        }

        if (model.errorMessage != null) {
          return Center(
            child: Text(
              'Error: ${model.errorMessage}',
              style: const TextStyle(color: Colors.red),
            ),
          );
        }

        if (model.posts.isEmpty) {
          return const Center(
            child: Text('Press button for download posts'),
          );
        }

        return ListView.builder(
          itemCount: model.posts.length,
          itemBuilder: (context, index) {
            final post = model.posts[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 4),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Post #${post.id}',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      post.title,
                      style: const TextStyle(fontSize: 12),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      post.body,
                      style: const TextStyle(fontSize: 10),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}