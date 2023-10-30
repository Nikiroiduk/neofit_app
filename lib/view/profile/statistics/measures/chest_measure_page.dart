import 'package:flutter/material.dart';

class ChestMeasurePage extends StatelessWidget {
  const ChestMeasurePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chest'),
      ),
      body: const Center(
        child: Text('Chest statistics'),
      ),
    );
  }
}
