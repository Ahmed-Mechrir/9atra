import 'package:flutter/material.dart';

class SlideTransitionAnimationWidget extends PageRouteBuilder {
  final Widget page;

  SlideTransitionAnimationWidget(this.page)
      : super(
          pageBuilder: (
            context,
            animation,
            anotherAnimation,
          ) =>
              page,
          transitionDuration: const Duration(
            milliseconds: 2000,
          ),
          transitionsBuilder: (
            context,
            animation,
            anotherAnimation,
            child,
          ) {
            animation = CurvedAnimation(
              curve: Curves.fastLinearToSlowEaseIn,
              parent: animation,
            );
            return SlideTransition(
              position: Tween(
                begin: const Offset(
                  1.0,
                  0.0,
                ),
                end: const Offset(
                  0.0,
                  0.0,
                ),
              ).animate(animation),
              textDirection: TextDirection.rtl,
              child: page,
            );
          },
        );
}
