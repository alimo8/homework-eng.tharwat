import 'package:flutter/material.dart';
import 'package:quiz_app/style/app_color.dart';
import 'package:quiz_app/style/app_text_style.dart';

class AnswerCard extends StatelessWidget {
  const AnswerCard({
    super.key,
    required this.question,
    required this.isSelescted,
    this.correctAnswerIndex,
    this.selecttAnswerIndex,
    required this.currentIndex,
  });

  final String question;
  final bool isSelescted;
  final int? correctAnswerIndex;
  final int? selecttAnswerIndex;
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    bool isCorrectAnswer = currentIndex == correctAnswerIndex;
    bool isWrongAnswer = !isCorrectAnswer && isSelescted;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child:
          selecttAnswerIndex != null
              ? Container(
                height: 70,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    width: 2,
                    color:
                        isCorrectAnswer
                            ? AppColors.mainViolet
                            : isWrongAnswer
                            ? Colors.red
                            : AppColors.white,
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(question, style: AppTextStyle.h2regular18),
                    ),
                    const SizedBox(height: 10),
                    isCorrectAnswer
                        ? buildCorrectIcon()
                        : isWrongAnswer
                        ? buildWorngIcon()
                        : SizedBox.shrink(),
                  ],
                ),
              )
              : Container(
                height: 70,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: AppColors.white),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(question, style: AppTextStyle.h2regular18),
                    ),
                    // const SizedBox(height: 10),
                  ],
                ),
              ),
    );
  }
}

Widget buildCorrectIcon() => CircleAvatar(
  radius: 15,
  backgroundColor: Colors.green,
  child: Icon(Icons.check_circle, color: Colors.white),
);
Widget buildWorngIcon() => CircleAvatar(
  radius: 15,
  backgroundColor: Colors.red,
  child: Icon(Icons.check_circle, color: Colors.white),
);
