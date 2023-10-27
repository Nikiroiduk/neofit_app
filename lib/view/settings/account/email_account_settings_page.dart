import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EmailAccountSettingsPage extends StatelessWidget {
  const EmailAccountSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Email'),
      ),
      body: const Center(
        child: Text('Email settings'),
      ),
    );
  }
}
