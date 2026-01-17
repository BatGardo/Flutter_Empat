import 'package:flutter/material.dart';

class Project2 extends StatefulWidget {
  const Project2({super.key, required this.title});
  final String title;

  @override
  State<Project2> createState() => _Project2State();
}

// Helpers for Tasks
// Helper class for Task 1
class NullableString {
  String? forTask1;
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

  Initializator(this.name, this.age) : phrase = '$name, are you here?';

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
  Map<String, int> itemCounts = {
    'Apple': 3,
    'Banana': 5,
    'Orange': 2,
  };
}


class _Project2State extends State<Project2> {
  final NullableString nullableString = NullableString();
  // Helper variables for Task 2
  String task2Input = '';
  String task2Status = 'not updated';

  // Helper variable for Task 3
  String task3Output = ''; // Temporary storage for Task 3 output

  // Helper for Task 4
  var fabro = Fabricator.create('Preffered Name Factored');
  var fabroEmpty = Fabricator.create('');
  var inito = Initializator('Preffered Name Initialized', 23);

  // Helper for Task 7
  final Task7Helper task7Helper = Task7Helper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text('Welcome to Project 2!'),
            
            withSpacing(buildTask1()),
            withSpacing(buildTask2()),
            withSpacing(buildTask3()),
            withSpacing(buildTask4()),
            withSpacing(buildTask5()),
            withSpacing(buildTask6()),
            withSpacing(buildTask7()),
          ],
        ),
      ),
    );
  }
  // Helper method to add spacing between Tasks
  Widget withSpacing(Widget child) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: child,
    );
  }

  // Zone for Tasks
  Widget buildTask1() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text('Task 1'),
        // Grouped buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Set to Non-Null button
            ElevatedButton(
              onPressed: () {
                setState(() {
                  nullableString.forTask1 ??= "Wow, this is not null, button did that?";;
                });
              },
              child: const Text('Set to Non-Null'),
            ),
            // Set to Null button
            ElevatedButton(
              onPressed: () {
                setState(() {
                  nullableString.forTask1 = null;
                });
              },
            child: const Text('Set to Null'),
            ),
          ],
        ),
        Text(nullableString.forTask1 ?? 'Hmmm, i think it is null...'),
      ],
    );  
  }
  Widget buildTask2() {
    // Closure function and lambda usage
    void updateInput(String value) => setState(() {
      task2Input = value;
      task2Status = value.isEmpty ? 'Empty Input' : 'Input Updated';
    });
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text('Task 2'),
        TextField(
          decoration: const InputDecoration(
            labelText: 'Enter something here',
          ),
          // calling a closure
          onChanged: (value) => updateInput(value),
        ),
        // Displaying the input and status after closure call
          Text('You entered: $task2Input'),
          Text('Status: $task2Status'),
      ],
    );  
  }
  Widget buildTask3() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text('Task 3'),
        // Displaying default function output
        Text('That`s how we see that by default: "${performTask3()}" press the button to see custom input.'),
        ElevatedButton(
          onPressed: () {
            setState(() {
              task3Output = 'Button Pressed';
           });
          },
          // Displaying function output with custom input
          // using a conditional expression to check if button was pressed
          child: Text(task3Output.isEmpty ? 'That`s default too, but: ${performTask3()}' : performTask3(task3Input: "But that's not default!")),
        ),
        ],
      );  
  }
  Widget buildTask4() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text('Task 4'),
        Text(fabroEmpty.name),
        TextField(
          decoration: const InputDecoration(
            labelText: 'Enter name for Fabricator',
          ),
          onChanged: (value) {
            setState(() {
              fabro = Fabricator.create(value);
            });
          },
        ),
        Text(fabro.name),
        TextField(
          decoration: const InputDecoration(
            labelText: 'Enter name for Initializator',
          ),
          onChanged: (value) {
            setState(() {
              inito = Initializator(value.isEmpty ? 'Who i am' : value, 18);
            });
          },
        ),
        Text(inito.phrase)
      ],
    );
  }
  Widget buildTask5() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text('Task 5'),
        Text(Task5Helper().task5Output),
      ],
    );  
  }
  Widget buildTask6() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text('Task 6'),
        TextField(
          decoration: const InputDecoration(
            labelText: 'Enter a non-negative integer',
          ),
          keyboardType: TextInputType.number,
          onSubmitted: (value) {
            setState(() {
              try {
                int intValue = int.parse(value);
                Assertedint assertedInt = Assertedint(intValue);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'You entered a valid non-negative integer: ${assertedInt.value}',
                    ),
                  ),
                );
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Error: ${e.toString()}'),
                  ),
                );
              }
            });
          },
        ),
      ],
    );  
  }
  Widget buildTask7() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text('Task 7'),
        TextField(
          decoration: const InputDecoration(
            labelText: 'Write item',
          ),
          keyboardType: TextInputType.text,
          onSubmitted: (value) => setState(() {
          if (value.isNotEmpty) {
            if (task7Helper.items.contains(value)) {
              task7Helper.items.remove(value);
            } else {
              task7Helper.items.add(value);
            }
          }
        }),
        ),
        Text('List Items: ${task7Helper.items.join(', ')}'),
        TextField(
          decoration: const InputDecoration(
            labelText: 'Write unique item',
          ),
          keyboardType: TextInputType.text,
          onSubmitted: (value) => setState(() {
          if (value.isNotEmpty) {
            if (task7Helper.selectedItems.contains(value)) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Item already exists in the set')),
              );
            } else {
              task7Helper.selectedItems.add(value);
            }
          }
        }),
        ),
        Text('Set Items: ${task7Helper.selectedItems.join(', ')}'),
        TextField(
          decoration: const InputDecoration(
            labelText: 'Write item to count',
          ),
          keyboardType: TextInputType.text,
          onSubmitted: (value) => setState(() {
          if (value.isNotEmpty) {
            // Check if the value starts with "-"
          bool isDecrement = value.startsWith('-');
          String key = isDecrement ? value.substring(1) : value;
          if (task7Helper.itemCounts.containsKey(key)) {
            // Increment or decrement the count
            task7Helper.itemCounts[key] =
                task7Helper.itemCounts[key]! + (isDecrement ? -1 : 1);
            // If the value became <= 0, remove the key
            if (task7Helper.itemCounts[key]! <= 0) {
              task7Helper.itemCounts.remove(key);
            }
          } else if (!isDecrement) {
            // Add a new object only if it's +1
            task7Helper.itemCounts[key] = 1;
          }
        }
        }),
        ),
        Text('Map Items: ${task7Helper.itemCounts.entries.map((entry) => '${entry.key}: ${entry.value}').join(', ')}'),
      ],
    );  
  }
}
