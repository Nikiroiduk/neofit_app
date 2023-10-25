import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WorkoutsSettingsPage extends StatelessWidget {
  const WorkoutsSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => context.pop(),
              icon: const Icon(Icons.arrow_back_rounded))
        ],
        title: const Text('Workouts'),
      ),
      body: const Center(
        child: Text('Workouts settings'),
      ),
    );
  }
}
