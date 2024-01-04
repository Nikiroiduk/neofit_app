import 'package:flutter/material.dart';

class WaistMeasurePage extends StatelessWidget {
  const WaistMeasurePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Waist'),
      ),
      body: const Center(
        child: Text('Waist statistics'),
      ),
    );
  }
}
