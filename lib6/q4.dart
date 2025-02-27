// Write a function that takes two numbers (start, end) and returns a list of all prime numbers between
// them.
// Ensure that the function correctly identifies prime numbers and handles edge cases where start is
// greater than end

import 'dart:io';

void getPrimeNumbers(int start, int end) {
  if (start > end) {
    print('Invalid range: start should be less than or equal to end.');
    return;
  }

  print('Prime numbers between $start and $end:');
  for (int num = start; num <= end; num++) {
    if (isPrime(num)) {
      print(num);
    }
  }
}

bool isPrime(int number) {
  if (number < 2) return false;
  if (number == 2) return true;
  if (number % 2 == 0) return false;

  for (int i = 3; i * i <= number; i += 2) {
    if (number % i == 0) return false;
  }
  return true;
}

void main() {
  print('Enter start number: ');
  int start = int.parse(stdin.readLineSync()!);
  print('Enter end number: ');
  int end = int.parse(stdin.readLineSync()!);

  getPrimeNumbers(start, end);
}
