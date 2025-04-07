import 'package:flutter/material.dart';
import 'package:grocery_app/widgets/custom_button.dart';

class OnboardingFooter extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final VoidCallback onNext;
  final VoidCallback onCreateAccount;

  const OnboardingFooter({
    required this.currentPage,
    required this.totalPages,
    required this.onNext,
    required this.onCreateAccount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Column(
        children: [
          _buildPageIndicators(),
          const SizedBox(height: 25),
          if (currentPage == totalPages - 1)
            CustomButton(
              text: 'CREATE AN ACCOUNT',
              color: Colors.white,
              textColor: Colors.black,
              borderColor: Colors.black,
              onTap: onCreateAccount,
            ),
          const SizedBox(height: 10),
          CustomButton(
            text: currentPage == totalPages - 1 ? 'LOGIN' : 'Next',
            color: Colors.orange,
            textColor: Colors.white,
            onTap: onNext,
          ),
        ],
      ),
    );
  }

  Widget _buildPageIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalPages,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: currentPage == index ? 23 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: currentPage == index ? Colors.green : Colors.grey,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
