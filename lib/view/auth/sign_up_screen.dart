import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../auth/auth.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign up'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                return ListTile(
                  onTap: () => ref
                      .read(authControllerProvider.notifier)
                      .signUp('username', 'email', 'password'),
                  enabled:
                      ref.watch(authControllerProvider) is! AuthStateLoading,
                  title: const Text('Sign up'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
