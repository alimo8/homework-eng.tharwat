// 1. Basic Calculator:
// Create a Dart program that takes two numbers as input and performs addition, subtraction,
// multiplication, and division using variables, arithmetic operators, and functions. Also, include
// optional parameters for different operations (e.g., addition of multiple numbers).

import 'dart:io';

void main() {
  print('Enter first number : ');
  double number1 = double.parse(stdin.readLineSync()!);
  print('Enter second number : ');
  double number2 = double.parse(stdin.readLineSync()!);

  print('Addition: ${addNumbers(number1, number2)}');
  print('Subtraction: ${subNumbers(number1, number2)}');
  print('Multiplication: ${mulNumbers(number1, number2)}');
  print('Division: ${divNumbers(number1, number2)}');
}

addNumbers([double num1 = 0, double num2 = 0]) {
  double result = num1 + num2;
  return result;
}

subNumbers([double num1 = 0, double num2 = 0]) {
  double result = num1 - num2;
  return result;
}

mulNumbers([double num1 = 0, double num2 = 1]) {
  double result = num1 * num2;
  return result;
}

divNumbers([double num1 = 0, double num2 = 0]) {
  if (num2 == 0) {
    print('Erorr, try anothr number');
  } else {
    double result = num1 / num2;
    return result;
  }
}
