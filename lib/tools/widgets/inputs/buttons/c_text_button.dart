import 'package:flutter/material.dart';

class CTextButton extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final ButtonStyle? style;
  final Clip? clipBehavior;
  //final EdgeInsets padding;
  final void Function()? onPressed;
  final IconAlignment iconAlignment;

  const CTextButton({
    super.key,
    this.style,
    this.width,
    this.height,
    this.clipBehavior,
    required this.child,
    required this.onPressed,
    this.iconAlignment = IconAlignment.start,
    //this.padding = const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
