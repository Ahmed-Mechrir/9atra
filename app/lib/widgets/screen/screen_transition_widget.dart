import 'package:flutter/material.dart';

class TopTransitionWidget extends PageRouteBuilder {
  final Widget page;

  TopTransitionWidget(
    this.page,
  ) : super(
          pageBuilder: (
            context,
            animation,
            anotherAnimation,
          ) =>
              page,
          transitionDuration: const Duration(
            milliseconds: 1000,
          ),
          reverseTransitionDuration: const Duration(
            milliseconds: 200,
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
              reverseCurve: Curves.fastOutSlowIn,
            );
            return Align(
              alignment: Alignment.topCenter,
              child: SizeTransition(
                sizeFactor: animation,
                axisAlignment: 0,
                child: page,
              ),
            );
          },
        );
}

class BottomTransitionWidget extends PageRouteBuilder {
  final Widget page;

  BottomTransitionWidget(
    this.page,
  ) : super(
          pageBuilder: (
            context,
            animation,
            anotherAnimation,
          ) =>
              page,
          transitionDuration: const Duration(
            milliseconds: 1000,
          ),
          reverseTransitionDuration: const Duration(
            milliseconds: 200,
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
              reverseCurve: Curves.fastOutSlowIn,
            );
            return Align(
              alignment: Alignment.bottomCenter,
              child: SizeTransition(
                sizeFactor: animation,
                axisAlignment: 0,
                child: page,
              ),
            );
          },
        );
}

class RightTransitionWidget extends PageRouteBuilder {
  final Widget page;

  RightTransitionWidget(
    this.page,
  ) : super(
          pageBuilder: (
            context,
            animation,
            anotherAnimation,
          ) =>
              page,
          transitionDuration: const Duration(
            milliseconds: 1000,
          ),
          reverseTransitionDuration: const Duration(
            milliseconds: 200,
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
              reverseCurve: Curves.fastOutSlowIn,
            );
            return Align(
              alignment: Alignment.centerRight,
              child: SizeTransition(
                axis: Axis.horizontal,
                sizeFactor: animation,
                axisAlignment: 0,
                child: page,
              ),
            );
          },
        );
}

class LeftTransitionWidget extends PageRouteBuilder {
  final Widget page;

  LeftTransitionWidget(
    this.page,
  ) : super(
          pageBuilder: (
            context,
            animation,
            anotherAnimation,
          ) =>
              page,
          transitionDuration: const Duration(
            milliseconds: 1000,
          ),
          reverseTransitionDuration: const Duration(
            milliseconds: 200,
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
              reverseCurve: Curves.fastOutSlowIn,
            );
            return Align(
              alignment: Alignment.centerLeft,
              child: SizeTransition(
                axis: Axis.horizontal,
                sizeFactor: animation,
                axisAlignment: 0,
                child: page,
              ),
            );
          },
        );
}

class CenterTransitionWidget extends PageRouteBuilder {
  final Widget page;

  CenterTransitionWidget(
    this.page,
  ) : super(
          pageBuilder: (
            context,
            animation,
            anotherAnimation,
          ) =>
              page,
          transitionDuration: const Duration(
            milliseconds: 1000,
          ),
          reverseTransitionDuration: const Duration(
            milliseconds: 200,
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
              reverseCurve: Curves.fastOutSlowIn,
            );
            return Align(
              alignment: Alignment.center,
              child: SizeTransition(
                axis: Axis.horizontal,
                sizeFactor: animation,
                axisAlignment: 0,
                child: page,
              ),
            );
          },
        );
}
