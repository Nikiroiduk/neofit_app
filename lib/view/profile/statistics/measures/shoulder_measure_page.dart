import 'package:flutter/material.dart';

class ShoulderMeasurePage extends StatelessWidget {
  const ShoulderMeasurePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shoulder'),
      ),
      body: const Center(
        child: Text('Shoulder statistics'),
      ),
    );
  }
}
