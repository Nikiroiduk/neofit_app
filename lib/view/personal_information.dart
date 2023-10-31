import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:neofit_app/router/utils.dart';

class PersonalInformation extends StatelessWidget {
  const PersonalInformation({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Personal information'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
              bottom: 10,
              left: 30,
              child: TextButton(
                  onPressed: () => context.go(Screens.feed.path),
                  child: const Text('Skip'))),
          Positioned(
              bottom: 10,
              right: 30,
              child: FilledButton(
                  onPressed: () => context.go(Screens.feed.path),
                  child: const Text('Done'))),
        ],
      ),
    );
  }
}
