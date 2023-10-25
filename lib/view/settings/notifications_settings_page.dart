import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotificationsSettingsPage extends StatelessWidget {
  const NotificationsSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => context.pop(),
              icon: const Icon(Icons.arrow_back_rounded))
        ],
        title: const Text('Notifications'),
      ),
      body: const Center(
        child: Text('Notifications settings'),
      ),
    );
  }
}
