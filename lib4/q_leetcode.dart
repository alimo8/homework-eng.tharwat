// Given an integer array nums, return true if any value appears at least twice in the array, and return false if every element is distinct.

import 'dart:io';

void main() {
  print('Enter how many numbers you want to store: ');
  int n = int.parse(stdin.readLineSync()!);

  List<int> list = [];

  for (int i = 0; i < n; i++) {
    print('Enter number ${i + 1}:');
    int number = int.parse(stdin.readLineSync()!);
    list.add(number);
  }

  print("List 1: $list");

  // التحقق من التكرارات
  Set<int> seen = {};
  bool hasDuplicate = false;

  for (int num in list) {
    if (seen.contains(num)) {
      hasDuplicate = true;
      break;
    }
    seen.add(num);
  }

  if (hasDuplicate) {
    print('true');
  } else {
    print('false');
  }
}
