// 8. Range Checker Program:
// Write a Dart program that checks if a number is within a specified range using logical operators and
// prints the result.

import 'dart:io';

void main() {
  print('Enter number : ');
  int number = int.parse(stdin.readLineSync()!);
  if (number >= 0 && number <= 10) {
    print('Number is within a specified range');
  } else {
    print('Try again');
  }
}
