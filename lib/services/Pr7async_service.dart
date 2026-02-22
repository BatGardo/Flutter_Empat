// Service for demo async
class AsyncService {
  // Demo .then()
  Future<String> demonstrateThen() async {
    return Future.delayed(const Duration(seconds: 2))
        .then((value) => 'Result .then()!')
        .catchError((error) => 'Error: $error');
  }

  // Demo await
  Future<String> demonstrateAwait() async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      return 'Result await!';
    } catch (error) {
      return 'Error: $error';
    }
  }
}