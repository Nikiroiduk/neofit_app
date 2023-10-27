import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MuscleDistributionStatisticsPage extends StatelessWidget {
  const MuscleDistributionStatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Muscle distribution'),
      ),
      body: const Center(
        child: Text('Muscle distribution statistics'),
      ),
    );
  }
}
