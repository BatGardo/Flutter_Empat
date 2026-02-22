import 'package:flutter/material.dart';
import '../../services/Pr7theme_service.dart';
import '../../services/Pr7async_service.dart';
import '../../services/Pr7posts_service.dart';
import './Project7post.dart';

class Project7Model extends ChangeNotifier {
  // Services
  final ThemeService _themeService = ThemeService();
  final AsyncService _asyncService = AsyncService();
  final PostsService _postsService = PostsService();

  // Status
  final List<String> _tasks = [];
  bool _isDarkMode = false;
  List<Post> _posts = [];
  bool _isLoadingPosts = false;
  String? _errorMessage;

  // Getters
  List<String> get tasks => _tasks;
  bool get isDarkMode => _isDarkMode;
  List<Post> get posts => _posts;
  bool get isLoadingPosts => _isLoadingPosts;
  String? get errorMessage => _errorMessage;

  Project7Model() {
    _loadThemeFromStorage();
  }

  // Theme
  void _loadThemeFromStorage() async {
    _isDarkMode = await _themeService.loadTheme();
    notifyListeners();
  }

  Future<void> toggleTheme() async {
    _isDarkMode = !_isDarkMode;
    await _themeService.saveTheme(_isDarkMode);
    notifyListeners();
  }

  // Tasks (Project 6, skip)
  void addTask(String title) {
    _tasks.add(title);
    notifyListeners();
  }

  void removeTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }

  // Demo async function
  void demonstrateThenMethod() {
    print('.then() Demo');
    
    _asyncService.demonstrateThen().then((result) {
      print('Ready: $result');
      notifyListeners();
    }).catchError((error) {
      print('Error: $error');
    });
    
    print('After .then() - code still performing!');
  }

  Future<void> demonstrateAwaitMethod() async {
    print('await Demo');
    
    try {
      final result = await _asyncService.demonstrateAwait();
      print('Ready: $result');
      notifyListeners();
    } catch (error) {
      print('Error: $error');
    }

    print('After .await() - code will perform after result!');
  }

  // HTTP requests and JSON
  void loadPostsWithThen() {
    print('Loading posts from .then()');
    _isLoadingPosts = true;
    _errorMessage = null;
    notifyListeners();

    _postsService.fetchPosts()
        .then((postsList) {
          print('Post loaded, quantity: ${postsList.length}');
          _posts = postsList;
          _isLoadingPosts = false;
          notifyListeners();
        })
        .catchError((error) {
          print('Error loading: $error');
          _errorMessage = error.toString();
          _isLoadingPosts = false;
          notifyListeners();
        });
  }

  Future<void> loadPostsWithAwait() async {
    print('Loading posts with await');
    _isLoadingPosts = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final postsList = await _postsService.fetchPosts();
      print('Posts loaded, quantity: ${postsList.length}');
      _posts = postsList;
      _isLoadingPosts = false;
      notifyListeners();
    } catch (error) {
      print('Error loading: $error');
      _errorMessage = error.toString();
      _isLoadingPosts = false;
      notifyListeners();
    }
  }
}