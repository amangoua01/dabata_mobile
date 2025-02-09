import 'package:flutter/material.dart';

class PlaceHolderWidget extends StatelessWidget {
  final Widget child;
  final Widget placeholder;
  final bool condition;
  const PlaceHolderWidget({
    this.condition = true,
    required this.child,
    this.placeholder = const SizedBox.shrink(),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (condition) {
      return child;
    } else {
      return placeholder;
    }
  }
}
