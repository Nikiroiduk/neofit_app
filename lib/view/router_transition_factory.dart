import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum Transitions { fade, rotation, size, scale, slide }

class RouterTransitionFactory {
  static CustomTransitionPage getTransitionPage(
      {required BuildContext context,
      required GoRouterState state,
      required Widget child,
      required Transitions type}) {
    return CustomTransitionPage(
        key: state.pageKey,
        child: child,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          switch (type) {
            case Transitions.fade:
              return FadeTransition(opacity: animation, child: child);
            case Transitions.rotation:
              return RotationTransition(turns: animation, child: child);
            case Transitions.size:
              return SizeTransition(sizeFactor: animation, child: child);
            case Transitions.scale:
              return ScaleTransition(scale: animation, child: child);
            case Transitions.slide:
              return SlideTransition(
                position: animation.drive(Tween<Offset>(
                  begin: const Offset(1, 0),
                  end: Offset.zero,
                ).chain(CurveTween(curve: Curves.easeInOutCirc))),
                child: child,
              );
            default:
              return FadeTransition(opacity: animation, child: child);
          }
        });
  }
}
