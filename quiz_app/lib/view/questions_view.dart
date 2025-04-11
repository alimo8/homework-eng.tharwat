import 'package:flutter/material.dart';
import 'package:quiz_app/constants/assets.dart';
import 'package:quiz_app/models/question_model.dart';
import 'package:quiz_app/style/app_color.dart';
import 'package:quiz_app/widgets/answer_card.dart';
import 'package:quiz_app/widgets/custom_bottom.dart';
import 'package:quiz_app/widgets/transparent_back_button.dart';
import 'package:quiz_app/view/result_view.dart';

class QuestionsView extends StatefulWidget {
  const QuestionsView({super.key});

  @override
  State<QuestionsView> createState() => _QuestionsViewState();
}

class _QuestionsViewState extends State<QuestionsView> {
  int questionIndex = 0;
  List<int?> selectedAnswers = List.filled(questions.length, null);

  bool get isLastQuestion => questionIndex == questions.length - 1;

  int get totalScore {
    int score = 0;
    for (int i = 0; i < questions.length; i++) {
      if (selectedAnswers[i] == questions[i].correctAnsewrIndex) {
        score++;
      }
    }
    return score;
  }

  void pickAnswer(int value) {
    setState(() {
      selectedAnswers[questionIndex] = value;
    });
  }

  void goToNext() {
    if (!isLastQuestion) {
      setState(() {
        questionIndex++;
      });
    }
  }

  void goToPrevious() {
    if (questionIndex > 0) {
      setState(() {
        questionIndex--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[questionIndex];
    final selectedAnswerIndex = selectedAnswers[questionIndex];

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(Assets.imagesGRADINET, fit: BoxFit.cover),
          ),
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
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
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
                  const SizedBox(height: 70),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TransparentBackButton(
                          onPressed: questionIndex > 0 ? goToPrevious : null,
                        ),
                      ),
                      const SizedBox(width: 40),
                      Expanded(
                        child:
                            isLastQuestion
                                ? CustomBottom(
                                  onPressed:
                                      selectedAnswerIndex != null
                                          ? () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder:
                                                    (context) => ResultView(
                                                      score: totalScore,
                                                      totalQuestions:
                                                          questions.length,
                                                    ),
                                              ),
                                            );
                                          }
                                          : null,
                                  label: 'Finish',
                                )
                                : CustomBottom(
                                  onPressed:
                                      selectedAnswerIndex != null
                                          ? goToNext
                                          : null,
                                  label: 'Next',
                                ),
                      ),
                    ],
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
