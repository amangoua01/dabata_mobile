import 'package:dabata_mobile/tools/components/field_border.dart';
import 'package:dabata_mobile/tools/constants/app_colors.dart';
import 'package:dabata_mobile/tools/extensions/types/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CTextFormField extends StatelessWidget {
  final bool autofocus;
  final bool require;
  final int? minLines;
  final int? maxLines;
  final bool? enabled;
  final int? maxLength;
  final String? hintText;
  final String? labelText;
  final bool obscureText;
  final String? requireText;
  final TextStyle? labelStyle;
  final EdgeInsetsGeometry? margin;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final EdgeInsetsGeometry? contentPadding;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool readOnly;
  final TextAlign textAlign;
  final String obscuringCharacter;
  final TextStyle? style;
  final bool? filled;
  final Color? fillColor;
  final Widget? label;
  final Widget? prefix;
  final Widget? suffix;
  final String? initialValue;
  final void Function()? onTap;
  final InputBorder? border;
  final InputBorder? errorBorder;
  final InputBorder? disabledBorder;
  final String? counterText;
  final void Function(String)? onChanged;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;

  const CTextFormField({
    this.margin,
    this.textInputAction,
    this.suffixIcon,
    this.prefixIcon,
    this.label,
    this.require = false,
    this.onChanged,
    this.enabled,
    this.hintText,
    this.maxLines,
    this.labelStyle = const TextStyle(color: AppColors.primary),
    this.suffix,
    this.prefix,
    this.minLines,
    this.labelText,
    this.validator,
    this.maxLength,
    this.controller,
    this.counterText = "",
    this.obscureText = false,
    this.requireText = "Ce champ est obligatoire",
    this.keyboardType,
    this.contentPadding = const EdgeInsets.all(8),
    this.autofocus = false,
    this.readOnly = false,
    this.textAlign = TextAlign.start,
    this.obscuringCharacter = '•',
    this.style = const TextStyle(fontSize: 13),
    this.fillColor = Colors.white,
    this.filled = true,
    super.key,
    this.initialValue,
    this.onTap,
    this.border,
    this.errorBorder,
    this.disabledBorder,
    this.textCapitalization = TextCapitalization.none,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        maxLength: maxLength,
        cursorColor: Colors.black,
        minLines: minLines,
        enabled: enabled,
        readOnly: readOnly,
        initialValue: initialValue,
        textCapitalization: textCapitalization,
        onTap: onTap,
        autofocus: autofocus,
        textAlign: textAlign,
        onChanged: onChanged,
        inputFormatters: inputFormatters,
        obscuringCharacter: obscuringCharacter,
        textInputAction: textInputAction,
        validator: (text) {
          if (validator != null) return validator!(text);
          if (require && text.isEmpty) return requireText;
          return null;
        },
        style: style,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          prefix: prefix,
          hintText: hintText,
          suffix: suffix,
          counterText: counterText,
          labelText: labelText,
          label: label,
          contentPadding: contentPadding,
          border: border ?? FieldBorder.enabled,
          enabledBorder: border ?? FieldBorder.enabled,
          errorBorder: errorBorder ?? FieldBorder.error,
          disabledBorder: disabledBorder ?? FieldBorder.disabled,
          focusedBorder: border ?? FieldBorder.focused,
          fillColor: fillColor,
          filled: filled,
          labelStyle: labelStyle,
        ),
      ),
    );
  }
}
