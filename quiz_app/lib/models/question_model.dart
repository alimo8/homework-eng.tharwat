class QuestionModel {
  final String question;
  final List<String> options;
  final int correctAnsewrIndex;

  const QuestionModel({
    required this.question,
    required this.options,
    required this.correctAnsewrIndex,
  });
}

const List<QuestionModel> questions = [
  QuestionModel(
    question: 'What is the capital city of Japan?',
    options: ['Seoul', 'Beijing', 'Tokyo', 'Bangkok'],
    correctAnsewrIndex: 2,
  ),
  QuestionModel(
    question: 'Which language is used to build Flutter apps?',
    options: ['Java', 'Swift', 'Dart', 'C#'],
    correctAnsewrIndex: 2,
  ),
  QuestionModel(
    question: 'How many legs does a spider have?',
    options: ['6', '8', '10', '12'],
    correctAnsewrIndex: 1,
  ),
  QuestionModel(
    question: 'What gas do plants absorb from the atmosphere?',
    options: ['Oxygen', 'Carbon Dioxide', 'Nitrogen', 'Hydrogen'],
    correctAnsewrIndex: 1,
  ),
];
