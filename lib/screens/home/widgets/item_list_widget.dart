import 'package:flutter/material.dart';
import 'list_item_widget.dart';

class ItemListWidget extends StatelessWidget {
  final int itemCount;

  const ItemListWidget({super.key, this.itemCount = 10});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return ListItemWidget(
            index: index + 1,
            title: 'Элемент ${index + 1}',
            subtitle: 'Описание элемента ${index + 1}',
          );
        },
      ),
    );
  }
}
