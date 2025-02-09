import 'dart:async';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class CDropDownFormField<T> extends StatelessWidget {
  final String? labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final InputBorder? border;
  final TextEditingController? controller;
  final bool require;
  final String? hintText;
  final EdgeInsetsGeometry? margin;
  final void Function(T?)? onChanged;
  final int? maxLines;

  final T? selectedItem;
  final bool enabled;
  final String Function(T)? itemAsString;
  final Future<List<T>> Function()? asyncItems;
  final PopupProps<T> popupProps;
  final bool Function(T, T)? compareFn;
  final bool Function(T, String)? filterFn;
  final FutureOr<List<T>> Function(String, LoadProps?)? items;

  const CDropDownFormField(
      {this.controller,
      this.filterFn,
      this.compareFn,
      this.selectedItem,
      this.asyncItems,
      this.enabled = true,
      this.itemAsString,
      this.popupProps = const PopupProps.menu(),
      this.items,
      this.maxLines = 1,
      this.onChanged,
      this.margin = const EdgeInsets.only(bottom: 10),
      this.border,
      this.require = false,
      this.prefixIcon,
      this.suffixIcon,
      this.labelText,
      this.hintText,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: DropdownSearch<T>(
        onChanged: onChanged,
        enabled: enabled,
        // items: asyncItems,
        filterFn: filterFn,
        itemAsString: itemAsString,
        items: items,
        selectedItem: selectedItem,
        popupProps: popupProps,
        compareFn: compareFn,
        validator: (value) {
          if (require && value == null) {
            return "Ce champ est obligatoire";
          }
          return null;
        },
        // dropdownDecoratorProps: DropDownDecoratorProps(
        //   dropdownSearchDecoration: InputDecoration(
        //     suffixIcon: suffixIcon,
        //     labelText:
        //         (require && labelText != null) ? "$labelText*" : labelText,
        //     hintText: (require && hintText != null) ? "$hintText" : hintText,
        //     prefixIcon: prefixIcon,
        //     filled: true,
        //     errorBorder: border ?? FieldBorder.error,
        //     focusedBorder: border ?? FieldBorder.enabled,
        //     enabledBorder: border ?? FieldBorder.enabled,
        //     border: border ?? FieldBorder.enabled,
        //   ),
        // ),
      ),
    );
  }
}
