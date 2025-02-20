// 2. Arithmetic Operators, Conditional Statements & Functions
// Write a function `calculateBonus(int salary, int yearsWorked)` that calculates a
// bonus based on the following rules:
// - If the employee has worked for 5 or more years, they get a 10% bonus.
// - Otherwise, they get a 5% bonus.
// The function should return the bonus amount.
// Then, call the function inside `main()` and print the result.

import 'dart:io';

void main() {
  print('Enter your salary: ');
  int salary = int.parse(stdin.readLineSync()!);
  print('Enter your yearsWorked: ');
  int yearsWorked = int.parse(stdin.readLineSync()!);
  double finalBonous = calculateBonus(salary, yearsWorked);

  print('finalBonous is: $finalBonous');
}

calculateBonus(int salary, int yearsWorked) {
  if (yearsWorked >= 5) {
    double Bonous = salary * yearsWorked * (10 / 100);
    return Bonous;
  } else if (yearsWorked <= 5 && yearsWorked >= 1) {
    double Bonous = salary * yearsWorked * (5 / 100);
    return Bonous;
  }
}
