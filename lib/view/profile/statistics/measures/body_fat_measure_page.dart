import 'package:flutter/material.dart';

class BodyFatMeasurePage extends StatelessWidget {
  const BodyFatMeasurePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Body fat'),
      ),
      body: const Center(
        child: Text('Body fat statistics'),
      ),
    );
  }
}
