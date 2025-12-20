import 'package:flutter/material.dart';

class PageWidget extends StatelessWidget {
  final String title;
  final String description;
  final String? imagePath;
  final double? imagHeight;
  const PageWidget({
    super.key,
    required this.title,
    required this.description,
    this.imagePath,
    this.imagHeight = 200,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (imagePath != null)
            Container(
              height: imagHeight,
              margin: EdgeInsets.only(bottom: 32),
              child: Image.asset(imagePath!, fit: BoxFit.contain),
            ),
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
