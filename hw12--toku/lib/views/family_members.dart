import 'package:flutter/material.dart';
import 'package:toku/models/numbers_model.dart';
import 'package:toku/widgets/item.dart';

class FamilyMembers extends StatelessWidget {
  FamilyMembers({Key? key}) : super(key: key);
  final List<ItemModel> numbers = [
    ItemModel(
      sound: 'sounds/family_members/grand father.wav',
      image: 'assets/images/family_members/family_father.png',
      jpName: 'chichi',
      ename: 'father',
    ),
    ItemModel(
        sound: 'sounds/family_members/daughter.wav',
        image: 'assets/images/family_members/family_daughter.png',
        jpName: 'nialo',
        ename: 'daughter'),
    ItemModel(
        sound: 'sounds/numbers/number_three_sound.mp3',
        image: 'assets/images/family_members/family_grandfather.png',
        jpName: 'ryōshin',
        ename: 'grandfather'),
    ItemModel(
        sound: 'sounds/numbers/number_four_sound.mp3',
        image: 'assets/images/family_members/family_grandmother.png',
        jpName: 'yon',
        ename: 'grandmother'),
    ItemModel(
        sound: 'sounds/numbers/number_five_sound.mp3',
        image: 'assets/images/family_members/family_mother.png',
        jpName: 'haha',
        ename: 'mother'),
    ItemModel(
        sound: 'sounds/numbers/number_six_sound.mp3',
        image: 'assets/images/family_members/family_older_brother.png',
        jpName: 'ani',
        ename: 'brother'),
    ItemModel(
        sound: 'sounds/numbers/number_seven_sound.mp3',
        image: 'assets/images/family_members/family_older_sister.png',
        jpName: 'shimai',
        ename: 'sister'),
    ItemModel(
        sound: 'sounds/numbers/number_eight_sound.mp3',
        image: 'assets/images/family_members/family_son.png',
        jpName: 'musuko',
        ename: 'son'),
    ItemModel(
        sound: 'sounds/numbers/number_nine_sound.mp3',
        image: 'assets/images/family_members/family_younger_brother.png',
        jpName: 'musume',
        ename: 'brother'),
    ItemModel(
        sound: 'sounds/numbers/number_ten_sound.mp3',
        image: 'assets/images/family_members/family_younger_sister.png',
        jpName: 'jū',
        ename: 'sister'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Text('Family Members'),
      ),
      body: ListView.builder(
        itemCount: numbers.length,
        itemBuilder: (context, index) {
          return ListItems(color: Colors.green, item: numbers[index]);
        },
      ),
    );
  }
}
