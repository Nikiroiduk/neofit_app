import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:neofit_app/view/onboarding/onboarding_images.dart';
import 'package:neofit_app/router/utils.dart';
// import 'package:neofit_app/view/themes/themes.dart';

// TODO: swipe geasture

const int initialPage = 0;
const int animationDurationMilliseconds = 500;

final pageProvider = StateProvider<int>((ref) => initialPage);

class OnboardingPage {
  OnboardingPage(
      {required this.onboardingPageImage, required this.onboardingPageText});
  final String onboardingPageImage;
  final String onboardingPageText;
}

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final PageController _pageController =
      PageController(initialPage: initialPage);

  @override
  Widget build(BuildContext context) {
    var currentScheme = Theme.of(context).colorScheme;
    debugPrint('\t!!! pages list created\t!!!');
    final List<OnboardingPage> pages = [
      OnboardingPage(
          onboardingPageImage: OnboardingImages.gymExercises(currentScheme),
          onboardingPageText: 'some text'),
      OnboardingPage(
          onboardingPageImage: OnboardingImages.visualData(currentScheme),
          onboardingPageText: 'some text'),
      OnboardingPage(
          onboardingPageImage: OnboardingImages.shareWithFriends(currentScheme),
          onboardingPageText: 'some text'),
    ];
    return Scaffold(
      body: PageView.builder(
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SvgPicture.string(
                //   pages[index].onboardingPageImage,
                //   colorFilter: ColorFilter.matrix(<double>[
                //     (currentScheme.primary.red / 255),
                //     (currentScheme.primary.green / 255),
                //     (currentScheme.primary.blue / 255),
                //     0,
                //     0,
                //     0,
                //     0,
                //     0,
                //     0,
                //     0,
                //     0,
                //     0,
                //     0,
                //     0,
                //     0,
                //     0,
                //     0,
                //     0,
                //     1,
                //     0,
                //   ]),
                // ),
                // Image.asset(
                //   'assets/images/Group8.png',
                //   colorBlendMode: BlendMode.modulate,
                //   color: currentScheme.primary,
                // ),
                // ColorFiltered(
                //   colorFilter:
                //       ColorFilter.mode(currentScheme.primary, BlendMode.color),
                //   child: Image.asset(
                //     'assets/images/Group8.png',
                //     // colorBlendMode: BlendMode.color,
                //     // color: currentScheme.background
                //     //     .harmonizeWith(currentScheme.primary),
                //   ),
                // ),

                SvgPicture.string(
                  pages[index].onboardingPageImage,
                ),
                Text(pages[index].onboardingPageText),
              ],
            );
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
                        : () {
                            ref.read(pageProvider.notifier).state = initialPage;
                            context.go(Screens.feed.path);
                          },
                    child: tmp > 0 ? const Text('Prev') : const Text('Skip'),
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
                  onPressed: tmp < pages.length - 1
                      ? () {
                          ref.read(pageProvider.notifier).state++;
                          _pageController.nextPage(
                              duration: const Duration(
                                  milliseconds: animationDurationMilliseconds),
                              curve: Curves.ease);
                        }
                      : () {
                          context.go(Screens.feed.path);
                          ref.read(pageProvider.notifier).state = initialPage;
                        },
                  child: tmp < pages.length - 1
                      ? const Text('Next')
                      : const Text('Done'),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
