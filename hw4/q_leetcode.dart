// Given an integer array nums, return true if any value appears at least twice in the array, and return false if every element is distinct.

// ==========================================================================
// https://leetcode.com/problems/contains-duplicate/
// ==========================================================================
import 'dart:io';

void main() {
  print('Enter how many numbers you want to store: ');
  int n = int.parse(stdin.readLineSync()!);

  List<int> nums = [];

  for (int i = 0; i < n; i++) {
    print('Enter number ${i + 1}:');
    int number = int.parse(stdin.readLineSync()!);
    nums.add(number);
  }

  print("List : $nums");

  Set<int> seen = {};
  bool hasDuplicate = false;

  for (int num in nums) {
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


// bool containsDuplicate(List<int> nums) {
//   Set<int> seen = {};
//   for (int num in nums) {
//     if (seen.contains(num)) {
//       return true;
//     }
//     seen.add(num);
//   }
//   return false;
// }

// void main() {
//   List<int> nums = [1, 2, 3, 1];
//   print(containsDuplicate(nums)); // Output: true
// }

