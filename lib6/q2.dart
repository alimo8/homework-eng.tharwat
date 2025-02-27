// Write a function that converts temperature from Celsius to Fahrenheit and vice versa.
// Accept temperature value and unit ('C' for Celsius, 'F' for Fahrenheit) as inputs.
// Convert accordingly and return the result.

double convertTemperature(double value, String unit) {
  if (unit == 'C') {
    return (value * 9 / 5) + 32; //  Celsius to Fahrenheit
  } else if (unit == 'F') {
    return (value - 32) * 5 / 9; //  Fahrenheit to Celsius
  } else {
    print('Invalid unit. Please use "C" for Celsius or "F" for Fahrenheit.');
    return double.nan;
  }
}

void main() {
  print(convertTemperature(0, 'C'));
  print(convertTemperature(32, 'F'));
  print(convertTemperature(100, 'C'));
  print(convertTemperature(212, 'F'));
  print(convertTemperature(50, 'X'));
}
