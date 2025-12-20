import 'package:flutter/material.dart';

class ListItemWidget extends StatelessWidget {
  final int index;
  final String title;
  final String subtitle;

  const ListItemWidget({
    super.key,
    required this.index,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: Icon(Icons.inbox),
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }
}
