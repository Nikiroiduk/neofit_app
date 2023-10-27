import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:neofit_app/router/router.dart';

import '../../auth/auth.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign in'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                return ListTile(
                  onTap: () => ref
                      .read(authControllerProvider.notifier)
                      .login('email', 'password'),
                  enabled:
                      ref.watch(authControllerProvider) is! AuthStateLoading,
                  title: const Text('Sign in'),
                );
              },
            ),
            TextButton(
                onPressed: () => context.go(Screens.signUp.path),
                child: const Text('Sign up')),
          ],
        ),
      ),
    );
  }
}
