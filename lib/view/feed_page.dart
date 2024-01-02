import 'package:flutter/material.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Feed'),
          // TextButton(
          //     onPressed: () => context.go(Screens.signIn.path),
          //     child: const Text('Sign In screen'))
        ]);
  }
}
