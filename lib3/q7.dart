// 7. Number Check Program:
// Create a program that asks the user to input a number and checks if it's positive, negative, or zero
// using if-else statements.

import 'dart:io';

void main() {
  print('Enter number : ');
  int number = int.parse(stdin.readLineSync()!);

  if (number % 2 == 0) {
    print('positive');
  } else if (number == 0) {
    print('Zeroooo');
  } else {
    print('negative');
  }
}
