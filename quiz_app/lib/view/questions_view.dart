import 'package:flutter/material.dart';
import 'package:quiz_app/constants/assets.dart';
import 'package:quiz_app/models/question_model.dart';
import 'package:quiz_app/style/app_color.dart';
import 'package:quiz_app/widgets/answer_card.dart';

class questionsView extends StatefulWidget {
  const questionsView({super.key});

  @override
  State<questionsView> createState() => _questionsViewState();
}

class _questionsViewState extends State<questionsView> {
  int? selectAnsewrIndex;
  int questionIndex = 0;
  int score = 0;

  void pickAnswer(int value) {
    setState(() {
      selectAnsewrIndex = value;
      final question = questions[questionIndex];
      bool isLastQuestion = questionIndex == questions.length - 1;
      if (selectAnsewrIndex == question.correctAnsewrIndex) {
        score++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[questionIndex];

    return Scaffold(
      body: Stack(
        children: [
          /// ✅ الخلفية
          Positioned.fill(
            child: Image.asset(Assets.imagesGRADINET, fit: BoxFit.cover),
          ),

          /// ✅ "Question 1" في الأعلى
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 60.0,
                left: 16.0,
                right: 16.0,
              ),

              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  decoration: ShapeDecoration(
                    color: AppColors.secondaryViolet,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        width: 1,
                        color: AppColors.outlineViolet,
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  child: const Text(
                    'Question 1',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 14,
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          ),

          /// ✅ النص والزر في منتصف الصفحة
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// نص السؤال
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    question.question,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 22,
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: question.options.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap:
                          selectAnsewrIndex == null
                              ? () => pickAnswer(index)
                              : null,
                      child: AnswerCard(
                        selecttAnswerIndex: selectAnsewrIndex,
                        correctAnswerIndex: question.correctAnsewrIndex,
                        question: question.options[index],
                        isSelescted: selectAnsewrIndex == index,
                        currentIndex: index,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
