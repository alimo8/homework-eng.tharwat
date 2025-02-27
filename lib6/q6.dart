// Write a function that counts the number of words in a given sentence.
// Words are separated by spaces, and the function should ignore extra spaces

import 'dart:io';

int countWords(String sentence) {
  List<String> words = sentence.trim().split(RegExp(r'\s+'));
  return words.isEmpty ? 0 : words.length;
}

void main() {
  print('Enter a sentence: ');
  String sentence = stdin.readLineSync()!;

  print('Word count: ${countWords(sentence)}');
}
