// Write a function that takes a sentence as input and returns the longest word in the sentence.
// If multiple words have the same longest length, return the first one that appears

import 'dart:io';

String findLongestWord(String sentence) {
  List<String> words = sentence.split(' ');
  String longestWord = '';

  for (String word in words) {
    if (word.length > longestWord.length) {
      longestWord = word;
    }
  }

  return longestWord;
}

void main() {
  print('Enter a sentence: ');
  String sentence = stdin.readLineSync()!;

  print('Longest word: ${findLongestWord(sentence)}');
}
