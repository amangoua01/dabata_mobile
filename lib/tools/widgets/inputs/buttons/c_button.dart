import 'package:dabata_mobile/tools/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CButton extends StatelessWidget {
  final Widget? child;
  final double? height;
  final double? minWidth;
  final Color color;
  final double? elevation;
  final Color? textColor;
  final double borderRadius;
  final ShapeBorder? shape;
  final void Function()? onPressed;
  final Color? disabledTextColor;
  final Color? disabledColor;
  final bool enable;
  final EdgeInsetsGeometry padding;

  const CButton({
    super.key,
    this.shape,
    this.child,
    this.height,
    this.minWidth,
    this.elevation = 0,
    this.disabledColor,
    this.enable = true,
    this.borderRadius = 12,
    this.disabledTextColor,
    required this.onPressed,
    this.textColor = Colors.white,
    this.color = AppColors.backColor,
    this.padding = const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      textColor: textColor,
      elevation: elevation,
      hoverElevation: 0,
      highlightElevation: 0,
      disabledElevation: 0,
      focusElevation: 0,
      color: color,
      height: height ?? 40,
      minWidth: minWidth,
      disabledColor: disabledColor ?? AppColors.backColor.withOpacity(0.5),
      disabledTextColor: disabledTextColor,
      shape: shape ??
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              borderRadius,
            ),
          ),
      onPressed: (enable) ? onPressed : null,
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }
}
