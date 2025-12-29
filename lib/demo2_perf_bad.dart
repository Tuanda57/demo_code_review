import 'dart:math';
import 'package:flutter/material.dart';

class Demo2PerfBad extends StatefulWidget {
  const Demo2PerfBad({super.key});

  @override
  State<Demo2PerfBad> createState() => _Demo2PerfBadState();
}

class _Demo2PerfBadState extends State<Demo2PerfBad> {
  int _count = 0;

  List<int> _expensiveSort() {
    // Simulate heavy work
    final r = Random(1);
    final list = List.generate(20000, (_) => r.nextInt(1000000));
    list.sort();
    return list;
  }

  @override
  Widget build(BuildContext context) {
    // BUG: heavy work inside build -> jank
    final sorted = _expensiveSort();

    return Scaffold(
      appBar: AppBar(title: Text("Demo 2 - Perf $_count")), // not const
      body: ListView.builder(
        itemCount: 200,
        itemBuilder: (context, index) {
          // BUG: using big list repeatedly
          return ListTile(
            title: Text("Item $index"),
            subtitle: Text("Random: ${sorted[index]}"),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => _count++),
        child: const Icon(Icons.add),
      ),
    );
  }
}
