// Question 5
// What is the difference between var and dynamic in Dart? Provide an example of
// each.

// ------------------------------------------------------------
// var :
//       هو متغير عند اسناد اول قيمه له من نوع معين ف انه لا يتغير بعد ذلك

// void main() {
//   var num = 10;
//   // num = 'hi'; خطا
//   num = 8;
//   print(num);
// }

// dynamic:
//           هو متغير يتم اسناد له اي قيمه من اي نوع نستخدمه عندما لا نعرف اي نوع من البيانات نريد تخزينه

void main() {
  dynamic num = 10;
  num = 'hi';
  num = false;

  print(num);
}
