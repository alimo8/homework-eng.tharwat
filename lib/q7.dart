// Question 7
// Given this code, identify any errors and explain why they occur: ```dart void main()
// { String name = "Alice"; name = 123; print(name); } ```

// 1- The right answer is (void main(){}) Not (dart void main{})
// 2- المتغير name من النوع string بمعني انه لا ياخذ غير قيمه نصيه و في حالة ادخال قيمه غير ذلك تعتبر ايرور

void main() {
  String name = "Alice";
  name = 'Nour';
  print(name);
}
