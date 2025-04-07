import 'package:flutter/material.dart';
import 'package:quiz_app/constants/assets.dart';
import 'package:quiz_app/style/app_color.dart';
import 'package:quiz_app/view/questions_view.dart';

class StartView extends StatelessWidget {
  const StartView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(Assets.imagesGRADINET, fit: BoxFit.cover),
            ),
            Center(
              child: Column(
                children: [
                  const SizedBox(height: 80),
                  const Padding(
                    padding: EdgeInsets.only(right: 180.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Good morning,',
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Text(
                          'New topic is waiting',
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => questionsView(),
                            ),
                          );
                        },
                        child: const Text(
                          'Start Quiz',
                          style: TextStyle(height: 2.5, fontSize: 16),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
