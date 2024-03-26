import 'package:flutter/material.dart';
import 'package:get/get.dart';

pop() => Navigator.pop(Get.context!);

/// Launch a new screen
Future<dynamic> launchScreen(Widget child,
    {bool pushAndRemove = false,
    bool replace = false,
    Duration? duration}) async {
  if (pushAndRemove) {
    return await Navigator.of(Get.context!).pushAndRemoveUntil(
        CustomPageRoute(
          child: child,
          curve: Curves.easeInOut,
          begin: const Offset(1.0, 0.0),
          end: Offset.zero,
        ),
        (route) => false);
  } else if (replace) {
    return await Navigator.of(Get.context!).pushReplacement(CustomPageRoute(
      child: child,
      curve: Curves.easeInOut,
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ));
  } else {
    return await Navigator.of(Get.context!).push(CustomPageRoute(
      child: child,
      curve: Curves.easeInOut,
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ));
  }
}

class CustomPageRoute<T> extends PageRouteBuilder<T> {
  final Widget child;
  final Curve curve;
  final Offset begin;
  final Offset end;

  CustomPageRoute(
      {required this.child,
      required this.curve,
      required this.begin,
      required this.end})
      : super(
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return child;
          },
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            final tween = Tween(begin: begin, end: end);
            final curvedAnimation =
                CurvedAnimation(parent: animation, curve: curve);
            return SlideTransition(
              position: tween.animate(curvedAnimation),
              child: ScaleTransition(
                scale: Tween<double>(begin: 0.9, end: 1.0)
                    .animate(curvedAnimation),
                child: child,
              ),
            );
          },
          transitionDuration: const Duration(milliseconds: 250),
        );
}
