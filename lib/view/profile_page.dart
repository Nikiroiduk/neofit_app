import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../router/router.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Profile'),
          TextButton(
              onPressed:() => context.go(Screens.settings.path),
              child: const Text('Settings')),
        ]);
  }
}
