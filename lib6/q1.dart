// Write a function that takes two numbers and an operator (+, -, *, /) as input and returns the result.
// Handle cases where division by zero might occur

void main() {
  print(calculate(10, 5, '+')); // Output: 15.0
  print(calculate(10, 5, '-')); // Output: 5.0
  print(calculate(10, 5, '*')); // Output: 50.0
  print(calculate(10, 5, '/')); // Output: 2.0
  print(calculate(10, 0, '/')); // Output: null (division by zero case)
}

double? calculate(double num1, double num2, String operator) {
  switch (operator) {
    case '+':
      return num1 + num2;
    case '-':
      return num1 - num2;
    case '*':
      return num1 * num2;
    case '/':
      return num2 != 0 ? num1 / num2 : null; // Handle division by zero
    default:
      throw ArgumentError('Invalid operator. Use +, -, *, or /.');
  }
}
