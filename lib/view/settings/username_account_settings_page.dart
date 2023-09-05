import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UsernameAccountSettingsPage extends StatelessWidget {
  const UsernameAccountSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(Icons.arrow_back_rounded))
      ], title: const Text('Username'),),
      body: const Center(
        child: Text('Username settings'),
      ),
    );
  }
}
