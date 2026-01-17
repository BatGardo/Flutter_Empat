// Helpers for Tasks
// Helper class for Task 1
class NullableString {
  String? forTask1;
}

// Helper function for Task 2
  // Helper variables for Task 2
  String task2Input = '';
  String task2Status = 'not updated';

  // Closure function and lambda usage
  void updateInput(String value, void Function(void Function()) setStateCallback) {
    setStateCallback(() {
      task2Input = value;
      task2Status = value.isEmpty ? 'Empty Input' : 'Input Updated';
    });
  }

// Helper function for Task 3
String performTask3({String task3Input = 'Yep, default value'}) {
  return task3Input;
}

// Helper class for Task 4
class Fabricator {
  final String name;
  final int age;

  Fabricator(this.name, this.age);

  factory Fabricator.create(String name) {
    return name.isEmpty ? Fabricator('Who i am', 0) : Fabricator(name, 18);
  }
}

class Initializator {
  final String name;
  final int age;
  final String phrase;

  Initializator(this.name, this.age) : phrase = '$name, $age, are you here?';
}

// Helper mixin for Task 5
mixin Task5Mixin {
  String get task5Output => 'Task 5 output';
}

class Task5Helper with Task5Mixin {}

// Helper class for Task 6
class Assertedint {
  final int value;

  Assertedint(this.value) {
    // Production-safe validation
    if (value < 0) {
      throw ArgumentError('Value must be non-negative');
    }

    // Debug-only check
    assert(value >= 0, 'Value must be non-negative');
  }
}

// Helper class for Task 7
class Task7Helper {
  List<String> items = ['Item 1', 'Item 2', 'Item 3'];
  Set<String> selectedItems = {'Unique 1', 'Unique 2', 'Unique 3'};
  Map<String, int> itemCounts = {'Apple': 3, 'Banana': 5, 'Orange': 2};
}