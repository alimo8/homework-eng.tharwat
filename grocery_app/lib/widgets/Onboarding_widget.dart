// import 'package:flutter/material.dart';
// import 'package:grocery_app/models/onboarding_model.dart';
// import 'package:grocery_app/widgets/custom_button.dart';

// class Onboarding_view extends StatelessWidget {
//    Onboarding_view({super.key});

// final List<OnboardingModel> contents = [
//   OnboardingModel(
//     image: 'assets/images/image 1.png',
//     title: 'Welcome to Fresh Fruits',
//     subtitle:
//         "Lorem ipsum dolor sit amet, consectetur "
//         "adipiscing elit, sed do eiusmod tempor",
//   ),
//   OnboardingModel(
//     image: 'assets/images/image 1.png',
//     title: 'We provide best quality Fruits to your family',
//     subtitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed ',
//   ),
//   OnboardingModel(
//     image: 'assets/images/image 2.png',
//     title: 'Fast and responsibily delivery by our courir ',
//     subtitle:
//         'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ',
//   ),
// ];

//   @override
//   Widget build(BuildContext context) {
//     return

//     Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Image.asset(contents, height: 300),
//           const SizedBox(height: 10),
//           Text(
//             'Welcome to Fresh Fruits',
//             style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           // Text(
//           //   'Grocery application',
//           //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           // ),
//           const SizedBox(height: 15),

//           //عايزه تتظبط
//           Padding(
//             padding: const EdgeInsets.all(16.0),

//             child: Text(
//               "Lorem ipsum dolor sit amet, consectetur "
//               "adipiscing elit, sed do eiusmod tempor",
//               textAlign: TextAlign.center,
//               softWrap: true,
//               style: TextStyle(fontSize: 16, color: Colors.grey),
//             ),
//           ),
//           // CustomButton(text: 'Next'),
//         ],
//       ),
//     );
//   }
// }
