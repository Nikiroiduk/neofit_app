import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:neofit_app/assets/images/onboarding_images.dart';
import 'package:neofit_app/router/utils.dart';

// TODO: Save state (completed or not)

const int initialPage = 0;
const int animationDurationMilliseconds = 500;

final pageProvider = StateProvider<int>((ref) => initialPage);

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final PageController _pageController =
      PageController(initialPage: initialPage);

  final List<Widget> _pages = [
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.string(
          OnboardingImages.gymExercises,
        ),
        const Text('Some text on onboarding page'),
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.string(
          OnboardingImages.visualData,
        ),
        const Text('Some text on onboarding page'),
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.string(
          OnboardingImages.shareWithFriends,
        ),
        const Text('Some text on onboarding page'),
      ],
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          itemBuilder: (context, index) {
            return _pages[index];
          },
          controller: _pageController),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
              left: 30,
              bottom: 10,
              child: Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  var tmp = ref.watch(pageProvider);
                  return TextButton(
                    onPressed: tmp > 0
                        ? () {
                            ref.read(pageProvider.notifier).state--;
                            _pageController.previousPage(
                                duration: const Duration(
                                    milliseconds:
                                        animationDurationMilliseconds),
                                curve: Curves.ease);
                          }
                        : () => context.go(Screens.feed.path),
                    child: tmp > 0 ? const Text('prev') : const Text('skip'),
                  );
                },
              )),
          Positioned(
            right: 30,
            bottom: 10,
            child: Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                var tmp = ref.watch(pageProvider);
                return TextButton(
                  onPressed: tmp < _pages.length - 1
                      ? () {
                          ref.read(pageProvider.notifier).state++;
                          _pageController.nextPage(
                              duration: const Duration(
                                  milliseconds: animationDurationMilliseconds),
                              curve: Curves.ease);
                        }
                      : () => context.go(Screens.feed.path),
                  child: tmp < _pages.length - 1
                      ? const Text('next')
                      : const Text('done'),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
