import 'package:flutter/material.dart';

class NeckMeasurePage extends StatelessWidget {
  const NeckMeasurePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Neck'),
      ),
      body: const Center(
        child: Text('Neck statistics'),
      ),
    );
  }
}
