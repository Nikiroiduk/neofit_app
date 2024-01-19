import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:neofit_app/domain/connectivity_status_provider.dart';
import 'package:neofit_app/domain/user/user_controller.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        ref.read(connectivityStatusProvider);
        return Column(children: [
          TextButton(
            onPressed: () async {
              await ref.read(userProvider.notifier).getUser();
            },
            child: const Text('get user'),
          ),
        ]);
      },
    );
  }
}
