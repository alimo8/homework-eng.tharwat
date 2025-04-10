import 'package:flutter/material.dart';
import 'package:quiz_app/constants/assets.dart';
import 'package:quiz_app/models/question_model.dart';
import 'package:quiz_app/style/app_color.dart';
import 'package:quiz_app/widgets/answer_card.dart';
import 'package:quiz_app/widgets/custom_bottom.dart';

class QuestionsView extends StatefulWidget {
  const QuestionsView({super.key});

  @override
  State<QuestionsView> createState() => _QuestionsViewState();
}

class _QuestionsViewState extends State<QuestionsView> {
  int? selectedAnswerIndex;
  int questionIndex = 0;
  int score = 0;

  bool get isLastQuestion => questionIndex == questions.length - 1;

  void pickAnswer(int value) {
    setState(() {
      selectedAnswerIndex = value;
      final question = questions[questionIndex];
      if (selectedAnswerIndex == question.correctAnsewrIndex) {
        score++;
      }
    });
  }

  void goToNext() {
    if (!isLastQuestion) {
      setState(() {
        questionIndex++;
        selectedAnswerIndex = null;
      });
    } else {
      // لو آخر سؤال، ممكن تروح لصفحة النتيجة هنا
      print('النتيجة: $score من ${questions.length}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[questionIndex];

    return Scaffold(
      body: Stack(
        children: [
          /// الخلفية
          Positioned.fill(
            child: Image.asset(Assets.imagesGRADINET, fit: BoxFit.cover),
          ),

          /// العنوان في الأعلى
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
                  child: Text(
                    'Question ${questionIndex + 1}',
                    style: const TextStyle(
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

          /// المحتوى في المنتصف
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  /// السؤال
                  Text(
                    question.question,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 22,
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),

                  /// الخيارات - ثابتة بدون Scroll
                  ...List.generate(question.options.length, (index) {
                    return GestureDetector(
                      onTap:
                          selectedAnswerIndex == null
                              ? () => pickAnswer(index)
                              : null,
                      child: AnswerCard(
                        selecttAnswerIndex: selectedAnswerIndex,
                        correctAnswerIndex: question.correctAnsewrIndex,
                        question: question.options[index],
                        isSelescted: selectedAnswerIndex == index,
                        currentIndex: index,
                      ),
                    );
                  }),

                  const SizedBox(height: 20),

                  /// زرار التالي أو إنهاء
                  isLastQuestion
                      ? CustomBottom(
                        onPressed: () {
                          // الانتقال إلى نتيجة أو نهاية
                        },
                        label: 'Finish',
                      )
                      : CustomBottom(
                        onPressed:
                            selectedAnswerIndex != null ? goToNext : null,
                        label: 'Next',
                      ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
