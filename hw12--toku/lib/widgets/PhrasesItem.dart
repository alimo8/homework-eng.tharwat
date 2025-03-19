import 'package:flutter/material.dart';
import 'package:toku/models/numbers_model.dart';
import 'package:toku/widgets/infoItem.dart';

class PhrasesItem extends StatelessWidget {
  const PhrasesItem({Key? key, required this.item, required this.color})
      : super(key: key);
  final ItemModel item;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: color,
      child: InfoItem(item: item),
    );
  }
}
