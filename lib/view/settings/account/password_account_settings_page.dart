import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PasswordAccountSettingsPage extends StatelessWidget {
  const PasswordAccountSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Password'),
      ),
      body: const Center(
        child: Text('Password settings'),
      ),
    );
  }
}
