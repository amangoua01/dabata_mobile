import 'package:dabata_mobile/tools/components/field_border.dart';
import 'package:flutter/material.dart';

class CTextField extends StatelessWidget {
  final String? labelText;
  final TextEditingController? controller;
  final bool obscureText;
  final bool require;
  final String requireText;
  final String? Function(String?)? validator;
  final String? hintText;
  final InputBorder? border;
  final InputBorder? errorBorder;
  final InputBorder? disabledBorder;
  final Widget? suffix;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Widget? prefix;
  final bool? filled;
  final Color? fillColor;
  final TextStyle? hintStyle;
  final void Function()? onTap;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final bool? enabled;
  final TextStyle? labelStyle;
  final String? counterText;

  const CTextField(
      {this.hintStyle,
      this.fillColor,
      this.filled = false,
      this.labelText,
      this.onTap,
      this.keyboardType,
      this.labelStyle,
      this.border,
      this.suffix,
      this.textCapitalization = TextCapitalization.none,
      this.suffixIcon,
      this.textInputAction,
      this.enabled,
      this.onChanged,
      this.prefixIcon,
      this.prefix,
      this.hintText,
      this.errorBorder,
      this.disabledBorder,
      this.counterText = "",
      this.controller,
      this.obscureText = false,
      this.require = false,
      this.requireText = "Ce champ est obligatoire",
      this.validator,
      super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      textInputAction: textInputAction,
      onTap: onTap,
      textCapitalization: textCapitalization,
      keyboardType: keyboardType,
      onChanged: onChanged,
      enabled: enabled,
      decoration: InputDecoration(
        labelStyle: labelStyle,
        hintStyle: hintStyle,
        filled: filled,
        fillColor: fillColor,
        labelText: labelText,
        hintText: hintText,
        suffix: suffix,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        counterText: counterText,
        prefix: prefix,
        enabledBorder: border ?? FieldBorder.enabled,
        border: border ?? FieldBorder.enabled,
        errorBorder: errorBorder ?? FieldBorder.error,
        disabledBorder: disabledBorder ?? FieldBorder.disabled,
      ),
    );
  }
}
