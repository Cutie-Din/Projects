import 'package:flutter/material.dart';

class ResponsiveUtils {
  static bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 600;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600 && MediaQuery.of(context).size.width < 1200;

  static bool isDesktop(BuildContext context) => MediaQuery.of(context).size.width >= 1200;
}

// Example usage in widgets
class ResponsiveWidget extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const ResponsiveWidget({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    if (ResponsiveUtils.isDesktop(context)) {
      return desktop;
    } else if (ResponsiveUtils.isTablet(context)) {
      return tablet;
    } else {
      return mobile;
    }
  }
}
