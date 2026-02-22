import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/Project7/Project7post.dart';

class PostsService {
  // Loading posts from GitHub API
  Future<List<Post>> fetchPosts() async {
    final url = Uri.parse(
      'https://api.github.com/repos/flutter/flutter/issues?per_page=5'
    );
    
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return parseJson(response.body);
    } else {
      throw Exception('Error: ${response.statusCode}');
    }
  }

  // Parse JSON in Post
  List<Post> parseJson(String jsonBody) {
    try {
      final jsonData = json.decode(jsonBody) as List;
      
      return jsonData.map((item) {
        return Post(
          userId: item['user']['id'] ?? 0,
          id: item['id'] ?? 0,
          title: item['title'] ?? 'No title',
          body: item['body']?.substring(0, 100) ?? 'No description',
        );
      }).toList();
    } catch (error) {
      throw Exception('Error parsing JSON: $error');
    }
  }
}