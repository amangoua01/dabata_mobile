import 'package:dabata_mobile/tools/constants/app_colors.dart';
import 'package:flutter/material.dart';

abstract class FieldBorder {
  static final enabled = OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: const BorderSide(
      color: AppColors.enableBorderTextFieldColor,
    ),
  );
  static final focused = OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: const BorderSide(
      color: AppColors.enableBorderTextFieldColor,
      width: 2,
    ),
  );

  static final error = OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: const BorderSide(
      color: Colors.red,
    ),
  );

  static final disabled = OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: const BorderSide(
      color: Colors.grey,
    ),
  );

  static final enabledSearch = OutlineInputBorder(
    borderRadius: BorderRadius.circular(33),
    borderSide: const BorderSide(
      color: AppColors.enableBorderTextFieldColor,
    ),
  );
}
