import 'package:flutter/material.dart';

class WorkoutsSettingsPage extends StatelessWidget {
  const WorkoutsSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workouts'),
      ),
      body: const Center(
        child: Text('Workouts settings'),
      ),
    );
  }
}
