import 'package:flutter/material.dart';

class SideEffectInBuildBad extends StatefulWidget {
  const SideEffectInBuildBad({super.key});

  @override
  State<SideEffectInBuildBad> createState() => _SideEffectInBuildBadState();
}

class _SideEffectInBuildBadState extends State<SideEffectInBuildBad> {
  List<String> items = [];
  String? selected;

  Future<void> loadDataBad() async {
    await Future.delayed(const Duration(milliseconds: 300));
    items = ['A', 'B', 'C'];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      loadDataBad();
    }
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return ListTile(
          title: Text(item),
          onTap: () {
            setState(() {
              selected = item;
              loadDataBad();
            });
          },
        );
      },
    );
  }
}
