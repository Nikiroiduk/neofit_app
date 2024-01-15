import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:neofit_app/domain/user/user_controller.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return FutureBuilder(
          future: ref.read(userProvider.notifier).getUser(),
          builder: (context, snapshot) {
            return snapshot.hasData
                ? Text(snapshot.data!.toJson().toString())
                : const Text('Meh');
          },
        );
      },
    );
  }
}
