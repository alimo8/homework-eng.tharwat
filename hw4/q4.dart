// 4. Maps, Functions & User Input
// Create a Dart program that:
// - Declares a `Map<String, int>` where keys are fruit names and values are their
// prices.
// - Implements a function `getPrice(String fruitName)` that returns the price of a
// given fruit.
// - If the fruit is not found, return -1.
// Call the function inside `main()` and print the result.

import 'dart:io';

void main() {
  print('Enter your fruitNames: ');
  String fruitNames = stdin.readLineSync()!;
  print(getPrice(fruitNames));
}

getPrice(String fruitName) {
  Map<String, int> fruitNames = {'apple': 15, 'orange': 20, 'banana': 8};
  if (fruitNames.containsKey(fruitName)) {
    return fruitNames[fruitName]!;
  } else {
    return -1;
  }
}
