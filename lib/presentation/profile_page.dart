import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../router/router.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Username'),
        actions: [
          IconButton(
              onPressed: () => context.go(Screens.settings.path),
              icon: const Icon(Icons.settings_rounded))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
