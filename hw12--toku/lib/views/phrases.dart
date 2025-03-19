import 'package:flutter/material.dart';
import 'package:toku/models/numbers_model.dart';
import 'package:toku/widgets/PhrasesItem.dart';

class Phrases extends StatelessWidget {
  Phrases({Key? key}) : super(key: key);
  final List<ItemModel> numbers = [
    ItemModel(
      sound: 'sounds/phrases/are_you_coming.wav',
      jpName: 'chichi',
      ename: 'are_you_coming',
    ),
    ItemModel(
        sound: 'sounds/family_members/daughter.wav',
        jpName: 'nialo',
        ename: 'daughter'),
    ItemModel(
        sound: 'sounds/numbers/number_three_sound.mp3',
        jpName: 'ryōshin',
        ename: 'grandfather'),
    ItemModel(
        sound: 'sounds/numbers/number_four_sound.mp3',
        jpName: 'yon',
        ename: 'grandmother'),
    ItemModel(
        sound: 'sounds/numbers/number_five_sound.mp3',
        jpName: 'haha',
        ename: 'mother'),
    ItemModel(
        sound: 'sounds/numbers/number_six_sound.mp3',
        jpName: 'ani',
        ename: 'brother'),
    ItemModel(
        sound: 'sounds/numbers/number_seven_sound.mp3',
        jpName: 'shimai',
        ename: 'sister'),
    ItemModel(
        sound: 'sounds/numbers/number_eight_sound.mp3',
        jpName: 'musuko',
        ename: 'son'),
    ItemModel(
        sound: 'sounds/numbers/number_nine_sound.mp3',
        jpName: 'musume',
        ename: 'brother'),
    ItemModel(
        sound: 'sounds/numbers/number_ten_sound.mp3',
        jpName: 'jū',
        ename: 'sister'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Text('Phrases'),
      ),
      body: ListView.builder(
        itemCount: numbers.length,
        itemBuilder: (context, index) {
          return PhrasesItem(color: Colors.blue, item: numbers[index]);
        },
      ),
    );
  }
}
