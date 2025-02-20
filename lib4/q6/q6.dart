// 6. Null Safety, Encapsulation & Classes
// Create a class `Person` with the following attributes:
// - `String name`
// - `int? age` (nullable)
// - `bool isStudent` (default is false)
// Implement:
// - A constructor that initializes `name` and `age`.
// - A method `displayInfo()` that prints the person's details.
// In `main()`, create an instance of `Person` and call `displayInfo()`.

import 'class.dart';

void main() {
  Person person = Person(name: 'Ali', age: 22, isStudent: true);
  person.displayInfo();

  print('---');

  person.isStudent = false;
  person.displayInfo();
}
