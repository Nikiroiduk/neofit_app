import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HeightMeasurePage extends StatelessWidget {
  const HeightMeasurePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Height'),
      ),
      body: const Center(
        child: Text('Height statistics'),
      ),
    );
  }
}
