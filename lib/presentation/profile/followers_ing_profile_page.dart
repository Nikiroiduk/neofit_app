import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:neofit_app/router/router.dart';
import 'package:neofit_app/presentation/dashboard_screen/dashboard.dart';

class FollowersFollowingProfilePage extends StatelessWidget {
  const FollowersFollowingProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Consumer(
          builder: (context, ref, child) {
            return IconButton(
              icon: const Icon(Icons.close_rounded),
              onPressed: () =>
                  context.go(ref.watch(dashboardNotifierProvider).path),
            );
          },
        ),
        title: const Text('Follower/Following'),
      ),
      body: const Center(
        child: Text('Followers or Following page'),
      ),
    );
  }
}
