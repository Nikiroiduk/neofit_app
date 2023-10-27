import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UnitsSettingsPage extends StatelessWidget {
  const UnitsSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Units'),
      ),
      body: const Center(
        child: Text('Units settings'),
      ),
    );
  }
}
