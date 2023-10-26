import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:neofit_app/router/utils.dart';

import '../../dashboard_screen/dashboard.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Consumer(
          builder: (context, ref, child) {
            return IconButton(
              icon: const Icon(Icons.close_rounded),
              onPressed: () =>
                  context.go(ref.watch(dashboardNotifierProvider).path),
            );
          },
        ),
        title: const Text('Statistics'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              onTap: () => context.push(Screens.measuresStatistics.path),
              title: const Text('Measures'),
            ),
            ListTile(
              onTap: () =>
                  context.push(Screens.muscleDistributionStatistics.path),
              title: const Text('Muscle distribution'),
            ),
          ],
        ),
      ),
    );
  }
}
