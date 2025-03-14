import 'package:bmi/views/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BMICALCULATOR());
}

class BMICALCULATOR extends StatelessWidget {
  const BMICALCULATOR({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}
