import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UnitsSettingsPage extends StatelessWidget {
  const UnitsSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => context.pop(),
              icon: const Icon(Icons.arrow_back_rounded))
        ],
        title: const Text('Units'),
      ),
      body: const Center(
        child: Text('Units settings'),
      ),
    );
  }
}
