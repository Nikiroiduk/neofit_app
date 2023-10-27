import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UsernameAccountSettingsPage extends StatelessWidget {
  const UsernameAccountSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Username'),
      ),
      body: const Center(
        child: Text('Username settings'),
      ),
    );
  }
}
