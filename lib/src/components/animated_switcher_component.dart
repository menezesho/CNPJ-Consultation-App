import 'package:fipe_consultation/src/core/enum.dart';
import 'package:flutter/material.dart';

class AnimatedSwitcherComponent extends StatelessWidget {
  final Widget child;
  final int durationInMilliseconds;
  final AnimatedSwitcherComponentTransitionType transitionType;

  const AnimatedSwitcherComponent({
    super.key,
    required this.child,
    this.durationInMilliseconds = 200,
    this.transitionType = AnimatedSwitcherComponentTransitionType.fade,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: durationInMilliseconds),
      transitionBuilder: (child, animation) {
        switch (transitionType) {
          case AnimatedSwitcherComponentTransitionType.fade:
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          case AnimatedSwitcherComponentTransitionType.scale:
            return ScaleTransition(
              scale: animation,
              child: child,
            );
          default:
            return FadeTransition(
              opacity: animation,
              child: child,
            );
        }
      },
      child: child,
    );
  }
}
