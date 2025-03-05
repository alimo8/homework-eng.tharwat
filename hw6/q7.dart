// Reverse a String Write a function that takes a string as input and
//returns the string reversed. Example: reverseString('hello') -> 'olleh'

import 'dart:io';

String reverseString(String input) {
  String reversed = '';
  for (int i = input.length - 1; i >= 0; i--) {
    reversed += input[i];
  }
  return reversed;
}

void main() {
  print('Enter a string: ');
  String input = stdin.readLineSync()!;

  print('Reversed string: ${reverseString(input)}');
}
