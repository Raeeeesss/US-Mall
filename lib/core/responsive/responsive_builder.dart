import 'package:flutter/material.dart';

class ResponsiveBuilder extends StatelessWidget {
  final Widget child;
  final double maxWidth;

  const ResponsiveBuilder({
    super.key,
    required this.child,
    this.maxWidth = 480.0,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: child,
      ),
    );
  }
}
