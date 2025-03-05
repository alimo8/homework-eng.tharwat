// 6. Working with Maps - Student Details:
// - Task 1: Create a map representing a student with keys for name, age, and grade. Add, update,
// and remove entries from the map, printing the map after each operation.
// - Task 2: Iterate over the map and print each key-value pair.

void main() {
  Map<String, dynamic> student = {
    'name': 'Ali',
    'age': 20,
    'grade': 'A',
  };

  print('Initial Student Map:');
  print(student);

  student['city'] = 'Cairo';
  print('\nAfter Adding City:');
  print(student);

  student['grade'] = 'A+';
  print('\nAfter Updating Grade:');
  print(student);

  student.remove('age');
  print('\nAfter Removing Age:');
  print(student);

  print('\nIterating Over the Student Map:');
  student.forEach((key, value) {
    print('$key: $value');
  });
}
