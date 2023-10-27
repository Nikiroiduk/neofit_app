import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotificationsSettingsPage extends StatelessWidget {
  const NotificationsSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: const Center(
        child: Text('Notifications settings'),
      ),
    );
  }
}
