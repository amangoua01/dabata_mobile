import 'package:dabata_mobile/tools/components/date_time_editing_controller.dart';
import 'package:dabata_mobile/tools/widgets/inputs/c_text_form_field.dart';
import 'package:flutter/material.dart';

class CDateFormField extends StatelessWidget {
  final String? labelText;
  final bool require;
  final TextInputAction? textInputAction;
  final DateTimeEditingController? controller;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final DateTime? initialDate;
  final void Function(DateTime? date) onChange;
  final bool enabled;

  const CDateFormField({
    this.controller,
    this.enabled = true,
    required this.onChange,
    this.firstDate,
    this.lastDate,
    this.initialDate,
    this.textInputAction,
    this.require = false,
    this.labelText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CTextFormField(
      controller: controller?.textController,
      labelText: labelText,
      textInputAction: textInputAction,
      readOnly: true,
      enabled: enabled,
      require: require,
      suffixIcon: const Icon(Icons.calendar_month),
      onTap: () => showDatePicker(
        context: context,
        currentDate: controller?.date,
        initialDate: initialDate ?? DateTime.now(),
        firstDate: firstDate ?? DateTime(1950),
        lastDate: lastDate ?? DateTime(3000),
      ).then((value) => onChange(value)),
    );
  }
}
