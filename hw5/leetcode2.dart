// Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.

// You may assume that each input would have exactly one solution, and you may not use the same element twice.

// You can return the answer in any order.
// Example 1:
// Input: nums = [2,7,11,15], target = 9
// Output: [0,1]
// Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].

// ==============================================================================
// https://leetcode.com/problems/two-sum/description/?source=submission-ac
// ==============================================================================

void main() {
  List<int> nums = [2, 7, 11, 15];
  int target = 9;
  for (int i = 0; i < nums.length; i++) {
    for (int j = i + 1; j < nums.length; j++) {
      if (nums[i] + nums[j] == target) {
        print('[$i,$j]');
      }
    }
  }
}

// nums = [2,7,11,15], target = 9

// List<int> twoSum(List<int> nums, int target) {
//   for (int i = 0; i < nums.length; i++) {
//     for (int j = i + 1; j < nums.length; j++) {
//       if (nums[i] + nums[j] == target) {
//         return [i, j];
//       }
//     }
//   }
//   return [];
// }

// void main() {
//   List<int> nums = [2, 7, 11, 15];
//   int target = 9;

//   List<int> result = twoSum(nums, target);
//   print(result);
// }
