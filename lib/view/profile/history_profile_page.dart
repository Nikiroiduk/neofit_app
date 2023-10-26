import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:neofit_app/router/router.dart';
import 'package:neofit_app/view/dashboard_screen/dashboard.dart';

class HistoryProfilePage extends StatelessWidget {
  const HistoryProfilePage({super.key});

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
        title: const Text('History'),
      ),
      body: const Center(
        child: Text('Workout history'),
      ),
    );
  }
}
