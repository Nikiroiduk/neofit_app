import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:neofit_app/router/router.dart';

class MeasuresStatisticsPage extends StatelessWidget {
  const MeasuresStatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => context.pop(),
              icon: const Icon(Icons.arrow_back_rounded))
        ],
        title: const Text('Measures'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              onTap: () => context.push(Screens.bodyFatMeasure.path),
              title: const Text('Body fat'),
            ),
            ListTile(
              onTap: () => context.push(Screens.chestMeasure.path),
              title: const Text('Chest'),
            ),
            ListTile(
              onTap: () => context.push(Screens.heightMeasure.path),
              title: const Text('Height'),
            ),
            ListTile(
              onTap: () => context.push(Screens.neckMeasure.path),
              title: const Text('Neck'),
            ),
            ListTile(
              onTap: () => context.push(Screens.shoulderMeasure.path),
              title: const Text('Shoulder'),
            ),
            ListTile(
              onTap: () => context.push(Screens.waistMeasure.path),
              title: const Text('Waist'),
            ),
            ListTile(
              onTap: () => context.push(Screens.weightMeasure.path),
              title: const Text('Weight'),
            ),
          ],
        ),
      ),
    );
  }
}
