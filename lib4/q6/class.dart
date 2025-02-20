// 6. Null Safety, Encapsulation & Classes
// Create a class `Person` with the following attributes:
// - `String name`
// - `int? age` (nullable)
// - `bool isStudent` (default is false)
// Implement:
// - A constructor that initializes `name` and `age`.
// - A method `displayInfo()` that prints the person's details.
// In `main()`, create an instance of `Person` and call `displayInfo()`.
class Person {
  String name;
  int? age;
  bool _isStudent = false;

  Person({required this.name, this.age, bool isStudent = false}) {
    _isStudent = isStudent;
  }

  bool get isStudent => _isStudent;

  set isStudent(bool value) {
    _isStudent = value;
  }

  void displayInfo() {
    print('Name: $name');
    print('Age: ${age ?? "Not provided"}');
    print('Is Student: $_isStudent');
  }
}
