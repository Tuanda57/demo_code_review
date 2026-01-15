import 'package:flutter/material.dart';

class UndisposedControllerBad extends StatefulWidget {
  const UndisposedControllerBad({super.key});

  @override
  State<UndisposedControllerBad> createState() => _UndisposedControllerBadState();
}

class _UndisposedControllerBadState extends State<UndisposedControllerBad> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Undisposed Controller Bad')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: TextField(
          controller: controller,
          decoration: const InputDecoration(
            labelText: 'Type something',
          ),
        ),
      ),
    );
  }
}
