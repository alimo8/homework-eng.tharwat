import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_app/constants/assets.dart';
import 'package:grocery_app/models/onboarding_model.dart';
import 'package:grocery_app/styles/app_styles.dart';
import 'package:grocery_app/views/home_page.dart';
import 'package:grocery_app/widgets/OnboardingFooter_item.dart';
import 'package:grocery_app/widgets/Onboarding_widget.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  void _nextPage() {
    if (_currentPage == contents.length - 1) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      _controller.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }
  }

  void _goToHomePage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: contents.length,
              onPageChanged: (index) => setState(() => _currentPage = index),
              itemBuilder:
                  (context, index) => OnboardingContent(model: contents[index]),
            ),
          ),
          OnboardingFooter(
            currentPage: _currentPage,
            totalPages: contents.length,
            onNext: _nextPage,
            onCreateAccount: _goToHomePage,
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:grocery_app/constants/assets.dart';
// import 'package:grocery_app/models/onboarding_model.dart';
// import 'package:grocery_app/views/home_page.dart';

// class Onboarding extends StatefulWidget {
//   const Onboarding({super.key});

//   @override
//   State<Onboarding> createState() => _OnboardingState();
// }

// class _OnboardingState extends State<Onboarding> {
//   final PageController _controller = PageController();
//   int _currentPage = 0;

//   final List<OnboardingModel> contents = [
//     OnboardingModel(
//       image: Assets.imagesImage1,
//       title: 'Welcome to Fresh Fruits',
//       subtitle: "Enjoy fresh and organic fruits delivered to your doorstep.",
//     ),
//     OnboardingModel(
//       image: Assets.imagesImage1,
//       title: 'Best Quality for Your Family',
//       subtitle: "We ensure premium quality fruits with health benefits.",
//     ),
//     OnboardingModel(
//       image: Assets.imagesImage3,
//       title: 'Fast and Responsible Delivery',
//       subtitle: "Our couriers deliver fresh fruits swiftly to your home.",
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Column(
//         children: [
//           Expanded(
//             child: PageView.builder(
//               controller: _controller,
//               itemCount: contents.length,
//               onPageChanged: (index) => setState(() => _currentPage = index),
//               itemBuilder: (context, index) => OnboardingContent(
//                 model: contents[index],
//               ),
//             ),
//           ),
//           OnboardingFooter(
//             currentPage: _currentPage,
//             totalPages: contents.length,
//             onNext: () {
//               if (_currentPage == contents.length - 1) {
//                 Navigator.pushReplacementNamed(context, '/home');
//               } else {
//                 _controller.nextPage(
//                   duration: const Duration(milliseconds: 500),
//                   curve: Curves.ease,
//                 );
//               }
//             },
//             onCreateAccount: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => HomePage()),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

// class OnboardingContent extends StatelessWidget {
//   final OnboardingModel model;

//   const OnboardingContent({required this.model, super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           SvgPicture.asset(
//             model.image,
//             errorBuilder: (context, error, stackTrace) {
//               return const Icon(
//                 Icons.error,
//                 color: Colors.red,
//                 size: 50,
//               );
//             },
//           ),
//           const SizedBox(height: 20),
//           Text(
//             model.title,
//             textAlign: TextAlign.center,
//             style: const TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 15),
//           Text(
//             model.subtitle,
//             textAlign: TextAlign.center,
//             style: const TextStyle(
//               fontSize: 16,
//               color: Colors.grey,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class OnboardingFooter extends StatelessWidget {
//   final int currentPage;
//   final int totalPages;
//   final VoidCallback onNext;
//   final VoidCallback onCreateAccount;

//   const OnboardingFooter({
//     required this.currentPage,
//     required this.totalPages,
//     required this.onNext,
//     required this.onCreateAccount,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 30),
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: List.generate(
//               totalPages,
//               (index) => AnimatedContainer(
//                 duration: const Duration(milliseconds: 300),
//                 margin: const EdgeInsets.symmetric(horizontal: 4),
//                 width: currentPage == index ? 12 : 8,
//                 height: 8,
//                 decoration: BoxDecoration(
//                   color: currentPage == index ? Colors.green : Colors.grey,
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(height: 25),
//           if (currentPage == totalPages - 1)
//             CustomButton(
//               text: 'CREATE AN ACCOUNT',
//               color: Colors.white,
//               textColor: Colors.black,
//               borderColor: Colors.black,
//               onTap: onCreateAccount,
//             ),
//           const SizedBox(height: 10),
//           CustomButton(
//             text: currentPage == totalPages - 1 ? 'LOGIN' : 'Next',
//             color: Colors.orange,
//             textColor: Colors.white,
//             onTap: onNext,
//           ),
//         ],
//       ),
//     );
//   }
// }

// class CustomButton extends StatelessWidget {
//   final String text;
//   final Color color;
//   final Color textColor;
//   final Color? borderColor;
//   final VoidCallback onTap;

//   const CustomButton({
//     required this.text,
//     required this.color,
//     required this.textColor,
//     required this.onTap,
//     this.borderColor,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       borderRadius: BorderRadius.circular(8),
//       child: Container(
//         margin: const EdgeInsets.symmetric(horizontal: 16),
//         height: 50,
//         width: double.infinity,
//         decoration: BoxDecoration(
//           color: color,
//           border: borderColor != null
//               ? Border.all(color: borderColor!, width: 2)
//               : null,
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: Center(
//           child: Text(
//             text,
//             style: TextStyle(
//               color: textColor,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
