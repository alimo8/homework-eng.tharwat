import 'package:flutter/material.dart';
import 'package:toku/models/numbers_model.dart';
import 'package:toku/widgets/infoItem.dart';

class ListItems extends StatelessWidget {
  const ListItems({
    Key? key,
    required this.item,
    required this.color,
  }) : super(key: key);
  final ItemModel item;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: color,
      child: Row(
        children: [
          Container(color: Colors.teal, child: Image.asset(item.image!)),
          Expanded(child: InfoItem(item: item)),
        ],
      ),
    );
  }
}
