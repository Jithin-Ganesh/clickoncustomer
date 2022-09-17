import 'dart:math';

import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const Responsive({
    Key? key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  }) : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 850;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
          MediaQuery.of(context).size.width >= 850;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1100) {
          print('desktop ${constraints.maxWidth}');
          return desktop;
          //1100
        } else if (constraints.maxWidth<1313 && constraints.maxWidth>=850) {
          print('tablet ${constraints.maxWidth}');
          return tablet ;
        } else {
          print('mobile ${constraints.maxWidth}');
          return mobile;
        }
      },
    );
  }
}
