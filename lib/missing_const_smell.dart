import 'package:flutter/material.dart';

class MissingConstExampleBad extends StatelessWidget {
  const MissingConstExampleBad({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Hello'),
        SizedBox(height: 8),
        Icon(Icons.home),
      ],
    );
  }
}
