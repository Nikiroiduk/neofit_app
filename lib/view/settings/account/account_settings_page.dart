import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../router/router.dart';

class AccountSettingsPage extends StatelessWidget {
  const AccountSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              onTap: () => context.push(Screens.accountSettingsUsername.path),
              title: const Text('Username'),
            ),
            ListTile(
              onTap: () => context.push(Screens.accountSettingsPassword.path),
              title: const Text('Password'),
            ),
            ListTile(
              onTap: () => context.push(Screens.accountSettingsEmail.path),
              title: const Text('Email'),
            ),
          ],
        ),
      ),
    );
  }
}
