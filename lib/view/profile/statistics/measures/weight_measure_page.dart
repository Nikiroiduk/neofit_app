import 'package:flutter/material.dart';

class WeightMeasurePage extends StatelessWidget {
  const WeightMeasurePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weight'),
      ),
      body: const Center(
        child: Text('Weight statistics'),
      ),
    );
  }
}
