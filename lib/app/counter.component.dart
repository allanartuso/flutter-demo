import 'package:flutter/material.dart';

class CounterComponent extends StatelessWidget {
  final int counter;

  const CounterComponent({super.key, required this.counter});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'Counter: $counter',
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}
