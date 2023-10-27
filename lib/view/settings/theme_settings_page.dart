import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ThemeSettingsPage extends StatelessWidget {
  const ThemeSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme'),
      ),
      body: const Center(
        child: Text('Theme settings'),
      ),
    );
  }
}
