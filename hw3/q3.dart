// 3. To-Do List App:
// Create a to-do list program using a List where each item has a description, due date, and
// completion status (as bool). Implement methods to add, remove, and update tasks, including the
// use of for-each loops
void main() {
  List<Map<String, dynamic>> tasks = [];

  void addTask(String description, String dueDate) {
    tasks.add(
        {'description': description, 'dueDate': dueDate, 'isCompleted': false});
    print('Task added: $description');
  }

  void removeTask(int index) {
    if (index >= 0 && index < tasks.length) {
      print('Task removed: ${tasks[index]['description']}');
      tasks.removeAt(index);
    } else {
      print('Invalid index');
    }
  }

  void markTaskAsCompleted(int index) {
    if (index >= 0 && index < tasks.length) {
      tasks[index]['isCompleted'] = true;
      print('Task marked as completed: ${tasks[index]['description']}');
    } else {
      print('Invalid index');
    }
  }

  void displayTasks() {
    if (tasks.isEmpty) {
      print('No tasks available');
    } else {
      for (int i = 0; i < tasks.length; i++) {
        print(
            '${i + 1}. ${tasks[i]['description']} - Due: ${tasks[i]['dueDate']} - Completed: ${tasks[i]['isCompleted']}');
      }
    }
  }

  addTask('Study Dart', '2025-02-20');
  addTask('Buy Groceries', '2025-02-18');

  displayTasks();

  markTaskAsCompleted(0);

  displayTasks();

  removeTask(1);

  displayTasks();
}
