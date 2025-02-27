// Write a function that takes a list of numbers and returns the sum of all elements.
// Example:
// sumList([1, 2, 3, 4, 5]) -> 15

import 'dart:io';

int sumList(List<int> numbers) {
  int sum = 0;
  for (int number in numbers) {
    sum += number;
  }
  return sum;
}

void main() {
  print('Enter numbers separated by spaces: ');
  List<int> numbers = stdin.readLineSync()!.split(' ').map(int.parse).toList();

  print('Sum of numbers: ${sumList(numbers)}');
}
