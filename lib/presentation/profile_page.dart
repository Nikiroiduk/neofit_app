import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../router/router.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.all(8.0),
      child: Scaffold(
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
      ),
    );
    // return Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     children: [
    //       const Text('Profile'),
    //       TextButton(
    //           onPressed: () => context.go(Screens.settings.path),
    //           child: const Text('Settings')),
    //       TextButton(
    //           onPressed: () => context.go(Screens.statistics.path),
    //           child: const Text('Statistics')),
    //       TextButton(
    //           onPressed: () => context.go(Screens.historyProfile.path),
    //           child: const Text('History')),
    //       TextButton(
    //           onPressed: () =>
    //               context.go(Screens.followersFollowingProfile.path),
    //           child: const Text('Followers')),
    //       TextButton(
    //           onPressed: () =>
    //               context.go(Screens.followersFollowingProfile.path),
    //           child: const Text('Following')),
    //       Consumer(
    //         builder: (BuildContext context, WidgetRef ref, Widget? child) {
    //           var isBtnActive =
    //               ref.watch(authControllerProvider) is! AuthStateLoading;
    //           return TextButton(
    //             onPressed: isBtnActive
    //                 ? () => ref.read(authControllerProvider.notifier).logout()
    //                 : null,
    //             child: const Text('Sign Out'),
    //           );
    //         },
    //       ),
    //     ]);
  }
}
