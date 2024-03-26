import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget largeScreen;
  final Widget? mediumScreen;
  final Widget? smallScreen;

  const ResponsiveWidget({
    Key? key,
    required this.largeScreen,
    this.mediumScreen,
    this.smallScreen,
  }) : super(key: key);

  static bool isWeb() {
    return MediaQuery.sizeOf(Get.context!).width >= 1024;
  }

  static bool isTablet() {
    return MediaQuery.sizeOf(Get.context!).width >= 600 &&
        MediaQuery.sizeOf(Get.context!).width <= 1024;
  }

  static bool isMobile({BuildContext? context}) {
    return MediaQuery.sizeOf(context ?? Get.context!).width < 600;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1024) {
          return largeScreen;
        } else if (constraints.maxWidth <= 1024 &&
            constraints.maxWidth >= 600) {
          return mediumScreen ?? largeScreen;
        } else {
          return smallScreen ?? largeScreen;
        }
      },
    );
  }
}
