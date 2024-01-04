import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PasswordRestorationPage extends StatelessWidget {
  const PasswordRestorationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Password restoration'),
        leading: IconButton(
            onPressed: () => context.pop(), icon: const Icon(Icons.close)),
      ),
      body: const Center(
        child: Text('Restoration'),
      ),
    );
  }
}
