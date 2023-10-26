import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LanguageSettingsPage extends StatelessWidget {
  const LanguageSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => context.pop(),
              icon: const Icon(Icons.arrow_back_rounded))
        ],
        title: const Text('Language'),
      ),
      body: const Center(
        child: Text('Language settings'),
      ),
    );
  }
}