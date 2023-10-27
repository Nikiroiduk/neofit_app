import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:neofit_app/router/router.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Feed'),
          // TextButton(
          //     onPressed: () => context.go(Screens.signIn.path),
          //     child: const Text('Sign In screen'))
        ]);
  }
}
